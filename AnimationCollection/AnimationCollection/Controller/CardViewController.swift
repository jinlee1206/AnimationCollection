//
//  CardViewController.swift
//  AnimationCollection
//
//  Created by Euijae Hong on 31/10/2018.
//  Copyright © 2018 Hexcon. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Then



class CardViewController : UIViewController {
    
    let grapView = UIView().then {
        $0.backgroundColor = .green
    }
    
    let contentView = UIView().then {
        $0.backgroundColor = .yellow
    }
    
    
}

extension CardViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        addGesture()
    }
    
}


//MARK:- SetupView
extension CardViewController {
    
    fileprivate func setupViews() {
        
        [
            grapView,
            contentView
            
        ].forEach({view.addSubview($0)})
        
        self.grapView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        self.contentView.snp.makeConstraints {
            $0.top.equalTo(grapView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

extension CardViewController : UIGestureRecognizerDelegate {
    
    fileprivate func addGesture() {
    
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(gestureRecognizer:)))
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(gestureRecognizer:)))
        
        panGesture.delegate = self
        grapView.addGestureRecognizer(tapGesture)
        grapView.addGestureRecognizer(panGesture)
        
    }
    
    
    @objc func handleTapGesture(gestureRecognizer:UITapGestureRecognizer) {
        
    }
    
    
    
    @objc func handlePanGesture(gestureRecognizer:UIPanGestureRecognizer) {
        
        let touchLocation = gestureRecognizer.location(in: view)

        switch gestureRecognizer.state {
        case .began:
            print("began")
            
        case .changed:
            
            DispatchQueue.main.async {
                
                UIView.animate(withDuration: 0.1, animations: {
                    
                    let moveX = self.view.frame.origin.y + touchLocation.y
                    self.view.frame.origin.y = moveX
                    
                })
            }
            break

        case .ended:
            
            DispatchQueue.main.async {
                
                UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
                    
                    self.view.frame.origin.y = 400
                    
                }, completion: nil)
                
            }
            
        case .cancelled:
            print("cancelled")
        default:
            break
        }
        
    }
    
}


