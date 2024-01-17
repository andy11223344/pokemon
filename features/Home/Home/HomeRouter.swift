//
//  HomeRouter.swift
//  Home
//
//  Created by Andy ⠀ on 16/01/24.
//  
//

import UIKit
import RouterServiceInterface
import NavigationRoute
import Shared

public class HomeRouter  {
    
    weak var view: UIViewController?
    var routerService: RouterServiceProtocol?
    
    static func createModule(routerService: RouterServiceProtocol) -> UIViewController {
        
        let presenter: HomePresentation & HomeInteractorOutput = HomePresenter()
        let view: UIViewController & HomeView = HomeViewController()
        let interactor: HomeUseCase = HomeInteractor()
        let router: HomeWireframe = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.view = view
        
        router.routerService = routerService
        
        return view
    }
    
}

extension HomeRouter: HomeWireframe {
    func navigateToDetail(data: PokemonModel) {
        guard let view else { return }
        
        let route = PokemonDetailRoute(data: data)
        routerService?.navigate(toRoute: route, fromView: view, presentationStyle: Modal(), animated: true)
    }
}
