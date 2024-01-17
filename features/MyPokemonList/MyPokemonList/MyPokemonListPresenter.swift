//
//  MyPokemonListPresenter.swift
//  MyPokemonList
///Users/andy/Library/Developer/Xcode/Templates/VIPER Module_V2.xctemplate/MyPokemonListPresenterViewController.swift
//  Created by Andy ⠀ on 17/01/24.
//  
//

import Foundation
import Shared

class MyPokemonListPresenter {

    var view: MyPokemonListView?
    var interactor: MyPokemonListUseCase?
    var router: MyPokemonListWireframe?
    
    var data = MyPokemon.shared.list
}

extension MyPokemonListPresenter: MyPokemonListPresentation {
    
    var dataCount: Int {
        data?.count ?? 0
    }
    
    func name(_ index: Int) -> String {
        return data?[index].nameSequence ?? ""
    }
    
    func image(_ index: Int) -> URL? {
        return URL(string: data?[index].sprites.other?.officialArtwork.frontDefault ?? "")
    }
    
    func deleteItem(_ index: Int) {
        guard let item = data?[index] else { return }
        interactor?.deletePokemon(data: item)
        self.data = data?.filter{ $0.name != item.name }
        view?.reloadDataSource()
    }
    
    func rename(_ index: Int) {
        guard let item = data?[index] else { return }
        interactor?.renamePokemon(data: item)
        self.data = MyPokemon.shared.list
        view?.reloadDataSource()
    }
}


extension MyPokemonListPresenter: MyPokemonListInteractorOutput {
    
    
}
