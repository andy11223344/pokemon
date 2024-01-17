//
//  PokemonDetailViewController.swift
//  PokemonDetail
//
//  Created by Andy ⠀ on 16/01/24.
//  
//

import UIKit
import Kingfisher
import Common
import Components

class PokemonDetailViewController: BaseViewController {
    
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var imageV: UIImageView!
    
    @IBOutlet weak var movesPillView: PillView!
    
    @IBOutlet weak var typesPillView: PillView!
    var presenter: PokemonDetailPresentation?
    
    public init() {
        super.init(nibName: nil, bundle: Bundle(for: PokemonDetailViewController.self))
    }

    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        nameLbl.text = presenter?.name
        imageV.kf.setImage(with: presenter?.image)
        movesPillView.addItem(arr: presenter?.moves)
        typesPillView.addItem(arr: presenter?.types)
    }
    
    @IBAction func closeBtnTouchUpInside(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func catchPokemonBtnTouchUpInside(_ sender: Any) {
        Loading.show(self)
        presenter?.catchPokemon()
    }
    
    func setupView() {
        closeBtn.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        closeBtn.layer.cornerRadius = closeBtn.frame.height / 2
    }
    
}

extension PokemonDetailViewController: PokemonDetailView{
    func showAlert(message: String) {
        Loading.hide(self)
        showAlert(title: message)
    }
    
    func catchPokemonDidSuccess() {
        Loading.hide(self)
        showAlert(title: "Yaayy", message: "You catch this pokemon")
    }
    
    func catchPokemonDidFail() {
        Loading.hide(self)
        showAlert(title: "", message: "Catching pokemon fail, you can try again until success")
    }
}
