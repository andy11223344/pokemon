//
//  PokemonCollectionViewCell.swift
//  Home
//
//  Created by Andy ⠀ on 16/01/24.
//

import UIKit
import Common

class PokemonCollectionViewCell: UICollectionViewCell, NibReusable {

    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
