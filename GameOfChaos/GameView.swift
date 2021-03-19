//
//  GameView.swift
//  GameOfChaos
//
//  Created by 1 on 15.03.2021.
//

import UIKit

class GameView: UIImageView {
    
    var drawingLayer: CALayer?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        isUserInteractionEnabled = true
        
    }
    
    
    func drawBezier(_ rectForDot: CGRect) {
        setupDrawingLayerIfNeeded()
        let dot = CAShapeLayer()
        let dotPath = UIBezierPath(ovalIn: rectForDot)
        dot.contentsScale = UIScreen.main.scale
        
        dot.path = dotPath.cgPath
        dot.fillColor = UIColor.black.cgColor
        dot.opacity = 1
        
        drawingLayer?.addSublayer(dot)
        
        if let count = drawingLayer?.sublayers?.count, count > 400 {
            flattenToImage()
        }
    }

    func flattenToImage() {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        if let context = UIGraphicsGetCurrentContext() {
            
            // keep old drawings
            if let image = self.image {
                image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
            }
            
            // add new drawings
            drawingLayer?.render(in: context)
            
            let output = UIGraphicsGetImageFromCurrentImageContext()
            self.image = output
        }
        clearSublayers()
        UIGraphicsEndImageContext()
    }
    func clearLayer() {
        
        clearSublayers()
        image = nil
    }
    func clearSublayers() {
        drawingLayer?.removeFromSuperlayer()
        drawingLayer = nil
    }
    func setupDrawingLayerIfNeeded() {
          guard drawingLayer == nil else { return }
          let sublayer = CALayer()
          sublayer.contentsScale = UIScreen.main.scale
          layer.addSublayer(sublayer)
          self.drawingLayer = sublayer
      }

}
