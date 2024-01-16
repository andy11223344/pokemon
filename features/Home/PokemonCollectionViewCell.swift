//
//  PokemonCollectionViewCell.swift
//  Home
//
//  Created by Andy ⠀ on 16/01/24.
//

import UIKit
import Common
import Shared

class PokemonCollectionViewCell: UICollectionViewCell, NibReusable {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        containerView.layer.cornerRadius = 20
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = Colors.border.cgColor
    }

}
