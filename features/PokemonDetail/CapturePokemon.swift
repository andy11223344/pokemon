//
//  CapturePokemon.swift
//  PokemonDetail
//
//  Created by Andy ⠀ on 17/01/24.
//

import Foundation

class CapturePokemon {
    let captureRate: Int
    
    init(captureRate: Int) {
        self.captureRate = captureRate
    }
    
    func `catch`(completion: ((_ captured: Bool) -> Void)) {
        let successRate: Double = Double(captureRate) / 100

        let num =  Double.random(in: 0..<1)
        let rand = num <= successRate
        
        completion(rand)
    }
}
