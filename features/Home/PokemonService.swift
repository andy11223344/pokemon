//
//  PokemonService.swift
//  Home
//
//  Created by Andy ⠀ on 16/01/24.
//

import Foundation
import Networking

protocol IPokemonService {
    func getPokemonList(completion: ((Result<[PokemonModel], ErrorResult>) -> Void)?)
}

public class PokemonService: IPokemonService {
    private typealias api = PokemonAPI
    let network = NetworkClient()
    
    init() {}
    
    func getPokemonList(completion: ((Result<[PokemonModel], ErrorResult>) -> Void)?) {
        
        var list: [PokeListModel]?
        var error: ErrorResult?
        
        let group = DispatchGroup()
        let queue = DispatchQueue.global(qos: .background)
        
        queue.async { [weak self] in
            group.enter()
            self?.getList { result in
                defer { group.leave() }
                switch result {
                case .success(let data):
                    list = data.results
                case .failure(let err):
                    error = err
                }
            }
            group.wait()
            
            guard let list else {
                DispatchQueue.main.async {
                    completion?(.failure(error ?? .unknown))
                }
                return
            }
            
            var pokemons = [PokemonModel]()
            
            list.forEach { [weak self] data  in
                group.enter()
                self?.getDetail(name: data.name) { result in
                    defer { group.leave() }
                    
                    switch result {
                    case .success(let data):
                        pokemons.append(data)
                    case .failure(let err):
                        error = err
                    }
                }
            }
            
            group.wait()
            
            DispatchQueue.main.async {
                if error == nil {
                    completion?(.success(pokemons))
                } else {
                    completion?(.failure(error ?? .unknown))
                }
            }
        }
    }
    
    private func getList(completion: ((Result<BasePokeListModel, ErrorResult>) -> Void)?) {
        network.request(config: api.getPokemonList, completion: completion)
    }
    
    private func getDetail(name: String, completion: ((Result<PokemonModel, ErrorResult>) -> Void)?) {
        network.request(config: api.getPokemon(name: name), completion: completion)
    }
}
