//
//  ViewController.swift
//  ScratchDraw
//
//  Created by Reed Carson on 5/14/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let brushOptionsButton: RoundButton = RoundButton()
    
  
    @IBOutlet weak var scratchPad: ScratchView!
    
    @IBOutlet weak var AlphaSlider: Slider!
    @IBOutlet weak var StrokeSlider: Slider!
    
    
   
    
    
    
    @IBAction func changeColor(sender: UIButton) {
        if let color = sender.backgroundColor {
            scratchPad.currentColor = color
            
        }
    }
    
    
    @IBAction func ChangeShape(sender: UIButton) {
        
        if let text = sender.titleLabel?.text {
            switch text {
            case "Line": scratchPad.currentShapeType = ScratchType.Line
            case "Triangle": scratchPad.currentShapeType = ScratchType.Triangle
            case "Rectangle": scratchPad.currentShapeType = ScratchType.Rect
            case "Ellipse": scratchPad.currentShapeType = ScratchType.Ellipse
            default: print("invalid shape type")
            }
        }
        
        
        
    }
    
    @IBAction func clearLines(sender: AnyObject) {
        scratchPad.scratches = []
        scratchPad.setNeedsDisplay()
        
    }
    
    @IBAction func undoButtonAction(sender: UIButton) {
        scratchPad.undoScratch()
        
        
    }
    
    @IBAction func adjustAlpha(sender: UISlider) {
        scratchPad.currentAlpha = CGFloat(AlphaSlider.value)
        
    }
    
    @IBAction func adjustStroke(sender: UISlider) {
        scratchPad.currentSize = CGFloat(StrokeSlider.value)
        
    }
    

    
    
    // MARK: UITouch functions
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first as UITouch? {
            
            let location = touch.locationInView(scratchPad)
            
            scratchPad.newScratchWithStartPoint(location)
                        
        }
        
    }
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first as UITouch? {
            
            let location = touch.locationInView(scratchPad)
            
            if scratchPad.currentShapeType == ScratchType.Line {
                scratchPad.addPointToCurrentScratch(location)
                
            } else {
                scratchPad.updateCurrentScratchWithLastPoint(location)
                
            }
            
        }
        
    }
    
    
    
    // MARK: Configure UI Elements
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButtons()
        configureSliders()
        scratchPad.currentSize = CGFloat(StrokeSlider.value)
        
    }
    
    
    func configureSliders() {
        AlphaSlider.minimumValue = 0
        AlphaSlider.maximumValue = 1
        AlphaSlider.value = 1
        
        StrokeSlider.minimumValue = 1
        StrokeSlider.maximumValue = 40
        StrokeSlider.value = 20
    }
    
    func configureButtons() {
        
        let brushOptionsSize = brushOptionsButton.buttonSize
        let brushOptionsPosition = CGPointMake(brushOptionsSize.width*2,brushOptionsSize.height*2)
        
        //scratchPad.frame = CGRectMake(view.frame.width/2, view.frame.height/2, view.bounds.width, view.bounds.height)
        
        
        brushOptionsButton.frame = CGRectMake(brushOptionsPosition.x, brushOptionsPosition.y, brushOptionsSize.width, brushOptionsSize.height)
        //        brushOptionsButton.backgroundColor = UIColor.redColor()
        
        //view.addSubview(scratchPad)
        //        view.addSubview(brushOptionsButton)
        
        
    }
    
    
}

