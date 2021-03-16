//
//  ViewController.swift
//  GameOfChaos
//
//  Created by 1 on 15.03.2021.
//

import UIKit

class ViewController: UIViewController {
    var gameModel: GameModel!
    @IBOutlet var gameView: GameView! {
        didSet {
            gameModel = GameModel(gameView.bounds, 1)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func drawTapped(_ sender: UIButton) {
        var first = true
        Timer.scheduledTimer(withTimeInterval: 0.0001,
                                     repeats: true) { [weak self](timer) in
            
            guard let self = self else {return}
            if first {
                self.gameView.rectForDots = self.gameModel.getInitialDots()
                first = false
            } else {
                
                self.gameView.rectForDots.append( self.gameModel.createRectForDot())
            }
            
            
            self.gameView.setNeedsDisplay()
         }
    }
    
}

