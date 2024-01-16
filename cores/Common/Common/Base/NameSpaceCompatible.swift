//
//  NameSpaceCompatible.swift
//  Common
//
//  Created by Andy ⠀ on 06/12/23.
//

import UIKit

//MARK: NameSpace
public struct NameSpace<Base> {
    public let base: Base
    
    public init (_ base: Base) {
        self.base = base
    }
}

public protocol NameSpaceCompatible {
    associatedtype T
    static var ex: NameSpace<T>.Type { get }
}

extension NameSpaceCompatible {
    public static var ex: NameSpace<Self>.Type {
        return NameSpace<Self>.self
    }
}

//extension UIColor: NameSpaceCompatible {}
//
//public extension NameSpace where Base: UIColor {
//    static var history: UIColor? { .red }
//}
