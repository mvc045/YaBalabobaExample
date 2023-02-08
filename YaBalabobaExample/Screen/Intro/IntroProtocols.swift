//
//  IntroProtocols.swift
//  YaBalabobaExample
//
//  Created by mvc on 08.02.2023.
//

import UIKit

// View
protocol IntroViewProtocol: UIViewController, BaseViewProtocol {
    var presenter: IntroPresenterProtocol? { get set }
    func builderScreen(_ data: [Genre])
}

// Presenter
protocol IntroPresenterProtocol: IntroViewTableDelegate {
    var model: IntroModelProtocol? { get set }
    var view: IntroViewProtocol? { get set }
    
    func getIntroList()
    func onIntroList(_ data: [Genre])
    func onError(_ error: Error?)
}

// Model
protocol IntroModelProtocol {
    var presenter: IntroPresenterProtocol? { get set }
    func getIntroList()
}
