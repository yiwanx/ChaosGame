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
    var numberOfSides = 3
    lazy var initialDots = getInitialDots()
    var x: CGFloat!
    var y: CGFloat!
    init(_ bounds: CGRect, _ dotSize: CGFloat, for numberOfSides: Int) {
        self.bounds = bounds
        self.numberOfSides = numberOfSides
        self.dotSize = dotSize
        
        //Coordinates of the random dot
        x = CGFloat.random(in: 0..<bounds.width - dotSize)
        y = CGFloat.random(in: 0..<bounds.height - dotSize)
    }
    
    //Calculate initial dots (or coordinates of vertices of a polygon with n sides) .
    func getInitialDots() -> [CGRect] {
        
        let r = min(bounds.width, bounds.height) / 2
        
        let baseTheta = 2 * .pi / CGFloat(numberOfSides)
        let offset = numberOfSides % 2 == 0 ? baseTheta / 2 : .pi / 2
    
        let center = (x: bounds.midX, y: bounds.midY)
        let vertices = (0 ..< numberOfSides).map { i -> CGRect in
            let theta = CGFloat(i) * baseTheta + offset
            let x = r * cos(theta) + center.x
            let xFormatted = x >= bounds.maxX ? bounds.maxX - dotSize : x
            let y = r * sin(theta) + center.y
            // perform rotation on Y
            let absY = abs(y - bounds.height)
            let yFormatted = absY >= bounds.maxY ? bounds.maxY - dotSize : absY
            
        return CGRect(x: xFormatted, y: yFormatted, width: dotSize, height: dotSize)
        }
        return vertices
    }
    //Calculate all other points
    func createRectForDot()->CGRect {
        
        let r = Int.random(in: 0..<numberOfSides)
        x = (x + initialDots[r].minX)/2
        y = (y + initialDots[r].minY)/2
        let rect = CGRect(x: x, y: y, width: dotSize, height: dotSize)
        return rect
    }
}

