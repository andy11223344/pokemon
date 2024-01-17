//
//  PokemonDetailRoute.swift
//  NavigationRoute
//
//  Created by Andy ⠀ on 16/01/24.
//

import Foundation
import RouterServiceInterface
import Shared

public struct PokemonDetailRoute: Route {
    public static var identifier: String = "pokemon_detail_route"
 
    public let data: PokemonModel

    public init(data: PokemonModel) {
        self.data = data
    }
}
