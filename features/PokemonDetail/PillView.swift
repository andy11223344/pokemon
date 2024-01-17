//
//  PillView.swift
//  PokemonDetail
//
//  Created by Andy ⠀ on 17/01/24.
//

import UIKit
import Common

class PillView: UIView {
    
    @IBOutlet weak var contentStackV: UIStackView!
    @IBOutlet weak var scrollV: UIScrollView!
    
    @IBInspectable var itemColor: UIColor = .systemBackground
    
    private var item: PaddingLabel {
        let label = PaddingLabel(t: 8, b: 8, l: 12, r: 12)
        label.backgroundColor = itemColor
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        self.loadNib(bundle: BundleToken.bundle)
        scrollV.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        scrollV.isDirectionalLockEnabled = true
        scrollV.delegate = self
    }
    
    public func addItem(text: String) {
        let label = item
        label.text = text
        contentStackV.addArrangedSubview(label)
    }
    
    public func addItem(arr: [String]?) {
        guard let arr else { return }
        arr.forEach { [weak self] str in
            self?.addItem(text: str)
        }
    }
    
}

extension PillView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 || scrollView.contentOffset.y < 0 {
            scrollView.contentOffset.y = 0
        }
    }
}
