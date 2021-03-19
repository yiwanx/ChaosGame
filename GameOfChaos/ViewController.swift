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
    
    @IBOutlet var numberOfDotsLabel: UILabel!
    @IBOutlet var dotWidthSlider: UISlider!
    @IBOutlet var dotWidthLabel: UILabel!
    var first = true
    var dotWidth: Float = 1.00
    var numberOfDots: Int = 3
    @IBOutlet var gameView: GameView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
    }

    @IBAction func numberOfDotsAction(_ sender: UISlider) {
        
        numberOfDotsLabel.text = "Number of Initial Dots: \(Int(sender.value))"
        numberOfDots = (Int(sender.value))
    }
    @IBAction func dotWidthSliderAction(_ sender: UISlider) {
        dotWidth = round(sender.value*100)/100
        dotWidthLabel.text = "Dot width: \(round(sender.value*100)/100)"
    }
    @IBAction func clearTapped(_ sender: UIButton) {
        
        displayLink?.invalidate()
        displayLink = nil
        gameView.clearLayer()
        
    }
    @IBAction func drawLinkTapped(_ sender: UIButton) {
        if displayLink == nil {
            gameModel = GameModel(gameView.bounds, CGFloat(dotWidth), for: numberOfDots)

            let link = CADisplayLink(target: self, selector: #selector(addForDrawing))
            link.add(to: .main, forMode: .common)
            displayLink = link
        }
       
    }
    @objc func addForDrawing() {
        if first {
            gameModel.getInitialDots().forEach { rect in
                gameView.drawBezier(rect)
            }
            gameView.flattenToImage()
            first = false
            
        } else {
            
            let rect = gameModel.createRectForDot()
            gameView.drawBezier(rect)
            
        }
        
    }
    

    

}
