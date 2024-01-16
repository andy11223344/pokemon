//
//  UIView+Ext.swift
//
//  Created by handika.syahputra on 24/02/23.
//

import UIKit

extension UIView {
    func loadNib<T : UIView>() -> T? {
        guard let view = Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? T else {
            // xib not loaded, or it's top view is of the wrong type
            return nil
        }
        
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        return view
    }
}
