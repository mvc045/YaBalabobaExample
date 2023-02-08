//
//  BalabobaViewController.swift
//  YaBalabobaExample
//
//  Created by mvc on 07.02.2023.
//

import UIKit

class BalabobaViewController: BaseViewController, BalabobaViewProtocol {
    
    var presenter: BalabobaPresenterProtocol?
    
    var textFiled: UITextField!
    var balabobaButton: BrandButton!
    var genreLabel: UILabel!
    var noteText: UITextView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        let presenter = BalabobaPresenter()
        let model = BalabobaModel()
        
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
        
        // 1.
        textFiled = UITextField(frame: .zero)
        textFiled.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textFiled)
        textFiled.placeholder = "Напишите что-нибудь"
        textFiled.borderStyle = .roundedRect
                        
        NSLayoutConstraint.activate([
            textFiled.heightAnchor.constraint(equalToConstant: 50),
            textFiled.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textFiled.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textFiled.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        // 2.
        balabobaButton = BrandButton(frame: .zero)
        view.addSubview(balabobaButton)
        
        balabobaButton.setTitle("Набалабобить", for: .normal)
        balabobaButton.addTarget(self, action: #selector(didBalabobaButtonTap), for: .touchDown)
        
        NSLayoutConstraint.activate([
            balabobaButton.heightAnchor.constraint(equalToConstant: BrandButton.heightButton),
            balabobaButton.topAnchor.constraint(equalTo: textFiled.bottomAnchor, constant: 20),
            balabobaButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            balabobaButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        // 3.
        genreLabel = UILabel()
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(genreLabel)
    
        genreLabel.text = "Cтилизация: \(getGenreName())"
        genreLabel.textColor = UIColor.BrandStyle.black
        genreLabel.font = UIFont.BrandStyle.subheader
        
        NSLayoutConstraint.activate([
            genreLabel.topAnchor.constraint(equalTo: balabobaButton.bottomAnchor, constant: 20),
            genreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            genreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        // 4.
        noteText = UITextView()
        noteText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(noteText)
        noteText.isEditable = false
        noteText.textContainer.lineFragmentPadding = 0
        noteText.font = UIFont.BrandStyle.text
        noteText.text = "Генератор может выдавать очень странные тексты. Пожалуйста, будьте разумны, распространяя их. Подумайте, не будет ли текст обидным для кого-то и не станет ли его публикация нарушением закона."
        
        NSLayoutConstraint.activate([
            noteText.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 20),
            noteText.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20),
            noteText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            noteText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    func config(_ genre: Genre) {
        presenter?.config(genre)
    }
    
    func builderScreen(_ data: Response) {
        DispatchQueue.main.async {
            self.balabobaButton.hideProgress()
            self.noteText.text = data.text
        }
    }
    
    @objc
    func didBalabobaButtonTap() {
        guard let text = textFiled.text else { return }
        balabobaButton.showProgress()
        presenter?.sendBalaboba(text)
    }
    
    private func getGenreName() -> String {
        return presenter?.getGenre()?.name ?? ""
    }

}
