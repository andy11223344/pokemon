//
//  PokemonDetailContract.swift
//  PokemonDetail
//
//  Created by Andy ⠀ on 16/01/24.
//  
//

import UIKit
import RouterServiceInterface
import Networking

// MARK: - ViewController
protocol PokemonDetailView: AnyObject {
    var presenter: PokemonDetailPresentation? { get set }
    
    func showAlert(message: String)
    
    func catchPokemonDidSuccess()
    func catchPokemonDidFail()
}

// MARK: - Presenter
protocol PokemonDetailPresentation: AnyObject {
    
    var view: PokemonDetailView? { get set }
    var interactor: PokemonDetailUseCase { get set }
    var router: PokemonDetailWireframe? { get set }
    
    var image: URL? { get }
    var name: String { get }
    var moves: [String] { get }
    var types: [String] { get }
    
    func catchPokemon()
}


// MARK: - Interactor
protocol PokemonDetailUseCase: AnyObject {
    var presenter: PokemonDetailInteractorOutput? { get set }
    
    var pokemonSpecies: PokemonSpecies? { get set }
    
    func fetchPokemonSpecies(name: String)
}


// MARK: - Interactor Output
protocol PokemonDetailInteractorOutput: AnyObject {
    func fetchPokemonDidSuccess(data: PokemonSpecies)
    func fetchPokemonDidError(error: ErrorResult)
}

// MARK: - Router
protocol PokemonDetailWireframe: AnyObject {
    var view: UIViewController? { get set }
    var route: Route? { get set }
}
