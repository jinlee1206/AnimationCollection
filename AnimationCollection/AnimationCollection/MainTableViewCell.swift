//
//  MainTableViewCell.swift
//  AnimationCollection
//
//  Created by ROGER on 2018. 5. 25..
//  Copyright © 2018년 Hexcon. All rights reserved.
//

import Foundation
import UIKit

class MainTableViewCell : UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    deinit {
        
        print("deinit : MainTableViewCell")
        
    }
    
}


