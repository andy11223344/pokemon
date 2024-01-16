//
//  Loading.swift
//  Components
//
//  Created by Andy ⠀ on 12/01/24.
//

import UIKit

public class Loading {
    public static func show(_ viewController: UIViewController) {
        let loadingView = LoadingView(frame: viewController.view.frame)
        loadingView.activityIndicator.startAnimating()
        viewController.view.addSubview(loadingView)
    }
    
    public static func hide(_ viewController: UIViewController) {
        for v in viewController.view.subviews.reversed() {
            if v is LoadingView {
                v.removeFromSuperview()
                return
            }
        }
    }
    
}

extension UIApplication {
    func topMostViewController() -> UIViewController? {
        
        let vc = UIApplication.shared.connectedScenes.filter {
            $0.activationState == .foregroundActive
        }.first(where: { $0 is UIWindowScene })
            .flatMap( { $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)?
            .rootViewController?
            .topMostViewController()
        
        return vc
    }
}

extension UIViewController {
    func topMostViewController() -> UIViewController {
           if self.presentedViewController == nil {
               return self
           }
           
           if let navigation = self.presentedViewController as? UINavigationController {
               return navigation.visibleViewController!.topMostViewController()
           }
           
           if let tab = self.presentedViewController as? UITabBarController {
               if let selectedTab = tab.selectedViewController {
                   return selectedTab.topMostViewController()
               }
               return tab.topMostViewController()
           }
           
           return self.presentedViewController!.topMostViewController()
       }
}
