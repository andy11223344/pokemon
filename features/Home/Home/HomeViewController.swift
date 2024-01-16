//
//  HomeViewController.swift
//  Home
//
//  Created by Andy ⠀ on 16/01/24.
//  
//

import UIKit
import Components
import Common
import Kingfisher

public class HomeViewController: BaseViewController {
    
    @IBOutlet public weak var myPokemonBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter: HomePresentation?
    
    public init() {
        super.init(nibName: nil, bundle: Bundle(for: HomeViewController.self))
    }

    required init?(coder: NSCoder) { fatalError() }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        myPokemonBtn.layer.cornerRadius = myPokemonBtn.frame.height / 2
        setupCollectionView()
        
        Loading.show()
        presenter?.interactor?.fetchPokemonList()
    }
    
    func setupCollectionView() {
        collectionView.register(cellType: PokemonCollectionViewCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    @IBAction func myPokemonBtnTouchUpInside(_ sender: Any) {
        
    }
    
}

extension HomeViewController: HomeView{
    func showAlert(message: String) {
        showAlert(title: message)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.dataCount ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: PokemonCollectionViewCell.self)
        let row = indexPath.row
        
        if let image = presenter?.pokemonImageUrl(row),
           let name = presenter?.pokemonName(row)
        {
            cell.imageV.kf.setImage(with: image)
            cell.titleLbl.text = name
        }
        
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
        return CGSize(width: size, height: size + (0.4 * size))
    }
    
}