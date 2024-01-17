//
//  MyPokemonListContract.swift
//  MyPokemonList
//
//  Created by Andy ⠀ on 17/01/24.
//  
//

import UIKit
import RouterServiceInterface
import Shared

// MARK: - ViewController
protocol MyPokemonListView: AnyObject {
    var presenter: MyPokemonListPresentation? { get set }
    
    func reloadDataSource()
}

// MARK: - Presenter
protocol MyPokemonListPresentation: AnyObject {
    
    var view: MyPokemonListView? { get set }
    var interactor: MyPokemonListUseCase? { get set }
    var router: MyPokemonListWireframe? { get set }
    
    var dataCount: Int { get }
    func name(_ index: Int) -> String
    func image(_ index: Int) -> URL?
    func deleteItem(_ index: Int)
    func rename(_ index: Int)
}


// MARK: - Interactor
protocol MyPokemonListUseCase: AnyObject {
    var presenter: MyPokemonListInteractorOutput? { get set }
    
    func deletePokemon(data: PokemonModel)
    func renamePokemon(data: PokemonModel)
}


// MARK: - Interactor Output
protocol MyPokemonListInteractorOutput: AnyObject {
    
}

// MARK: - Router
protocol MyPokemonListWireframe: AnyObject {
    var view: UIViewController? { get set }
    var routerService: RouterServiceProtocol? { get set }
}
