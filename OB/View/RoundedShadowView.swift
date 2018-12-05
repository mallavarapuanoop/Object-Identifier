//
//  RoundedShadowView.swift
//  OB
//
//  Created by Anoop Mallavarapu on 12/5/18.
//  Copyright © 2018 Anoop Mallavarapu. All rights reserved.
//

import UIKit

class RoundedShadowView: UIView {

    
    override func awakeFromNib() {
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 15
        self.layer.shadowOpacity = 0.75
        self.layer.cornerRadius = self.frame.height/2
    }
    
}
