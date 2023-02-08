//
//  IntroViewController.swift
//  YaBalabobaExample
//
//  Created by mvc on 07.02.2023.
//

import UIKit

class IntroViewController: BaseViewController, IntroViewProtocol {
    
    var presenter: IntroPresenterProtocol?
    var tableView: IntroViewTable!
        
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        let presenter = IntroPresenter()
        let model = IntroModel()
        
        self.presenter = presenter
        presenter.view = self
        presenter.model = model
        model.presenter = presenter
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func loadView() {
        super.loadView()
        tableView = IntroViewTable()
        tableView.introViewTableDelegate = self
        view.addSubview(tableView)
        addConstraintsFullScreen(tableView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getIntroList()
    }
    
    func builderScreen(_ data: [Genre]) {
        DispatchQueue.main.async { [self] in
            tableView.setup(data)
            tableView.reloadData()
        }
    }
    
}

extension IntroViewController: IntroViewTableDelegate {
    
    func didSelectedGenre(_ selected: Genre) {
        presenter?.didSelectedGenre(selected)
    }
    
    func didSelectedHistory() {
        presenter?.didSelectedHistory()
    }
    
}
