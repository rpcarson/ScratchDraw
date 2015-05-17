//
//  ViewController.swift
//  ScratchDraw
//
//  Created by Reed Carson on 5/14/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit



var realFillColors: [UIColor] = [
    UIColor.redColor(),
    UIColor.blueColor(),
    UIColor.greenColor(),

]

var fillColors: [UIColor] = [
    UIColor.cyanColor(),
    UIColor.magentaColor(),
    UIColor.yellowColor(),
    UIColor.blackColor(),
    UIColor.redColor(),
    UIColor.greenColor(),
    UIColor.blueColor()
]

var publicStrokeAlpha: CGFloat = 1.0
var publicStrokeSize = 5

var switchOpen: Bool = true

var fillOn = false

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    

    
//    var fillOn = true
    
    @IBAction func fillerSwitch(sender: UISwitch) {
        
       var fillSwitchEngage = sender.on
        if fillSwitchEngage == sender.on{
            
            fillOn == true
            println("debug view cont")
        }
        
        
        println("debug")
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    var thumbColor = UIColor.blackColor()
    
   
    @IBAction func clearFill(sender: UIButton) {
    
        if let color = sender.backgroundColor {
            scratchPad.fillColorz = color
        
        }
    
    
    }
    
    
    
    @IBAction func alphaStrokeSwitch(sender: UISwitch) {
        
        let  switchButton = sender.on
        switchOpen = switchButton
        if sender.on {
            thumbColor = UIColor.blueColor()
            currentValue = 0.5
            
        }else{
            thumbColor = UIColor.redColor()
           currentValue = 5
        }
        

    }
    
    var currentValue = Float(1)

//
    @IBAction func strokeAlpha(sender: UISlider) {
        
       sender.thumbTintColor = thumbColor
        
        
        if switchOpen == true {
            
//            sender.state = currentValue

            sender.minimumValue = 0
            sender.maximumValue = 1

            let alpha = sender.value
            publicStrokeAlpha = CGFloat(alpha)
            scratchPad.setNeedsDisplay()

            
            
        }
        
        else
            
        {
            
            
//            sender.value = currentValue

            sender.minimumValue = 1
            sender.maximumValue = 10
            let stroke = sender.value + 1
            publicStrokeSize = Int(stroke)
            scratchPad.setNeedsDisplay()

            
            
        }
    }
    

    @IBOutlet weak var realFillCollectionView: UICollectionView!
    
    @IBOutlet weak var viewBottomConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var fillColorCollectionView: UICollectionView!
    
    //    @IBAction func changeColor(sender: UIButton) {
    //
    //        if let color = sender.backgroundColor {
    //            scratchPad.currentColor = color
    //
    //        }
    //    }
    
    
    
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
       
//        realFillCollectionView.dataSource = self
//        realFillCollectionView.delegate = self
       
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

