//
//  Fibonacci.swift
//  Shared
//
//  Created by Andy ⠀ on 17/01/24.
//

import Foundation

class Fibonacci {
    
    let sequence: Int?
    
    var next: Int {
        guard let sequence else { return 0 }
        return fib(sequence)
    }
    
    init(sequence: Int?) {
        self.sequence = sequence
    }
    
    private func fib(_ n: Int) -> Int {
        guard n > 1 else {return n}
        return fib(n - 1) + fib(n - 2)
    }

}
