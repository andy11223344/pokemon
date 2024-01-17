//
//  PokemonSpeciesService.swift
//  PokemonDetail
//
//  Created by Andy ⠀ on 17/01/24.
//

import Foundation
import Networking
import Shared

protocol IPokemonSpeciesService {
    func getSpecies(name: String, completion: ((Result<PokemonSpecies, ErrorResult>) -> Void)?)
}

public class PokemonSpeciesService: IPokemonSpeciesService {
    private typealias api = PokemonSpeciesAPI
    let network = NetworkClient()
    
    init() {}
    
    func getSpecies(name: String, completion: ((Result<PokemonSpecies, ErrorResult>) -> Void)?) {
        network.request(config: api.getSpecies(name: name), completion: completion)
    }
}
