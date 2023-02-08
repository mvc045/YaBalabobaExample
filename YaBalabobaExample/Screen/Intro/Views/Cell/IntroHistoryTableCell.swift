//
//  IntroHistoryTableCell.swift
//  YaBalabobaExample
//
//  Created by mvc on 08.02.2023.
//

import UIKit

class IntroHistoryTableCell: BaseTableViewCell {

    private var historyButton: BrandButton!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        historyButton = BrandButton()
        historyButton.setTitle("История запросов", for: .normal)
        addSubview(historyButton)
        let padding: CGFloat = 8.0
        NSLayoutConstraint.activate([
            historyButton.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            historyButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding),
            historyButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            historyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            historyButton.heightAnchor.constraint(equalToConstant: BrandButton.heightButton),
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
