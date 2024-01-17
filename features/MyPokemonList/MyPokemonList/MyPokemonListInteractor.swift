//
//  MyPokemonListInteractor.swift
//  MyPokemonList
//
//  Created by Andy ⠀ on 17/01/24.
//  
//

import Foundation
import Shared

class MyPokemonListInteractor {

    weak var presenter: MyPokemonListInteractorOutput?
    
}

extension MyPokemonListInteractor: MyPokemonListUseCase {
    func deletePokemon(data: PokemonModel) {
        MyPokemon.shared.delete(name: data.name)
    }
    func renamePokemon(data: PokemonModel) {
        MyPokemon.shared.rename(data: data)
    }
}
