//
//  BaseTableViewCell.swift
//  YaBalabobaExample
//
//  Created by mvc on 07.02.2023.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configuration()
    }
    
    private func configuration() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
}
