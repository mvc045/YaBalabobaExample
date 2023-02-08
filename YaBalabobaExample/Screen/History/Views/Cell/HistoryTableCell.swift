//
//  HistoryTableCell.swift
//  YaBalabobaExample
//
//  Created by mvc on 08.02.2023.
//

import UIKit

class HistoryTableCell: BaseTableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var subheaderLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.backgroundColor = .systemGray6
        mainView.layer.cornerRadius = 12
        subheaderLabel.font = UIFont.BrandStyle.subheader
        noteLabel.font = UIFont.BrandStyle.text
        subheaderLabel.textColor = UIColor.BrandStyle.gray
        noteLabel.textColor = UIColor.BrandStyle.black
    }
    
    func setup(_ data: History) {
        subheaderLabel.text = data.query
        noteLabel.text = data.text
    }
    
}
