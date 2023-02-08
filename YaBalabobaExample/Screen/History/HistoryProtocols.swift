//
//  HistoryProtocols.swift
//  YaBalabobaExample
//
//  Created by mvc on 08.02.2023.
//

import UIKit

// View
protocol HistoryViewProtocol: UIViewController, BaseViewProtocol {
    var presenter: HistoryPresenterProtocol? { get set }
    
    func showHistory(_ historyList: [History])
}

// Presenter
protocol HistoryPresenterProtocol {
    var model: HistoryModelProtocol? { get set }
    var view: HistoryViewProtocol? { get set }
    
    func getHistoryResponse() -> [History]
}

// Model
protocol HistoryModelProtocol {
    var presenter: HistoryPresenterProtocol? { get set }
    
    func getHistoryResponse() -> [History]
}
