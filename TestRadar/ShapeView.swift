//
//  ShapeView.swift
//  TestRadar
//
//  Created by Andrei Kucherenko on 24/11/2018.
//  Copyright © 2018 AK. All rights reserved.
//

import UIKit

class ShapeView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var currentShapeType: Int = 0
    
    init(frame: CGRect, shape: Int) {
        super.init(frame: frame)
        currentShapeType = shape
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        switch currentShapeType {
        case 0: drawLines()
        case 1: drawRectangle()
        case 2: drawCircle()
        default: print("default")
        }
    }
    
    func drawLines() {
        //1
        let ctx = UIGraphicsGetCurrentContext()
        
        //2
        (ctx ?? nil)!.beginPath()
        
        ctx?.move(to: CGPoint(x:20.0, y:20.0))
        ctx?.move(to: CGPoint(x:20.0, y:20.0))
        ctx?.move(to: CGPoint(x:250.0, y:100.0))
        ctx?.move(to: CGPoint(x:100.0, y:200.0))
        ctx?.setLineWidth(5)
        
        //3
        ctx?.closePath()
        ctx?.strokePath()
    }
    
    func drawRectangle() {
        let center = CGPoint(x: self.frame.size.width / 2.0, y: self.frame.size.height / 2.0)
        let rectangleWidth:CGFloat = 100.0
        let rectangleHeight:CGFloat = 100.0
        let ctx = UIGraphicsGetCurrentContext()
        
        //4
        ctx?.addRect(CGRect(x: (center.x - (0.5 * rectangleWidth)), y: (center.y - (0.5 * rectangleHeight)), width: rectangleWidth, height: rectangleHeight))
        
        ctx?.setLineWidth(10)
        ctx?.setStrokeColor(red: 60, green: 30, blue: 50, alpha: 2)
        ctx?.strokePath()
        
        //5
        ctx?.setFillColor(red: 100, green: 100, blue: 50, alpha: 1)
        ctx?.addRect(CGRect(x: (center.x - (0.5 * rectangleWidth)), y: (center.y - (0.5 * rectangleHeight)), width: rectangleWidth, height: rectangleHeight))
    
        ctx?.fillPath()
        
    }
    
    func drawCircle() {
        let center = CGPoint(x: self.frame.size.width / 2.0, y:self.frame.size.height / 2.0)
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.beginPath()
        
        //6
        ctx?.setLineWidth(5)

        let x:CGFloat = center.x
        let y:CGFloat = center.y
        let radius: CGFloat = 100.0
        let endAngle: CGFloat = CGFloat(2 * Double.pi)
        ctx?.addArc(center: center, radius: radius, startAngle: 0, endAngle: endAngle, clockwise: true)
        ctx?.strokePath()
    }

}
