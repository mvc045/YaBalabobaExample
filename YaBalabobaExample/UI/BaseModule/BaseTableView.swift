//
//  BaseTableView.swift
//  YaBalabobaExample
//
//  Created by mvc on 07.02.2023.
//

import UIKit

class BaseTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        separatorStyle = .none
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
