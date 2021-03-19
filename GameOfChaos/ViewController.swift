//
//  ViewController.swift
//  GameOfChaos
//
//  Created by 1 on 15.03.2021.
//
// ViewController updates GameView every frame, passing to GameView CGRects, calculated by GameModel.
import UIKit

class ViewController: UIViewController {
    var gameModel: GameModel!
    
    var displayLink:CADisplayLink?
    
    @IBOutlet var gameView: GameView!
    
    @IBOutlet var numberOfDotsLabel: UILabel!
    @IBOutlet var dotWidthLabel: UILabel!
    @IBOutlet var dotsPerFrameLabel: UILabel!
    
    var first = true
    var dotWidth: Float = 1.00
    var numberOfInitialDots: Int = 3
    var dotsPerFrame: Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    //Sliders Actions
    @IBAction func numberOfDotsSliderAction(_ sender: UISlider) {
        numberOfDotsLabel.text = "Number of Initial Dots: \(Int(sender.value))"
        numberOfInitialDots = (Int(sender.value))
    }
    @IBAction func dotWidthSliderAction(_ sender: UISlider) {
        dotWidth = round(sender.value*100)/100
        dotWidthLabel.text = "Dot width: \(round(sender.value*100)/100)"
        
    }
    @IBAction func dotPerFrameSliderAction(_ sender: UISlider) {
        dotsPerFrameLabel.text = "Dots Per Frame: \(Int(sender.value))"
        dotsPerFrame = (Int(sender.value))
    }
    
    //Buttons Actions
    @IBAction func clearTapped(_ sender: UIButton) {
        displayLink?.invalidate()
        displayLink = nil
        gameView.clearLayer()
    }
    @IBAction func drawLinkTapped(_ sender: UIButton) {
        if displayLink == nil {
            //Create model which calculates points
            gameModel = GameModel(gameView.bounds, CGFloat(dotWidth), for: numberOfInitialDots)
            //Syncronize frame update and creation of dots
            let link = CADisplayLink(target: self, selector: #selector(addForDrawing))
            link.add(to: .main, forMode: .default)
            displayLink = link
        }
       
    }
    

    @objc func addForDrawing() {
        if first {
            //Pass rects to GameView to draw initial dots
            var rectsToDraw = [CGRect]()
            gameModel.getInitialDots().forEach { rect in
                rectsToDraw.append(rect)
            }
            gameView.drawCALayer(rectsToDraw)
            gameView.flattenToImage()
            first = false
            
        } else {
            //Pass rects to GameView to draw "random" dots
            var rectsToDraw = [CGRect]()
            for _ in 0..<dotsPerFrame {
                rectsToDraw.append(gameModel.createRectForDot())
            }
            gameView.drawCALayer(rectsToDraw)
            
        }
        
    }
    

    

}
