//
//  ViewController.swift
//  ScratchDraw
//
//  Created by Reed Carson on 5/14/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
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
    
    @IBOutlet weak var strokeVisual: UIButton!
    @IBOutlet weak var clearVisual: UIButton!
    @IBAction func clearLines(sender: AnyObject) {
        scratchPad.scratches = []
        scratchPad.setNeedsDisplay()
        
    }
    

    @IBOutlet weak var scratchPad: ScratchView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearVisual.layer.cornerRadius = 10
        clearVisual.alpha = 0.5
        strokeVisual.layer.cornerRadius = 10
    }
    
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
    
    
    
}

