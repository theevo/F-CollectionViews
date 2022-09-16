//
//  UIView+Extensions.swift
//  Fuck CollectionViews
//
//  Created by Theo Vora on 9/16/22.
//

import UIKit

extension UIView {
    func border(color: UIColor, thickness: CGFloat = 1.0) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = thickness
    }
}
