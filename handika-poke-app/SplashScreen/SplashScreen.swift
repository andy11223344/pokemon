//
//  SplashScreen.swift
//  handika-poke-app
//
//  Created by Andy ⠀ on 16/01/24.
//

import UIKit
import Home
import RouterService
import RouterServiceInterface
import NavigationRoute

struct SplashScreenFeature: Feature {
    @Dependency var routerService: RouterServiceProtocol
    
    func build(fromRoute route: RouterServiceInterface.Route?) -> UIViewController {
        return SplashScreen(routerService: routerService)
    }
}

class SplashScreen: UIViewController {
    
    @IBOutlet weak var logoImg: UIImageView!
    
    let routerService: RouterServiceProtocol
    let transition = DismissSplashTransition()
    
    required init(routerService: RouterServiceProtocol) {
        self.routerService = routerService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.logoImg.transform = CGAffineTransform(rotationAngle: -0.4)
        UIView.animate(withDuration: 0.8, delay: 0, options: [.autoreverse, .repeat]) { [weak self] in
            self?.logoImg.transform = CGAffineTransform(rotationAngle: 0.4)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: { [weak self] in
            self?.logoImg.layer.removeAllAnimations()
            self?.showHomeFeature()
        })
    }
    
    func showHomeFeature() {
        navigationController?.delegate = transition
        
        routerService.navigate(toRoute: HomeRoute(), fromView: self, presentationStyle: Push(), animated: true)
    }
}

extension SplashScreen: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return transition
    }
}
