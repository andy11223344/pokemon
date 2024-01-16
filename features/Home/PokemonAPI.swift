//
//  PokemonAPI.swift
//  Home
//
//  Created by Andy ⠀ on 16/01/24.
//

import Foundation
import Networking
import Shared

enum PokemonAPI: NetworkConfiguration {
    case getPokemonList
    case getPokemon(name: String)
}

extension PokemonAPI {
    var baseUrl: String {
        "\(Constants.Url.host)/api/v2"
    }
  
    var path: String? {
        switch self {
        case .getPokemonList:
            return "/pokemon"
        case .getPokemon(let id):
            return "/pokemon/\(id)"
        }
    }
    
    var method: Networking.HTTPMethod { .get }
    
    var parameter: [String : String]? { nil }
    
    var httpHeaders: Networking.HTTPHeaders? { nil }
}
