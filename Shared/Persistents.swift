//
//  Persistents.swift
//  Shared
//
//  Created by Andy ⠀ on 17/01/24.
//

import Foundation
import Common

public struct PersistentKeys {
    public static let myPokemon = "pokemon_key"
}

public enum PokemonPersistents {
    @UserDefault(PersistentKeys.myPokemon, defaultValue: nil)
    public static var list: [PokemonModel]?
}
