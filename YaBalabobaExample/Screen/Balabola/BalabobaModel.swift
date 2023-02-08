//
//  BalabobaModel.swift
//  YaBalabobaExample
//
//  Created by mvc on 07.02.2023.
//

import Foundation
import YaBalaboba

struct Response {
    var query: String?
    var text: String?
}

class BalabobaModel: BalabobaModelProtocol {

    var balaboba: YaBalaboba
    var presenter: BalabobaPresenterProtocol?
    
    init() {
        self.balaboba = YaBalaboba()
    }
    
    
    func sendBalaboba(_ text: String, genreId: Int) {
        balaboba.getText(query: text, genreId: genreId) { [presenter] data, error in
            guard let data = data else { presenter?.onError(error); return }
            presenter?.onSuccessBalaoba(Response(query: data.query, text: data.text))
        }
    }
    
}
