//
//  GameModel.swift
//  GameOfChaos
//
//  Created by 1 on 15.03.2021.
//

import UIKit

class GameModel {
    let bounds: CGRect
    let dotSize: CGFloat
    var rects = [CGRect]()
    let rectA:CGRect!
    let rectB:CGRect!
    let rectC:CGRect!
    var x: CGFloat!
    var y: CGFloat!
    init(_ bounds: CGRect, _ dotSize: CGFloat) {
        self.bounds = bounds
        self.dotSize = dotSize
        rectA = CGRect(x: (bounds.width - dotSize) / 2, y: 0, width: dotSize, height: dotSize)
        rectB = CGRect(x: bounds.width - dotSize, y: bounds.height - dotSize, width: dotSize, height: dotSize)
        rectC = CGRect(x: 0, y: bounds.height - dotSize, width:dotSize, height: dotSize)
        x = CGFloat.random(in: 0..<bounds.width - dotSize)
        y = CGFloat.random(in: 0..<bounds.height - dotSize)
    }
    func getInitialDots() -> [CGRect] {
        return [rectA,rectB,rectC]
    }
    func createRectForDot()->CGRect {
        let r = Int.random(in: 0...2)
        if r == 0 {
            x = (x + rectA.minX)/2
            y = (y + rectA.minY)/2
            let rect = CGRect(x: x, y: y, width: dotSize, height: dotSize)
            return rect
        } else if r == 1 {
            x = (x + rectB.minX)/2
            y = (y + rectB.minY)/2
            let rect = CGRect(x: x, y: y, width: dotSize, height: dotSize)
            return rect
        } else {
            x = (x + rectC.minX)/2
            y = (y + rectC.minY)/2
            let rect = CGRect(x: x, y: y, width: dotSize, height: dotSize)
            return rect
        }
    }
}
