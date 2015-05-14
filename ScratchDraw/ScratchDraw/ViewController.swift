//
//  ViewController.swift
//  ScratchDraw
//
//  Created by Reed Carson on 5/14/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func strokeSize(sender: UISlider) {
   
        let width = sender.value 
        
        scratchPad.lineSize = Double(width)
        scratchPad.setNeedsDisplay()
        }
    
    @IBAction func changeFill(sender: UIButton) {
   
    
       if let fColor = sender.backgroundColor {
            
            scratchPad.fillColor = fColor
        }
    
    
    }
    

    
    
    @IBAction func Undo(sender: UIButton) {
        
        if scratchPad.scratches.count > 0 {
        
        var removedLine = scratchPad.scratches.removeLast()
            
            scratchPad.setNeedsDisplay()
            
        }
        
    }
    
    
    @IBAction func changeColor(sender: UIButton) {
        
        if let color = sender.backgroundColor {
        scratchPad.currentColor = color
        
        }
    }
    
   
    
    
    
   
    
    @IBOutlet weak var clearVisual: UIButton!
    
    @IBAction func clearLines(sender: AnyObject) {
   
    scratchPad.scratches = []
        scratchPad.setNeedsDisplay()    
    
    }
    
    
    
    
    
    
    @IBOutlet weak var scratchPad: ScratchView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.addSubview(scratchPad)
//        scratchPad.frame = view.frame
//        scratchPad.backgroundColor = UIColor.redColor()
        clearVisual.layer.cornerRadius = 10
        clearVisual.alpha = 0.5

    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        if let touch = touches.first as? UITouch {
            
            let location = touch.locationInView(scratchPad)
            
            scratchPad.newScratchWithStartPoint(location)
            
        }
        
    }
    
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        if let touch = touches.first as? UITouch {
            
            let location = touch.locationInView(scratchPad)
//            scratchPad.updateCurrentScratchWithLastPoint(location)
            scratchPad.addPointToCurrentScratch(location)
            
        }
        
    }
    

    
}

