//
//  PokemonSpecies.swift
//  PokemonDetail
//
//  Created by Andy ⠀ on 17/01/24.
//

import Foundation

struct PokemonSpecies: Codable {
    let captureRate: Int
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case captureRate = "capture_rate"
        case id
        case name
    }
}
