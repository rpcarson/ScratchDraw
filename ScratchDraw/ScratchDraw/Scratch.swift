//
//  Scratch.swift
//  ScratchDraw
//
//  Created by Reed Carson on 3/29/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import UIKit


enum ScratchType {
    
    case Line
    case Rect
    case Ellipse
    case Triangle
}


class Scratch {
    
    var points: [CGPoint] = []
    var fillColor: UIColor?
    var strokeColor: UIColor?
    var strokeSize: Double = 0
    var type: ScratchType = .Line
    
    
    func drawLineWithContext(context: CGContextRef) {
        
        if let fillColor = fillColor {
            
            fillColor.set()
            
            CGContextSetLineWidth(context, 10)
            CGContextMoveToPoint(context, points[0].x, points[0].y)
            
            for point in points {
                CGContextAddLineToPoint(context, point.x, point.y)
            }
            
            CGContextStrokePath(context)
            
        }
        
    }
    
    func drawEllipseWithContext(context: CGContextRef) {
        
        if let fillColor = fillColor {
            
            fillColor.set()
            
            let x = points[0].x
            let y = points[0].y
            let width = points[1].x - points[0].x
            let height = points[1].y - points[0].y
            let rect = CGRectMake(x, y, width, height)
            CGContextFillEllipseInRect(context, rect)
        }
        
    }
    
    func drawRectWithContext(context: CGContextRef) {
        
        if let fillColor = fillColor {
            
            fillColor.set()
            
            let x = points[0].x
            let y = points[0].y
            let width = points[1].x - points[0].x
            let height = points[1].y - points[0].y
            let rect = CGRectMake(x, y, width, height)
            
            CGContextFillRect(context, rect)
        }
        
    }
    
    
    func drawTriangleWithContext(context: CGContextRef) {
        
        if let fillColor = fillColor {
            
            fillColor.set()
            
            let midX = (points[0].x + points[1].x) / 2
            
            CGContextMoveToPoint(context, points[1].x, points[1].y)
            
            CGContextAddLineToPoint(context, points[0].x, points[1].y)
            CGContextAddLineToPoint(context, midX, points[0].y)
            CGContextAddLineToPoint(context, points[1].x, points[1].y)
            
            CGContextFillPath(context)
            
        }
    }
    
}