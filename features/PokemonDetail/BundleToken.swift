//
//  BundleToken.swift
//  PokemonDetail
//
//  Created by Andy ⠀ on 17/01/24.
//

import Foundation

final class BundleToken {
  static let bundle: Bundle = {
      return Bundle(for: BundleToken.self)
  }()
}
