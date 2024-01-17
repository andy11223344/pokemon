//
//  DismissTransition.swift
//  handika-poke-app
//
//  Created by Andy ⠀ on 16/01/24.
//

import UIKit
import Home
import Common

final class DismissSplashTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let duration: TimeInterval = 0.3
    private var operation = UINavigationController.Operation.push
    
    override init() {
        
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let toView = transitionContext.viewController(forKey: .to) as? HomeViewController
        else {
            transitionContext.completeTransition(false)
            return
        }

        toView.view.layoutIfNeeded()
        let containerView = transitionContext.containerView
        
        var targetFrame = toView.myPokemonBtn.frame
        targetFrame.origin.y += (targetFrame.origin.y + toView.topBarHeight)
        
        containerView.addSubview(toView.view)
        
        let snap = UIImageView(image: containerView.snapshot)
        snap.clipsToBounds = true
        containerView.addSubview(snap)
        
        UIView.animate(withDuration: duration, animations: {
            snap.layer.cornerRadius = targetFrame.height / 2
            snap.frame = targetFrame
            snap.layoutIfNeeded()
            
        }, completion: { (success:Bool) in
            snap.removeFromSuperview()
            transitionContext.completeTransition(success)
            UIWindow().setRootViewController(UINavigationController(rootViewController: toView), animated: false)
        })
    }
    
}

extension DismissSplashTransition: UINavigationControllerDelegate {
    func navigationController(
        _ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation,
        from fromVC: UIViewController,
        to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        self.operation = operation
        
        if operation == .push {
            return self
        }
        
        return nil
    }
}


