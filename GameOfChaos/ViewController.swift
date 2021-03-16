//
//  ViewController.swift
//  GameOfChaos
//
//  Created by 1 on 15.03.2021.
//

import UIKit

class ViewController: UIViewController {
    var gameModel: GameModel!
    
    var displayLink:CADisplayLink?
    
    var first = true
    @IBOutlet var gameView: GameView! {
        didSet {
           
            gameModel = GameModel(gameView.bounds, 2)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func drawTapped(_ sender: UIButton) {

        
                let link = CADisplayLink(target: self, selector: #selector(addForDrawing))
                link.add(to: .main, forMode: .default)
                displayLink = link
    }
    @objc func addForDrawing() {
        
    
        if first {
            gameView.rectForDots = gameModel.getInitialDots()
            first = false
            
        } else {
            let rect =  gameModel.createRectForDot()
            gameView.rectForDots.append(rect)
            gameView.layer.setNeedsDisplay(rect)
        }
        
    }
}
