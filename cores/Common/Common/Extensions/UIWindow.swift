//
//  UIWindow.swift
//  Common
//
//  Created by Andy ⠀ on 14/01/24.
//

import UIKit

public extension UIWindow {
    func setRootViewController(_ newRootViewController: UIViewController,
                               animated: Bool = true,
                               completion: (() -> Void)? = nil) {
       
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
        
        guard animated else {
            window.rootViewController = newRootViewController
            return
        }
        
        
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
            let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            window.rootViewController = newRootViewController
            UIView.setAnimationsEnabled(oldState)
        }, completion: { _ in
            completion?()
        })
    }
}
