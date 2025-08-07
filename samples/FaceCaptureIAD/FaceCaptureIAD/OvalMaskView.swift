//
//  OvalMaskView.swift
//
//
import UIKit

final class OvalMaskView: UIView {

    private var ovalLayer = CAShapeLayer()
    private let tagMask = 409
    
    var color: UIColor = .white
    
    func color(_ color: UIColor) {
        if color != self.color {            
            self.color = color
            self.setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let ovalPath = UIBezierPath(ovalIn: CGRect(x: 20, y: 100, width: rect.width - 2 * 20, height: rect.height * 0.55))
        ovalLayer = CAShapeLayer()
        ovalLayer.path = ovalPath.cgPath
        ovalLayer.fillColor = UIColor.clear.cgColor
        ovalLayer.strokeColor = color.withAlphaComponent(0.8).cgColor
        ovalLayer.lineWidth = 5
                
        layer.addSublayer(ovalLayer)

        let outOvalPath = UIBezierPath(rect: bounds)
        outOvalPath.append(ovalPath)
        let outOvalLayer = CAShapeLayer()
        outOvalLayer.path = outOvalPath.cgPath
        outOvalLayer.fillRule = .evenOdd

        // Set mask and background color and opacity
        let maskView = UIView(frame: bounds)
        maskView.tag = tagMask
        maskView.layer.mask = outOvalLayer
        maskView.backgroundColor = .clear.withAlphaComponent(0.4)
        
        // Only add once
        if viewWithTag(tagMask) == nil {
            addSubview(maskView)
        }
    }
}
