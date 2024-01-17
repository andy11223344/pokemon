//
//  PokemonTableViewCell.swift
//  MyPokemonList
//
//  Created by Andy ⠀ on 17/01/24.
//

import UIKit
import Common

class PokemonTableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var renameBtn: UIButton!
    
    @IBOutlet weak var deleteBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
