//
//  MyPokemonListRouter.swift
//  MyPokemonList
//
//  Created by Andy ⠀ on 17/01/24.
//  
//

import UIKit
import RouterServiceInterface

public class MyPokemonListRouter  {
    
    weak var view: UIViewController?
    var routerService: RouterServiceProtocol?
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let presenter: MyPokemonListPresentation & MyPokemonListInteractorOutput = MyPokemonListPresenter()
        let view: UIViewController & MyPokemonListView = MyPokemonListViewController()
        let interactor: MyPokemonListUseCase = MyPokemonListInteractor()
        let router: MyPokemonListWireframe = MyPokemonListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
    
}

extension MyPokemonListRouter: MyPokemonListWireframe {
    
}
