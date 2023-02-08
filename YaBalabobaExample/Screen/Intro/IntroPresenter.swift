//
//  IntroPresenter.swift
//  YaBalabobaExample
//
//  Created by mvc on 07.02.2023.
//

import Foundation

class IntroPresenter: IntroPresenterProtocol {
    
    var model: IntroModelProtocol?
    var view: IntroViewProtocol?
    
    //MARK: - DataSource
    func getIntroList() {
        view?.showProgress()
        model?.getIntroList()
    }
    
    func onIntroList(_ data: [Genre]) {
        view?.hideProgress()
        view?.builderScreen(data)
    }
    
    func onError(_ error: Error?) {
        view?.hideProgress()
        print("Error: \(String(describing: error?.localizedDescription))")
    }
    
    //MARK: - Action
    func didSelectedGenre(_ selected: Genre) {
        navigateToBalaboba(genre: selected)
    }
    
    func didSelectedHistory() {
        navigateToHistory()
    }
    
}

//MARK: Router

extension IntroPresenter {
    
    func navigateToBalaboba(genre: Genre) {
        let balabobaController = BalabobaViewController()
        balabobaController.config(genre)
        view?.navigationController?.pushViewController(balabobaController, animated: true)
    }
    
    func navigateToHistory() {
        let historyController = HistoryViewController()
        view?.navigationController?.pushViewController(historyController, animated: true)
    }
    
}
