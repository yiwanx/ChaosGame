//
//  GameView.swift
//  GameOfChaos
//
//  Created by 1 on 15.03.2021.
//

import UIKit

class GameView: UIView {
    var flattenedImage: UIImage?
    var rectForDots = [CGRect]()
    func clearRectForDots() {
        rectForDots.removeAll()
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else {return}
        if let image = flattenedImage {
            
            image.draw(in: self.bounds)
        }
        context.setFillColor(UIColor.black.cgColor)
        
        for rect in rectForDots {
            context.addEllipse(in: rect)
        }
        context.fillPath()
        
    }
    
    func getImageRepresentation() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size,isOpaque, 0.0)
        defer { UIGraphicsEndImageContext() }
        if let context = UIGraphicsGetCurrentContext() {
            layer.render(in: context)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            return image
        }
        return nil
    }
    func checkIfTooManyRectsIn() {
        let maxRects = 200
        if rectForDots.count > maxRects {
            flattenedImage = getImageRepresentation()
            
            rectForDots.removeFirst(maxRects - 1)
        }
    }
    func clearImage(){
        flattenedImage = nil
    }
}
