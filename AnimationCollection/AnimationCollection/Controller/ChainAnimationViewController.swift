//
//  ChainAnimationViewController.swift
//  AnimationCollection
//
//  Created by ROGER on 2018. 5. 26..
//  Copyright © 2018년 Hexcon. All rights reserved.
//

import Foundation
import UIKit

class ChainAnimationViewController : UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    
    deinit {
        print("deinit : ChainAnimationViewController")
    }
}


//MARK:- Life Cycle
extension ChainAnimationViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabels()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapView)))
    }
    
    
}

extension ChainAnimationViewController {
    
    fileprivate func setupLabels() {
        
        mainLabel.text = "Hello there !"
        mainLabel.font = UIFont(name:"Futura", size: 34)
        subLabel.numberOfLines = 0
        subLabel.text = "Thanks so much for coming to here.I hope that you contact me\nLook around this app :)"
        
    }
    
}

//MARK:- Actions
extension ChainAnimationViewController {
    
    @objc fileprivate func tapView() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.mainLabel.transform = CGAffineTransform(translationX: -30, y: 0)
            
        }) { (_) in
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping:1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.mainLabel.alpha = 0
                self.mainLabel.transform = CGAffineTransform(translationX: -30, y: -200)
                
                
                self.subLabel.alpha = 0.5
                self.subLabel.transform = CGAffineTransform(translationX: -30, y: 0)
                
            }) { (_) in
                
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping:1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    
                    self.subLabel.alpha = 0
                    self.subLabel.transform = CGAffineTransform(translationX: -30, y: -200)
                    
                }) { (_) in
                    
                    //                    let profileVC = ProfileViewController()
                    //
                    //                    self.present(profileVC, animated: true, completion: {
                    //
                    //
                    //
                    //                    })
                    
                }
                
            }
            
        }
        
    }
    
}
