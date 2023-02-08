//
//  IntroGenreTableCell.swift
//  YaBalabobaExample
//
//  Created by mvc on 07.02.2023.
//

import UIKit

class IntroGenreTableCell: BaseTableViewCell {

    @IBOutlet weak var genreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        genreLabel.textColor = UIColor.BrandStyle.black
        genreLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
    }
    
}
