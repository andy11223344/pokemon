//
//  Date+Exte.swift
//
//  Created by handika.syahputra on 25/02/23.
//

import Foundation

public extension Date {
    func toString(format: String = "dd MMM yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
