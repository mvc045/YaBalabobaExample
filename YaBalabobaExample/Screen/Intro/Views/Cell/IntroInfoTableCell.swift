//
//  IntroInfoTableCell.swift
//  YaBalabobaExample
//
//  Created by mvc on 07.02.2023.
//

import UIKit

class IntroInfoTableCell: BaseTableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var subHeaderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        style()
        logoImageView.image = UIImage(named: "logo")!
        noteLabel.text = """
        Балабоба демонстрирует, как с помощью нейросетей семейства YaLM можно продолжать тексты на любую тему, сохраняя связность и заданный стиль. Здесь YaLM используется для развлечения, но разрабатывались модели для серьёзных задач — например, Поиска или Алисы.
        """
        subHeaderLabel.text = "Варианты стилизации: "
    }
    
    private func style() {
        noteLabel.font = UIFont.BrandStyle.text
        subHeaderLabel.font = UIFont.BrandStyle.subheader
        
        noteLabel.textColor = UIColor.BrandStyle.black
        subHeaderLabel.textColor = UIColor.BrandStyle.black
    }

}
