//
//  BrandButton.swift
//  YaBalabobaExample
//
//  Created by mvc on 08.02.2023.
//

import UIKit

class BrandButton: UIButton {
    
    static let heightButton: CGFloat = 50.0
    
    private var titleButtonText: String?
    private var progressBar: UIActivityIndicatorView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        progressBar = setupProgressBar()
        backgroundColor = UIColor.BrandStyle.yellow
        titleLabel?.font = UIFont.BrandStyle.subheader
        setTitleColor(UIColor.BrandStyle.black, for: .normal)
        self.layer.cornerRadius = 12
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
        guard let title = title else { return }
        titleButtonText = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProgressBar() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }
    
    func showProgress() {
        addSubview(progressBar)
        setTitle(nil, for: .normal)
        NSLayoutConstraint.activate([
            progressBar.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            progressBar.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
        progressBar.startAnimating()
    }
    
    func hideProgress() {
        setTitle(titleButtonText, for: .normal)
        progressBar.stopAnimating()
    }
}
