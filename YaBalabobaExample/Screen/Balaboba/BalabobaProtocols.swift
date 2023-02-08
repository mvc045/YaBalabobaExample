//
//  BalabobaProtocols.swift
//  YaBalabobaExample
//
//  Created by mvc on 08.02.2023.
//

import UIKit

// View
protocol BalabobaViewProtocol: UIViewController, BaseViewProtocol {
    var presenter: BalabobaPresenterProtocol? { get set }
    
    func config(_ genre: Genre)
    func builderScreen(_ data: Response)
}

// Presenter
protocol BalabobaPresenterProtocol {
    var model: BalabobaModelProtocol? { get set }
    var view: BalabobaViewProtocol? { get set }
    
    func getGenre() -> Genre?
    func config(_ genre: Genre)
    func sendBalaboba(_ text: String)
    func onSuccessBalaoba(_ data: Response)
    func onError(_ error: Error?)
}

// Model
protocol BalabobaModelProtocol {
    var presenter: BalabobaPresenterProtocol? { get set }
    func sendBalaboba(_ text: String, genreId: Int)
}
