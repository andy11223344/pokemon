//
//  PokemonSpeciesAPI.swift
//  PokemonDetail
//
//  Created by Andy ⠀ on 17/01/24.
//

import Foundation
import Networking
import Shared

enum PokemonSpeciesAPI: NetworkConfiguration {
    case getSpecies(name: String)
}

extension PokemonSpeciesAPI {
    var baseUrl: String {
        "\(Constants.Url.host)/api/v2"
    }
  
    var path: String? {
        switch self {
        case .getSpecies(let name):
            return "/pokemon-species/\(name)"
        }
    }
    
    var method: Networking.HTTPMethod { .get }
    
    var parameter: [String : String]? { nil }
    
    var httpHeaders: Networking.HTTPHeaders? { nil }
}
