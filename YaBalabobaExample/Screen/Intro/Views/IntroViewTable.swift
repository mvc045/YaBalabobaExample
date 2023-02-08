//
//  IntroViewTable.swift
//  YaBalabobaExample
//
//  Created by mvc on 07.02.2023.
//

import UIKit

protocol IntroViewTableDelegate: AnyObject {
    func didSelectedGenre(_ selected: Genre)
    func didSelectedHistory()
}

class IntroViewTable: BaseTableView {
    
    var data: [IntroTableSection] = []
    
    weak var introViewTableDelegate: IntroViewTableDelegate?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        translatesAutoresizingMaskIntoConstraints = false
        dataSource = self
        delegate = self
        
        let cells: [String] = ["IntroInfoTableCell", "IntroGenreTableCell"]
        cells.forEach({ registerNibCell($0) })
        register(IntroHistoryTableCell.self, forCellReuseIdentifier: "IntroHistoryTableCell")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func registerNibCell(_ nibName: String) {
        register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
    
    func setup(_ data: [Genre]) {
        self.data = data.map({ IntroTableSection(type: .genre, data: $0) })
        self.data.insert(IntroTableSection(type: .info), at: 0)
        self.data.append(IntroTableSection(type: .history))
    }
    
}

extension IntroViewTable: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = data[indexPath.row].type
        switch type {
        case .info:
            let cell = tableView.dequeueReusableCell(withIdentifier: "IntroInfoTableCell", for: indexPath) as! IntroInfoTableCell
            return cell
        case .genre:
            let cell = tableView.dequeueReusableCell(withIdentifier: "IntroGenreTableCell", for: indexPath) as! IntroGenreTableCell
            let genre = data[indexPath.row].data as! Genre
            cell.genreLabel.text = genre.name
            return cell
        case .history:
            let cell = tableView.dequeueReusableCell(withIdentifier: "IntroHistoryTableCell", for: indexPath) as! IntroHistoryTableCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = data[indexPath.row].type
        switch type {
        case .genre:
            let genre = data[indexPath.row].data as! Genre
            introViewTableDelegate?.didSelectedGenre(genre)
        case .history:
            introViewTableDelegate?.didSelectedHistory()
        default:
            break
        }
    }
    
}

extension IntroViewTable {

    struct IntroTableSection {
        var type: IntroTableType
        var data: Any?
    }
    
    enum IntroTableType {
        case info, genre, history
    }
    
}
