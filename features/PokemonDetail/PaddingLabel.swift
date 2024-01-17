//
//  PaddingLabel.swift
//  PokemonDetail
//
//  Created by Andy ⠀ on 17/01/24.
//

import UIKit

class PaddingLabel: UILabel {
    
    @IBInspectable var topInset: CGFloat = 5.0
    @IBInspectable var bottomInset: CGFloat = 5.0
    @IBInspectable var leftInset: CGFloat = 5.0
    @IBInspectable var rightInset: CGFloat = 5.0
    
    convenience init(t: CGFloat, b: CGFloat, l: CGFloat, r: CGFloat) {
        self.init()
        self.topInset = t
        self.bottomInset = b
        self.leftInset = l
        self.rightInset = r
    }
    
    convenience init(inset: CGFloat) {
        self.init()
        self.topInset = inset
        self.bottomInset = inset
        self.leftInset = inset
        self.rightInset = inset
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
    
    override var bounds: CGRect {
        didSet {
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
    }
}
