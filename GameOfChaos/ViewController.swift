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
    
    @IBOutlet var dotWidthSlider: UISlider!
    @IBOutlet var dotWidthLabel: UILabel!
    var first = true
    var dotWidth: Float = 1.00
    @IBOutlet var gameView: GameView! {
        didSet {
          
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
    }

    @IBAction func dotWidthSliderAction(_ sender: UISlider) {
        dotWidth = round(sender.value*100)/100
        dotWidthLabel.text = "Dot width: \(round(sender.value*100)/100)"
    }
    @IBAction func clearTapped(_ sender: UIButton) {
        
        displayLink?.invalidate()
        displayLink = nil
        gameView.clearRectForDots()
        gameView.clearImage()
        gameView.setNeedsDisplay()
        
    }
    @IBAction func drawLinkTapped(_ sender: UIButton) {
        if displayLink == nil {
            gameModel = GameModel(gameView.bounds, CGFloat(dotWidth))

            let link = CADisplayLink(target: self, selector: #selector(addForDrawing))
            link.add(to: .main, forMode: .common)
            displayLink = link
        }
       
    }
    @objc func addForDrawing() {
        if first {
            gameView.rectForDots = gameModel.getInitialDots()
            first = false
            
        } else {
            
            let rect = gameModel.createRectForDot()
            gameView.rectForDots.append(rect)
            gameView.layer.setNeedsDisplay(rect)
            gameView.checkIfTooManyPointsIn()
            
        }
        
    }
    

    

}
