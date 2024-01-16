//
//  Styles.swift
//  Shared
//
//  Created by Andy ⠀ on 16/01/24.
//

import UIKit

public extension Constants {
    struct Styles {
        
        public struct Insets {
            public static let spacing: CGFloat = 16
        }
        
        public struct Layout {
            public static func menuLayout(frame: CGRect) -> UICollectionViewFlowLayout {
                let spacing = CGFloat(12)
                let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
                layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: (spacing * 2), right: spacing)
                layout.minimumInteritemSpacing = spacing
                layout.minimumLineSpacing = spacing
                layout.scrollDirection = .vertical
                
                let space: CGFloat = (layout.minimumInteritemSpacing) + (layout.sectionInset.left ) + (layout.sectionInset.right)
                let size: CGFloat = (frame.size.width - space) / 2.0
                layout.itemSize = CGSize(width: size, height: size + (0.2 * size))
                
                return layout
            }
        }
        
    }
}
