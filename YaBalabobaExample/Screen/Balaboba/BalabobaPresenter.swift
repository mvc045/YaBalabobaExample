//
//  BalabobaPresenter.swift
//  YaBalabobaExample
//
//  Created by mvc on 07.02.2023.
//

import Foundation

class BalabobaPresenter: BalabobaPresenterProtocol {
    
    var model: BalabobaModelProtocol?
    var view: BalabobaViewProtocol?
    
    private var genre: Genre?
    
    func config(_ genre: Genre) {
        self.genre = genre
    }
    
    func getGenre() -> Genre? {
        return genre
    }
    
    func sendBalaboba(_ text: String) {
        guard let genre = genre, let genreId = genre.id else { return }
        view?.showProgress()
        model?.sendBalaboba(text, genreId: genreId)
    }
    
    func onSuccessBalaoba(_ data: Response) {
        view?.hideProgress()
        view?.builderScreen(data)
    }
    
    func onError(_ error: Error?) {
        print("Error: \(String(describing: error?.localizedDescription))")
    }
    
}
