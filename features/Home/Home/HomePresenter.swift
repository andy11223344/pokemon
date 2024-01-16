//
//  HomePresenter.swift
//  Home
///Users/andy/Library/Developer/Xcode/Templates/VIPER Module_V2.xctemplate/HomePresenterViewController.swift
//  Created by Andy ⠀ on 16/01/24.
//  
//

import Foundation
import Networking
import Shared

class HomePresenter {

    var view: HomeView?
    var interactor: HomeUseCase?
    var router: HomeWireframe?
}

extension HomePresenter: HomePresentation {
    
    var dataCount: Int {
        interactor?.pokemonList.count ?? 0
    }
    
    func pokemonName(_ index: Int) -> String? {
        return interactor?.pokemonList[index].name
    }
    
    func pokemonImageUrl(_ index: Int) -> URL? {
        guard let imgUrl = interactor?.pokemonList[index].sprites.other?.officialArtwork.frontDefault
        else { return nil }
        
        return URL(string: imgUrl)
    }
}


extension HomePresenter: HomeInteractorOutput {
    func fetchPokemonSuccess() {
        
    }
    
    func fetchPokemonError(error: Networking.ErrorResult) {
        view?.showAlert(message: error.errorDescription ?? "")
    }
}
