//
//  TestViewController.swift
//  AnimationCollection
//
//  Created by ROGER on 2018. 5. 27..
//  Copyright © 2018년 Hexcon. All rights reserved.
//

import Foundation
import UIKit

// https://www.youtube.com/watch?v=O3ltwjDJaMk

class CircleProgressBarViewController : UIViewController {
    
    let shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        
        let center = view.center
        
        let trackLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter:center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        trackLayer.path = circularPath.cgPath
        
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.lineCap = CAShapeLayerLineCap.round
        trackLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(trackLayer)
        
        
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(shapeLayer)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc private func handleTap() {
        
        let basicAnimation = CABasicAnimation(keyPath:"strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey:"urSoBasic")
        
    
    }
    
}


