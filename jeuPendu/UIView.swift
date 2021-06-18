//
//  UIView.swift
//  jeuPendu
//
//  Created by Benjamin Gouguet on 26/11/2019.
//  Copyright © 2019 Benjamin GOUGUET. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
