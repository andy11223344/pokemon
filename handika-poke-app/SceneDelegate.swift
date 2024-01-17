//
//  SceneDelegate.swift
//  handika-poke-app
//
//  Created by Andy ⠀ on 16/01/24.
//

import UIKit
import RouterService
import Home
import PokemonDetail
import MyPokemonList

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let routerService = RouterService()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
   
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        
        routerService.register(routeHandler: HomeRouteHandler())
        routerService.register(routeHandler: PokemonDetailRouteHandler())
        routerService.register(routeHandler: MyPokemonListRouteHandler())
        
        let nav = routerService.navigationController(
            withInitialFeature: SplashScreenFeature.self
        )
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }

}

