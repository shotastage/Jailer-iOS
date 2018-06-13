//
//  Button.swift
//  Demo
//
//  Created by Shota Shimazu on 2018/06/13.
//  Copyright © 2018 MiXSTAGE. All rights reserved.
//

import UIKit


class JailerButton: ComponentButton {
    
    override func compose() {
        self.backgroundColor = UIColor(hex: "DA4453")
        self.layer.cornerRadius = self.frame.size.height / 2
        self.tintColor = UIColor(hex: "FFFFFF")
        self.clipsToBounds = true
        self.titleLabel!.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.semibold)

    }
}
