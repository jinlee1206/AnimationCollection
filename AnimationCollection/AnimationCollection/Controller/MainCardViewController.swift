//
//  MainCardViewController.swift
//  AnimationCollection
//
//  Created by Euijae Hong on 31/10/2018.
//  Copyright © 2018 Hexcon. All rights reserved.
//

import Foundation
import UIKit


class MainCardViewController : UIViewController {
    
    let cardViewController = CardViewController()
    let visualEffectView = UIVisualEffectView()
    
}


//MARK:- Life Cycle
extension MainCardViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        visualEffectView.frame = view.frame
        view.addSubview(visualEffectView)
        
        addChild(cardViewController)
        view.addSubview(cardViewController.view)
        cardViewController.view.frame = CGRect(x: 0, y: self.view.frame.height - 100, width:view.frame.width, height: 600)
        cardViewController.view.clipsToBounds = true
        
    }
    
}
