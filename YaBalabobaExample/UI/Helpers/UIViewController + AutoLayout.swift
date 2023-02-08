//
//  UIViewController + AutoLayout.swift
//  YaBalabobaExample
//
//  Created by mvc on 07.02.2023.
//

import UIKit

extension UIViewController {
    
    func addConstraintsFullScreen(_ view: UIView) {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0.0),
            view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0.0),
            view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0.0),
            view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0),
        ])
    }
    
}
