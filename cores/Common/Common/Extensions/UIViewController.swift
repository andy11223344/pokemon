//
//  UIViewController.swift
//  Common
//
//  Created by Andy ⠀ on 16/01/24.
//

import UIKit

public extension UIViewController {
    var topBarHeight: CGFloat {
        return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
                   (self.navigationController?.navigationBar.frame.height ?? 0.0)
       }
}
