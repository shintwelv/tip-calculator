//
//  UIResponder+Extension.swift
//  tip-calculator
//
//  Created by ShinIl Heo on 3/12/24.
//

import UIKit

extension UIResponder {
    var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}
