//
//  GameView.swift
//  GameOfChaos
//
//  Created by 1 on 15.03.2021.
//

import UIKit

class GameView: UIView {

        override func draw(_ rect: CGRect) {
    
            let dotSize:CGFloat = 1
            let rectA = CGRect(x: (bounds.width - dotSize / 2), y: 0, width: dotSize, height: dotSize)
            let rectB = CGRect(x: bounds.width - dotSize, y: bounds.height - dotSize, width: dotSize, height: dotSize)
            let rectC = CGRect(x: 0, y: bounds.height - dotSize, width:dotSize, height: dotSize)
    
            let dotA = UIBezierPath(ovalIn: rectA)
            UIColor.black.setFill()
            dotA.fill()
            let dotB = UIBezierPath(ovalIn: rectB)
            dotB.fill()
            let dotC = UIBezierPath(ovalIn: rectC)
            dotC.fill()
            var x = CGFloat.random(in: 0..<bounds.width - dotSize)
            var y = CGFloat.random(in: 0..<bounds.height - dotSize)
    
            let randomDot = UIBezierPath(ovalIn: CGRect(x: x, y: y, width: dotSize, height: dotSize))
            UIColor.magenta.setFill()
            randomDot.fill()
    
            func drawDots() {
                let r = Int.random(in: 0...2)
                if r == 0 {
                    x = (x + rectA.minX)/2
                    y = (y + rectA.minY)/2
                    let rect = CGRect(x: x, y: y, width: dotSize, height: dotSize)
                    drawNewDot(rect)
                } else if r == 1 {
                    x = (x + rectB.minX)/2
                    y = (y + rectB.minY)/2
                    let rect = CGRect(x: x, y: y, width: dotSize, height: dotSize)
                    drawNewDot(rect)
                } else if r == 2 {
                    x = (x + rectC.minX)/2
                    y = (y + rectC.minY)/2
                    let rect = CGRect(x: x, y: y, width: dotSize, height: dotSize)
                    drawNewDot(rect)
                }
            }
            for _ in 0...10000 {
                drawDots()
            }
    
    
        }
        func drawNewDot(_ rect: CGRect) {
    
            let dot = UIBezierPath(ovalIn: rect)
            UIColor.purple.setFill()
            dot.fill()
        }
}
