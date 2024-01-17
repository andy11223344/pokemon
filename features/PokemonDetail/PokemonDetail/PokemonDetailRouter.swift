//
//  PokemonDetailRouter.swift
//  PokemonDetail
//
//  Created by Andy ⠀ on 16/01/24.
//  
//

import UIKit
import RouterServiceInterface
import NavigationRoute

public class PokemonDetailRouter  {
    
    weak var view: UIViewController?
    var route: Route?
    
    // MARK: Static methods
    static func createModule(route: Route?) -> UIViewController {
        guard let detailRoute = route as? PokemonDetailRoute else { return UIViewController() }
        
        let interactor: PokemonDetailUseCase = PokemonDetailInteractor()
        let presenter: PokemonDetailPresentation & PokemonDetailInteractorOutput = PokemonDetailPresenter(data: detailRoute.data, interactor: interactor)
        let view: UIViewController & PokemonDetailView = PokemonDetailViewController()
        let router: PokemonDetailWireframe = PokemonDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.view = view
        
        router.route = route
        
        return view
    }
    
}

extension PokemonDetailRouter: PokemonDetailWireframe {
   
    
}
