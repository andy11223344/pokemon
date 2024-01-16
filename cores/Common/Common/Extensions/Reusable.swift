//
//  Reusable.swift
//  Common
//
//  Created by Andy ⠀ on 12/01/24.
//

import UIKit

public protocol Reusable: AnyObject {
    /// The reuse identifier to use when registering and later dequeuing a reusable cell
    static var reuseIdentifier: String { get }
}

/// Make your `UITableViewCell` and `UICollectionViewCell` subclasses
/// conform to this typealias when they *are* NIB-based
/// to be able to dequeue them in a type-safe manner
public typealias NibReusable = Reusable & NibLoadable

// MARK: - Default implementation

public extension Reusable {
    /// By default, use the name of the class as String for its reuseIdentifier
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

public protocol NibLoadable: AnyObject {
    static var nib: UINib { get }
}

// MARK: Default implementation

public extension NibLoadable {
    /// By default, use the nib which have the same name as the name of the class,
    /// and located in the bundle of that class
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

// MARK: Support for instantiation from NIB

public extension NibLoadable where Self: UIView {
    /**
     Returns a `UIView` object instantiated from nib
     
     - returns: A `NibLoadable`, `UIView` instance
     */
    static func loadFromNib() -> Self {
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("The nib \(nib) expected its root view to be of type \(self)")
        }
        return view
    }
}
