//
//  extensions.swift
//  MainApp
//
//  Created by Viraj Joshi on 19/04/24.
//

import Foundation
import UIKit

extension UIView {
    func addGradientBorder(colors: [UIColor], width: CGFloat = 1) {
        let gradientLayer = CAGradientLayer()
               gradientLayer.frame = bounds
               gradientLayer.colors = colors.map { $0.cgColor }
               gradientLayer.startPoint = CGPoint(x: 0, y: 0)
               gradientLayer.endPoint = CGPoint(x: 1, y: 1)

        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = width * 2
        shapeLayer.path = UIBezierPath(rect: bounds).cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.clear.cgColor
        gradientLayer.mask = shapeLayer
        
        layer.addSublayer(gradientLayer)
        layer.masksToBounds = true
    }
    
    func addShadow(shadowColor:UIColor = UIColor(red: 00, green: 00, blue: 00, alpha: 1), shadowOpacity: Float = 0.3, shadowRadius: CGFloat? = 4, shadowOffset: CGSize = CGSize(width: 0, height: 4))
    {
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = shadowOpacity
        if let getShadowRadius = shadowRadius {
            self.layer.shadowRadius = getShadowRadius
        }
    }
    
    func setCustomCornerRadius(radius : CGFloat, borderColor : UIColor = .clear, borderWidth : CGFloat = 0) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.clipsToBounds = true
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        self.layoutIfNeeded()
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

extension UIImageView {
        func roundUpperCorners(radius: CGFloat) {
            let maskPath = UIBezierPath(roundedRect: bounds,
                                        byRoundingCorners: [.topRight, .topLeft],
                                        cornerRadii: CGSize(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = bounds
            maskLayer.path = maskPath.cgPath
            layer.mask = maskLayer
        }
}
