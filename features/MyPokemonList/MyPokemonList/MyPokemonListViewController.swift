//
//  MyPokemonListViewController.swift
//  MyPokemonList
//
//  Created by Andy ⠀ on 17/01/24.
//  
//

import UIKit
import Common
import Kingfisher

class MyPokemonListViewController: UIViewController {
    
    @IBOutlet weak var tableV: UITableView!
    
    var presenter: MyPokemonListPresentation?
    
    public init() {
        super.init(nibName: nil, bundle: Bundle(for: MyPokemonListViewController.self))
    }

    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
        self.title = "My Pokemons"
        self.reloadDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setupTable() {
        tableV.register(cellType: PokemonTableViewCell.self)
        tableV.dataSource = self
    }
    
}

extension MyPokemonListViewController: MyPokemonListView{
    func reloadDataSource() {
        tableV.reloadData()
    }
}

extension MyPokemonListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.dataCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: PokemonTableViewCell.self)
        
        let row = indexPath.row
        guard let name = presenter?.name(row),
                let image = presenter?.image(row)
        else { return cell }
        
        cell.nameLbl.text = name
        cell.imageV.kf.setImage(with: image)
        
        cell.renameBtn.addAction { [weak self] in
            self?.presenter?.rename(row)
        }
        
        cell.deleteBtn.addAction { [weak self] in
            self?.presenter?.deleteItem(row)
        }
        
        return cell
    }
    
    
}
