//
//  HistoryModel.swift
//  YaBalabobaExample
//
//  Created by mvc on 08.02.2023.
//

import Foundation
import YaBalaboba

typealias History = Response

class HistoryModel: HistoryModelProtocol {
    
    var balaboba: YaBalaboba
    var presenter: HistoryPresenterProtocol?

    init() {
        self.balaboba = YaBalaboba()
    }
    
    func getHistoryResponse() -> [History] {
        return balaboba
                .getResponseList()
                .map({ History(query: $0.query, text: $0.text) }).reversed()
    }
    
}
