//
//  Slider.swift
//  ScratchDraw
//
//  Created by Reed Carson on 4/5/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import UIKit

class Slider: UISlider {

 
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        self.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_2))
    
    

    }
 

}
