//
//  UIColorExtension.swift
//  Boltifi
//
//  Created by Sravan on 02/05/16.
//  Copyright © 2016 Boltifi. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

//for messages, sent from xib
extension CALayer {
    func setShadowUIColor(shadowUIColor: UIColor) {
        self.shadowColor = shadowUIColor.CGColor
    }
}

//@implementation CALayer (Xib)
//
//- (void)setShadowUIColor:(UIColor *)shadowUIColor {
//    self.shadowColor = shadowUIColor.CGColor;
//}
//
//@end