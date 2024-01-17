//
//  PokemonDetailPresenter.swift
//  PokemonDetail
///Users/andy/Library/Developer/Xcode/Templates/VIPER Module_V2.xctemplate/PokemonDetailPresenterViewController.swift
//  Created by Andy ⠀ on 16/01/24.
//  
//

import Foundation
import Shared
import Networking

class PokemonDetailPresenter {

    var view: PokemonDetailView?
    var interactor: PokemonDetailUseCase
    var router: PokemonDetailWireframe?
    
    let data: PokemonModel
    
    init(data: PokemonModel, interactor: PokemonDetailUseCase) {
        self.data = data
        self.interactor = interactor
    }
}

extension PokemonDetailPresenter: PokemonDetailPresentation {
    
    var image: URL? {
        return URL(string: data.sprites.other?.officialArtwork.frontDefault ?? "")
    }
    
    var name: String {
        data.name
    }
    
    var moves: [String] {
        return data.moves.map { $0.move.name }
    }
    
    var types: [String] {
        return data.types.map { $0.type.name }
    }
    
    func catchPokemon() {
        if let species = interactor.pokemonSpecies {
            cathingPokemon(data: species)
        } else {
            interactor.fetchPokemonSpecies(name: name)
        }
    }
    
    func cathingPokemon(data: PokemonSpecies) {
        let capture = CapturePokemon(captureRate: data.captureRate)
        capture.catch { [weak self] captured in
            if captured {
                self?.view?.catchPokemonDidSuccess()
            } else {
                self?.view?.catchPokemonDidFail()
            }
        }
    }
    
}


extension PokemonDetailPresenter: PokemonDetailInteractorOutput {
    func fetchPokemonDidSuccess(data: PokemonSpecies) {
        cathingPokemon(data: data)
    }
    
    func fetchPokemonDidError(error: Networking.ErrorResult) {
        view?.showAlert(message: error.errorDescription ?? "")
    }
    
}
