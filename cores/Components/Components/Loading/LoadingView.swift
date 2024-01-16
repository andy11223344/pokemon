//
//  LoadingView.swift
//  Components
//
//  Created by Andy ⠀ on 12/01/24.
//

import UIKit

class LoadingView: UIView {
    
    let activityIndicator = UIActivityIndicatorView(style: .large)
    let container = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      
        activityIndicator.color = UIColor.black
        activityIndicator.startAnimating()
        container.layer.cornerRadius = 25
        self.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        container.backgroundColor = UIColor.white
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        container.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(container)
        container.addSubview(activityIndicator)
        
        let containerCons = [
            container.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            container.widthAnchor.constraint(equalToConstant: 110),
            container.heightAnchor.constraint(equalTo: container.widthAnchor),
        ]
        
        let indicatorCons = [
            activityIndicator.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: container.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(containerCons)
        NSLayoutConstraint.activate(indicatorCons)
    }
    
}
