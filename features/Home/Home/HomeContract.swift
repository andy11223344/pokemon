//
//  HomeContract.swift
//  Home
//
//  Created by Andy ⠀ on 16/01/24.
//  
//

import UIKit
import RouterServiceInterface
import Networking
import Shared

// MARK: - ViewController
protocol HomeView: AnyObject {
    var presenter: HomePresentation? { get set }
    func showAlert(message: String)
    func fetchDidSuccess()
}

// MARK: - Presenter
protocol HomePresentation: AnyObject {
    
    var view: HomeView? { get set }
    var interactor: HomeUseCase? { get set }
    var router: HomeWireframe? { get set }
    
    var dataCount: Int { get }
    
    func pokemonName(_ index: Int) -> String?
    func pokemonImageUrl(_ index: Int) -> URL?
    
    func showDetail(_ index: Int)
}


// MARK: - Interactor
protocol HomeUseCase: AnyObject {
    var pokemonList: [PokemonModel] { get set }
    
    var presenter: HomeInteractorOutput? { get set }
    
    func fetchPokemonList()
}


// MARK: - Interactor Output
protocol HomeInteractorOutput: AnyObject {
    func fetchPokemonSuccess()
    func fetchPokemonError(error: ErrorResult)
}

// MARK: - Router
protocol HomeWireframe: AnyObject {
    var view: UIViewController? { get set }
    var routerService: RouterServiceProtocol? { get set }
    
    func navigateToMyPokemon()
    func navigateToDetail(data: PokemonModel)
}
