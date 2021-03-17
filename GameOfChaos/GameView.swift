//
//  GameView.swift
//  GameOfChaos
//
//  Created by 1 on 15.03.2021.
//

import UIKit

class GameView: UIView {
    let dotSize:CGFloat = 1
    var rectForDots = [CGRect]()
    func clearRectForDots() {
        rectForDots.removeAll()
    }
    
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {return}
        
        context.setFillColor(UIColor.black.cgColor)
        
        for rect in rectForDots {
            context.addEllipse(in: rect)
        }
        context.fillPath()
        
    }
}
