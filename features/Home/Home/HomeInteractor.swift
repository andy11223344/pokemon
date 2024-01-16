//
//  HomeInteractor.swift
//  Home
//
//  Created by Andy ⠀ on 16/01/24.
//  
//

import Foundation

class HomeInteractor {
    
    var pokemonList = [PokemonModel]()

    weak var presenter: HomeInteractorOutput?
    let pokemonService: IPokemonService
    
    init() {
        self.pokemonService = PokemonService()
    }
}

extension HomeInteractor: HomeUseCase {
    func fetchPokemonList() {
        pokemonService.getPokemonList { [weak self] result in
            switch result {
            case .success(let data):
                self?.pokemonList = data
                self?.presenter?.fetchPokemonSuccess()
            case .failure(let err):
                self?.presenter?.fetchPokemonError(error: err)
            }
        }
    }
    
}
