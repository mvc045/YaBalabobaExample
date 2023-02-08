//
//  HistoryTableView.swift
//  YaBalabobaExample
//
//  Created by mvc on 08.02.2023.
//

import UIKit

class HistoryTableView: BaseTableView {
    
    var data: [HistoryTableSection] = []
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        translatesAutoresizingMaskIntoConstraints = false
        register(UINib(nibName: "HistoryTableCell", bundle: nil), forCellReuseIdentifier: "HistoryTableCell")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup(_ historyList: [History]) {
        data = historyList.map({ HistoryTableSection(type: .history, data: $0) })
        dataSource = self
        delegate = self
    }
    
}

extension HistoryTableView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableCell", for: indexPath) as! HistoryTableCell
        let historyElement = data[indexPath.row].data as! History
        cell.setup(historyElement)
        return cell
    }
    
}

extension HistoryTableView {

    struct HistoryTableSection {
        var type: HistoryTableType
        var data: Any?
    }
    
    enum HistoryTableType {
        case history
    }
    
}
