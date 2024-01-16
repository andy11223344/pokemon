//
//  SceneDelegate.swift
//  handika-poke-app
//
//  Created by Andy ⠀ on 16/01/24.
//

import UIKit
import RouterService
import Home

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let routerService = RouterService()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
   
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        
        routerService.register(routeHandler: HomeRouteHandler())
        
//        let nav = UINavigationController(rootViewController: SplashScreen(routerService: routerService))
//        nav.setNavigationBarHidden(true, animated: false)
        
        let nav = routerService.navigationController(
            withInitialFeature: SplashScreenFeature.self
        )
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }

}

