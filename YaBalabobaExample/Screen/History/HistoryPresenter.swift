//
//  HistoryPresenter.swift
//  YaBalabobaExample
//
//  Created by mvc on 08.02.2023.
//

import Foundation

class HistoryPresenter: HistoryPresenterProtocol {
    
    var model: HistoryModelProtocol?
    var view: HistoryViewProtocol?
    
    func getHistoryResponse() -> [Response] {
        return model?.getHistoryResponse() ?? []
    }
    
}
