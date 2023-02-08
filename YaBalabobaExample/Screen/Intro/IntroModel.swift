//
//  IntroModel.swift
//  YaBalabobaExample
//
//  Created by mvc on 07.02.2023.
//

import Foundation
import YaBalaboba

class IntroModel: IntroModelProtocol {
    
    var balaboba: YaBalaboba
    var presenter: IntroPresenterProtocol?
    
    init() {
        self.balaboba = YaBalaboba()
    }
    
    func getIntroList() {
        balaboba.getGenreList() { [self] data, error in
            guard let data = data?.ganre else { presenter?.onError(error); return }
            presenter?.onIntroList(data.map({ Genre(id: $0.id, name: $0.name, description: $0.description) }))
        }
    }
    
}

struct Genre {
    var id: Int?
    var name: String?
    var description: String?
    
}
