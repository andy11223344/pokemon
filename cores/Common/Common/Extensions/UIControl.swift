//
//  UIControl+Ext.swift
//  handika_app
//
//  Created by Andy ⠀ on 04/12/23.
//

import Foundation
import UIKit

public typealias Closure = () -> ()

@objc public class ClosureSleeve: NSObject {
    let closure: ()->()
    
    public init (_ closure: @escaping ()->()) {
        self.closure = closure
    }
    
    @objc func invoke () {
        closure()
    }
}

extension UIControl {
    public func addActionTap(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping ()->()) {
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, "[\(arc4random())]", sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}

extension UIView {
    public func addAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping Closure) {
        let sleeve = ClosureSleeve(closure)
        let gesture = UITapGestureRecognizer(target: sleeve, action: #selector(ClosureSleeve.invoke))
        gesture.numberOfTapsRequired = 1
        addGestureRecognizer(gesture)
        isUserInteractionEnabled = true
        objc_setAssociatedObject(self, String(format: "[%d]", arc4random()), sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}
