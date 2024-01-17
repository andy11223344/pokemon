//
//  MyPokemon.swift
//  Shared
//
//  Created by Andy ⠀ on 17/01/24.
//

import Foundation
import Common

public class MyPokemon {
    
    public static let shared = MyPokemon()
    
    public var list: [PokemonModel]? {
        PokemonPersistents.list
    }
    
    public func add(data: PokemonModel) {
        guard var list = PokemonPersistents.list else {
            PokemonPersistents.list = [data]
            return
        }
      
        list.append(data)
        PokemonPersistents.list = list
    }
    
    public func delete(name: String) {
        let newValue = list?.filter{ $0.name != name }
        PokemonPersistents.list = newValue
    }
    
    public func getBy(name: String) -> PokemonModel? {
        return list?.first(where: { $0.name == name })
    }
    
    public func rename(data: PokemonModel) {
        guard var current = self.list else { return }
        
        for (index, item) in current.enumerated() {
            if item.name == data.name {
                if let seq = current[index].renamedSequence {
                    current[index].renamedSequence = (seq + 1)
                } else {
                    current[index].renamedSequence = 0
                }
                continue
            }
        }
        
        PokemonPersistents.list = current
    }
}
