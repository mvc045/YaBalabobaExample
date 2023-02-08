//
//  AppCoordinator.swift
//  YaBalabobaExample
//
//  Created by mvc on 07.02.2023.
//

import UIKit

class AppCoordinator {
    
    var window: UIWindow
    
    init(_ window: UIWindow) {
        self.window = window
    }
    
    func navigateToStart() {
        let viewController = IntroViewController()
        window.rootViewController = UINavigationController(rootViewController: viewController)
        window.makeKeyAndVisible()
    }
    
}
