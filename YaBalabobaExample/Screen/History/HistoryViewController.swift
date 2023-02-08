//
//  HistoryViewController.swift
//  YaBalabobaExample
//
//  Created by mvc on 08.02.2023.
//

import UIKit

class HistoryViewController: BaseViewController, HistoryViewProtocol {
    
    var presenter: HistoryPresenterProtocol?
    
    var tableView: HistoryTableView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        let presenter = HistoryPresenter()
        let model = HistoryModel()
        
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
        tableView = HistoryTableView()
        view.addSubview(tableView)
        addConstraintsFullScreen(tableView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "История запросов"
        guard let historyList = presenter?.getHistoryResponse() else { return }
        showHistory(historyList)
    }
    
    func showHistory(_ historyList: [History]) {
        tableView.setup(historyList)
    }
    
}
