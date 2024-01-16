//
//  HomeFeature.swift
//  Home
//
//  Created by Andy ⠀ on 16/01/24.
//

import UIKit
import RouterServiceInterface
import NavigationRoute

public struct HomeFeature: Feature {
    
    @Dependency var routerService: RouterServiceProtocol
    
    public init() {}
    
    public func build(fromRoute route: Route?) -> UIViewController {
        return HomeRouter.createModule(
            routerService: routerService
        )
    }
}

public class HomeRouteHandler: RouteHandler {
    public var routes: [Route.Type] {
        return [HomeRoute.self]
    }
    
    public func destination(
        forRoute route: Route,
        fromViewController viewController: UIViewController
    ) -> Feature.Type {
        guard route is HomeRoute else {
            preconditionFailure("unexpected route")
        }
        return HomeFeature.self
    }
    
    public init() {}
}
