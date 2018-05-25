//
//  BtnController.swift
//  AnimationCollection
//
//  Created by ROGER on 2018. 5. 25..
//  Copyright © 2018년 Hexcon. All rights reserved.
//

import Foundation
import UIKit


/* https://www.youtube.com/watch?v=ox2MieJzcRQ&t=293s
 
 
 */


class ButtonViewController : UIViewController {
    
    
    @IBOutlet var buttons: [UIButton]!
    
    
    override func viewDidLoad() {
        
        setupButtons()

    }
    
    deinit {
        print("deinit : ButtonViewController")
    }
    
    
    
    private func setupButtons() {

        for button in buttons {
            button.layer.cornerRadius = 8
        }

    }

    @IBAction func pulseBtnTapped(_ sender: UIButton) {
        sender.pulse()
    }
    
    @IBAction func flashBtnTapped(_ sender: UIButton) {
        sender.flash()
    }
    
    @IBAction func shakeBtnTapped(_ sender: UIButton) {
        sender.shake()
    }
    
}


// MARK:- Actions
extension ButtonViewController {
    
 
}


extension UIButton {
    
    public func pulse() {
        
        let pulse = CASpringAnimation(keyPath:"transform.scale")
        pulse.duration = 2
        pulse.fromValue = 0.8
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.3
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: nil)
        
    }
    
    public func flash() {
        
        let flash = CABasicAnimation(keyPath:"opacity")
        flash.duration = 1
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 1
        
        layer.add(flash, forKey: nil)
        
    }
    
    public func shake() {
        
        let shake = CABasicAnimation(keyPath:"position")
        shake.duration = 0.1
        shake.repeatCount = 1
        shake.autoreverses = true
        
        
        let fromPoint = CGPoint(x:center.x-5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x:center.x+5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: nil)
        
    }
    
    
    
}


