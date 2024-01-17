//
//  MyPokemonListFeature.swift
//  MyPokemonList
//
//  Created by Andy ⠀ on 17/01/24.
//

import UIKit
import RouterServiceInterface
import NavigationRoute

public struct MyPokemonListFeature: Feature {
    
    @Dependency var routerService: RouterServiceProtocol
    
    public init() {}
    
    public func build(fromRoute route: Route?) -> UIViewController {
        return MyPokemonListRouter.createModule()
    }
}

public class MyPokemonListRouteHandler: RouteHandler {
    public var routes: [Route.Type] {
        return [MyPokemonListRoute.self]
    }
    
    public func destination(
        forRoute route: Route,
        fromViewController viewController: UIViewController
    ) -> Feature.Type {
        guard route is MyPokemonListRoute else {
            preconditionFailure("unexpected route")
        }
        
        return MyPokemonListFeature.self
    }
    
    public init() {}
}
