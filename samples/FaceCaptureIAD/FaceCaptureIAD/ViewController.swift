//
//  ViewController.swift
//
//  Created by Mortensen, Jonny on 10/23/24.
//

import UIKit
import DaonFaceSDK
import DaonFaceCapture

class ViewController: UIViewController {

    @IBOutlet var captureButton: UIButton!
    @IBOutlet var optionsButton: UIButton!
    @IBOutlet var imageView : UIImageView!
    @IBOutlet var messageLabel : UILabel!
    
    var controller: DFSCameraController?
    
    // Options
    var optionMedicalMaskDetection: Bool = false
    var optionHighQuality: Bool = false
    var optionDeviceUprightDetection: Bool = false
    var optionConfirmPhoto: Bool = true
    var optionShowOval: Bool = false
    var optionAutoCapture: Bool = true
    var optionAlwaysFail: Bool = false
    var optionCustomView: Bool = false
    
    // Custom view support
    var startButton: UIButton? = nil
    var retryButton: UIButton? = nil
    var confirmButton: UIButton? = nil
    var statusLabel: UILabel? = nil
    var busyIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
    
    var oval = OvalMaskView()
    
    var image: UIImage?
    var data: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(willResignActive),
                                               name: UIApplication.willResignActiveNotification, object: nil)
        // Create capture controller
        controller = DFSCameraController()
        controller?.delegate = self
    }

    @objc func willResignActive() {
        controller?.stopCapture()
    }
    
    @IBAction func optionsButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Options", message: nil, preferredStyle: .actionSheet)
        
        let on = optionMedicalMaskDetection ? "On" : "Off"
        let maskAction = UIAlertAction(title: "Medical mask: \(on)", style: .default) { _ in
            self.optionMedicalMaskDetection = !self.optionMedicalMaskDetection
        }
        
        let quality = optionHighQuality ? "High" : "Low"
        let qualityAction = UIAlertAction(title: "Quality: \(quality)", style: .default) { _ in
            self.optionHighQuality = !self.optionHighQuality
        }
        
        let upright = optionDeviceUprightDetection ? "On" : "Off"
        let uprightAction = UIAlertAction(title: "Upright detection: \(upright)", style: .default) { _ in
            self.optionDeviceUprightDetection = !self.optionDeviceUprightDetection
        }
        
        let confirm = optionConfirmPhoto ? "Yes" : "No"
        let confirmAction = UIAlertAction(title: "Confirm photo: \(confirm)", style: .default) { _ in
            self.optionConfirmPhoto = !self.optionConfirmPhoto
        }
        
        let oval = optionShowOval ? "Yes" : "No"
        let showOvalAction = UIAlertAction(title: "Show oval: \(oval)", style: .default) { _ in
            self.optionShowOval = !self.optionShowOval
        }
        
        let captureMode = optionAutoCapture ? "Auto" : "Manual"
        let captureModeAction = UIAlertAction(title: "Capture mode: \(captureMode)", style: .default) { _ in
            self.optionAutoCapture = !self.optionAutoCapture
        }
        
        let fail = optionAlwaysFail ? "Yes" : "No"
        let failAction = UIAlertAction(title: "Always fail: \(fail)", style: .default) { _ in
            self.optionAlwaysFail = !self.optionAlwaysFail
        }
        
        let customView = optionCustomView ? "Yes" : "No"
        let customViewAction = UIAlertAction(title: "Custom view: \(customView)", style: .default) { _ in
            self.optionCustomView = !self.optionCustomView
            self.optionShowOval = false
        }
                        
        alert.addAction(maskAction)
        alert.addAction(qualityAction)
        alert.addAction(uprightAction)
        alert.addAction(confirmAction)
        if !self.optionCustomView {
            alert.addAction(showOvalAction)
        }
        alert.addAction(captureModeAction)
        alert.addAction(failAction)
        alert.addAction(customViewAction)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.show(alert, sender: self)
    }
        
    @IBAction func captureButtonTapped(_ sender: Any) {
        
        // Set options
        controller?.setQuality(optionHighQuality ? DFSCameraController.Quality.high : DFSCameraController.Quality.low)
        controller?.setMedicalMaskDetection(optionMedicalMaskDetection)
        controller?.setDeviceUprightDetection(optionDeviceUprightDetection)
        controller?.setAllowConfirmation(optionConfirmPhoto)
        controller?.setParameters([kDFSConfigQualityThresholdEyeDistanceKey: 150])
        controller?.showOverlay(optionShowOval)
        controller?.setCaptureMode(optionAutoCapture ? .automatic : .manual)
        controller?.showMessages(!optionCustomView)
        controller?.setPresentationStyle(optionCustomView ? .fullScreen : .automatic)
        
        controller?.settings.assessmentDelay = 0.75
        controller?.settings.enhancedDetection = false

        // Start capture
        controller?.startCapture(self, completion: { image, data, error in
            
            if let error {
                self.messageLabel.text = "Error: \(error.localizedDescription)"
                self.controller?.stopCapture()
            } else {
                
                if self.optionCustomView {
                    self.image = image
                    self.data = data
                    
                    // Custom view button logic
                    self.retryButton?.isHidden = false
                    self.confirmButton?.isHidden = false
                    self.statusLabel?.isHidden = true
                    
                } else {
                    self.showResult(image: image, data: data)
                }
            }
        })
    }
    
    func showResult(image: UIImage?, data: Data?) {
        
        if let img = image, let payload = data {
            showPayloadInfo(image: img, data: payload)
            
            print("Submit image to server ...")
            
            DispatchQueue.global(qos: .userInitiated).async {
                sleep(3)

                if self.optionAlwaysFail {
                    self.controller?.setCaptureFailed(message: "Failed", allowRetake: true)
                } else {
                    self.controller?.setCaptureCompleted(message: "Success") {
                        print("capture completed")
                    }
                }
            }
        }
        
        self.imageView.image = image
    }
    
    func showPayloadInfo(image: UIImage, data: Data) {
        let megabytes = Double(data.count) / (1000 * 1000)
        self.messageLabel.text = "IAD Payload: \(String(format: "%.2f MB", megabytes))\nPhoto: \(Int(image.size.width)) x \(Int(image.size.height))"
    }
    
    // CUSTOM VIEW
    //
    // Custom view support code.
    //
    // Not used if custom view is not set.
    //
    // - customView()
    // - createButton()
    // - startButtonClicked()
    // - confirmButtonClicked()
    // - retryButtonClicked()
    // - cancelButtonClicked
    //
    // Implements the DFSCameraControllerDelegate
        
    private func createCustomView(frame: CGRect) -> UIView {
        let customViewContainer = UIView()
        customViewContainer.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        customViewContainer.frame = CGRect(x: 0, y: 0, width: frame.width, height:frame.height)
                        
        oval.frame = CGRect(x: 0, y: 0, width: frame.width, height:frame.height)
                
        let buttonXOffset = 20
        let buttonYOffset = 40
        let buttonY = Int(frame.height * 3/4) + buttonYOffset
        
        let buttonHeight = 40
        let buttonWidth = 140
        
        statusLabel = UILabel()
        statusLabel?.text = "Get ready to capture your face"
        statusLabel?.frame = CGRect(x: 0, y: buttonY, width: Int(view.frame.width) - 100, height: 60)
        statusLabel?.center.x = view.center.x
        statusLabel?.textAlignment = .center
        statusLabel?.numberOfLines = 3
        statusLabel?.lineBreakMode = .byWordWrapping
        statusLabel?.textColor = .white
        statusLabel?.layer.masksToBounds = true
        statusLabel?.layer.cornerRadius = 8
        statusLabel?.backgroundColor = .black.withAlphaComponent(0.5)
        statusLabel?.isHidden = !optionAutoCapture
        
        startButton = createButton(title: "Start",
                                   color: .systemBlue,
                                   x: 0,
                                   y: buttonY,
                                   width: buttonWidth,
                                   height: buttonHeight)
        startButton?.center.x = view.center.x
        
        startButton?.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
        startButton?.isHidden = optionAutoCapture
        
        retryButton = createButton(title: "Retry",
                                   color: .systemBlue,
                                   x: Int(view.frame.minX) + buttonXOffset,
                                   y: buttonY,
                                   width: buttonWidth,
                                   height: buttonHeight)
        retryButton?.addTarget(self, action: #selector(retryButtonClicked), for: .touchUpInside)
        retryButton?.isHidden = true

        confirmButton = createButton(title: "Confirm",
                                     color: .systemGreen,
                                     x: Int(view.frame.maxX) - buttonWidth - buttonXOffset,
                                     y: buttonY,
                                     width: buttonWidth,
                                     height: buttonHeight)
        confirmButton?.addTarget(self, action: #selector(confirmButtonClicked), for: .touchUpInside)
        confirmButton?.isHidden = true
        
        let cancelButton = createButton(title: "X",
                                     color: .systemGray,
                                     x: Int(view.frame.minX) + buttonXOffset,
                                     y: buttonHeight,
                                     width: buttonWidth / 2,
                                     height: buttonHeight)
        cancelButton.addTarget(self, action: #selector(cancelButtonClicked), for: .touchUpInside)
        
        busyIndicator.center = view.center
        busyIndicator.frame.origin.y = CGFloat(buttonY)
        busyIndicator.color = .white
        
        customViewContainer.addSubview(oval)
        customViewContainer.addSubview(busyIndicator)
        customViewContainer.addSubview(statusLabel!)
        customViewContainer.addSubview(startButton!)
        customViewContainer.addSubview(retryButton!)
        customViewContainer.addSubview(confirmButton!)
        customViewContainer.addSubview(cancelButton)
        
        return customViewContainer
    }
    
    private func createButton(title: String, color: UIColor, x: Int, y: Int, width: Int, height: Int) -> UIButton {
        
        let button = UIButton(frame: CGRect(x: x, y: y, width: width, height: height))
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black.withAlphaComponent(0.5)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = color.cgColor
        
        return button
    }
    
    @IBAction func startButtonClicked() {
        debugPrint("Custom start button was clicked.")
                
        startButton?.isHidden = true
        statusLabel?.isHidden = false
        
        controller?.reset()
    }
    
    @IBAction func confirmButtonClicked() {
        debugPrint("Custom confirm button was clicked.")
        
        if let img = self.image, let data = self.data {
            showPayloadInfo(image: img, data: data)
            
            print("Submit image to server ...")
            
            self.busyIndicator.startAnimating()
            self.retryButton?.isHidden = true
            self.confirmButton?.isHidden = true
            
            DispatchQueue.global(qos: .userInitiated).async {
                sleep(3)
                
                DispatchQueue.main.async {
                    self.busyIndicator.stopAnimating()
                }
                
                self.controller?.stopCapture()
            }
        }
        
        self.imageView.image = image
    }
    
    @IBAction func retryButtonClicked() {
        debugPrint("Custom retry button was clicked.")
                
        self.retryButton?.isHidden = true
        self.confirmButton?.isHidden = true
        self.statusLabel?.isHidden = false
        self.statusLabel?.text = "Get ready to capture your face again"
        
        controller?.reset()
    }
    
    @IBAction func cancelButtonClicked() {
        debugPrint("Custom cancel button was clicked.")
        
        controller?.stopCapture()
    }
}

extension ViewController : DFSCameraControllerDelegate {
    func cameraControllerDidUpdate(message: String, image: UIImage?) {
        // Custom view status messages
        statusLabel?.text = message
    }
    
    func cameraControllerDidUpdate(result: DaonFaceCapture.Result, image: UIImage) {
        DispatchQueue.main.async {
            var ok = result.hasAcceptableQuality && result.isFaceCentered
            if self.optionDeviceUprightDetection {
                ok = ok && result.isDeviceUpright
            }
            
            if ok {
                self.oval.color(.systemGreen)
            } else {
                self.oval.color(.systemRed)
            }
        }
    }
    
    func cameraControllerShouldUseView(frame: CGRect) -> UIView? {
        if optionCustomView {
            return createCustomView(frame: frame)
        }
        
        return nil
    }
}
