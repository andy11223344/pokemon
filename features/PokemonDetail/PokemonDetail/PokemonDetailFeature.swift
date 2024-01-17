//
//  PokemonDetailFeature.swift
//  PokemonDetail
//
//  Created by Andy ⠀ on 16/01/24.
//

import UIKit
import RouterServiceInterface
import NavigationRoute

public struct PokemonDetailFeature: Feature {
    
    public init() {}
    
    public func build(fromRoute route: Route?) -> UIViewController {
        return PokemonDetailRouter.createModule(route: route)
    }
}

public class PokemonDetailRouteHandler: RouteHandler {
    public var routes: [Route.Type] {
        return [PokemonDetailRoute.self]
    }
    
    public func destination(
        forRoute route: Route,
        fromViewController viewController: UIViewController
    ) -> Feature.Type {
        guard route is PokemonDetailRoute else {
            preconditionFailure("unexpected route")
        }
        return PokemonDetailFeature.self
    }
    
    public init() {}
}
