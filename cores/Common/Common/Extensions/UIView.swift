//
//  UIView+Ext.swift
//
//  Created by handika.syahputra on 24/02/23.
//

import UIKit

public extension UIView {
    
    @discardableResult
    func loadNib<T : UIView>() -> T? {
        guard let view = Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? T else {
            // xib not loaded, or it's top view is of the wrong type
            return nil
        }
        
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
        
        return view
    }
    
    
    @discardableResult
    func loadNib<T : UIView>(bundle: Bundle?) -> T? {
        guard let view = bundle?.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? T else {
            return nil
        }
        view.frame = bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
        return view
    }
}

public extension UIView {
    var snapshot: UIImage {
        return UIGraphicsImageRenderer(size: bounds.size).image { _ in
            drawHierarchy(in: bounds, afterScreenUpdates: false)
        }
    }
}
