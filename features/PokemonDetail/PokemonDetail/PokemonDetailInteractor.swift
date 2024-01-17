//
//  PokemonDetailInteractor.swift
//  PokemonDetail
//
//  Created by Andy ⠀ on 16/01/24.
//  
//

import Foundation
import Networking

class PokemonDetailInteractor {

    weak var presenter: PokemonDetailInteractorOutput?
    
    let service: IPokemonSpeciesService
    
    var pokemonSpecies: PokemonSpecies?
    
    init() {
        self.service = PokemonSpeciesService()
    }
}

extension PokemonDetailInteractor: PokemonDetailUseCase {
    
    func fetchPokemonSpecies(name: String) {
        service.getSpecies(name: name) { [weak self] result in
            DispatchQueue.main.async { [weak self ] in
                switch result {
                case .success(let data):
                    self?.pokemonSpecies = data
                    self?.presenter?.fetchPokemonDidSuccess(data: data)
                case .failure(let err):
                    self?.presenter?.fetchPokemonDidError(error: err)
                }
            }
          
        }
    }
}
