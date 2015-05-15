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
    UIColor.blackColor(),
    UIColor.redColor(),
    UIColor.greenColor(),
    UIColor.blueColor()
]


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var viewBottomConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var fillColorCollectionView: UICollectionView!

//    @IBAction func changeColor(sender: UIButton) {
//        
//        if let color = sender.backgroundColor {
//            scratchPad.currentColor = color
//            
//        }
//    }
    
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
        
        fillColorCollectionView.dataSource = self
        fillColorCollectionView.delegate = self
        
        viewBottomConstraints.constant = -300
        
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return fillColors.count
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("colorCell", forIndexPath: indexPath) as! ColorCell
        
       cell.backgroundColor = fillColors[indexPath.item]
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! ColorCell
        
        if let color = cell.backgroundColor {
           
            scratchPad.currentColor = color
            
        }
        
        
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
            scratchPad.addPointToCurrentScratch(location)
            
        }
        
    }
    
    @IBAction func collapse(sender: UIButton) {
        
        viewBottomConstraints.constant = (viewBottomConstraints.constant == 0) ? -300 : 0
        
        
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
        })
        
    
    
    }
    
    
}

