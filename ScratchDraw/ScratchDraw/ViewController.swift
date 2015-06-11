//
//  ViewController.swift
//  ScratchDraw
//
//  Created by Reed Carson on 5/14/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit

var fillColors: [UIColor] = [
UIColor.cyanColor(),
    UIColor.magentaColor(),
    UIColor.yellowColor(),
    UIColor.blackColor()
]



class ViewController: UIViewController {
    
    
    @IBAction func changeColor(sender: UIButton) {
        
        if let color = sender.backgroundColor {
        scratchPad.currentColor = color
        
        }
    }
    
    @IBAction func changeStroke(sender: UIButton) {
        
        
    
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
        
//        view.addSubview(scratchPad)
//        scratchPad.frame = view.frame
//        scratchPad.backgroundColor = UIColor.redColor()
        clearVisual.layer.cornerRadius = 10
        clearVisual.alpha = 0.5
        strokeVisual.layer.cornerRadius = 10
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
            scratchPad.updateCurrentScratchWithLastPoint(location)
//            scratchPad.addPointToCurrentScratch(location)
            
        }
        
    }
    

    
}

