//
//  BaseViewController.swift
//  YaBalabobaExample
//
//  Created by mvc on 07.02.2023.
//

import UIKit

protocol BaseViewProtocol {
    func showProgress()
    func hideProgress()
}

class BaseViewController: UIViewController, BaseViewProtocol {
    
    private var progressBar: UIActivityIndicatorView!
    
    override func loadView() {
        super.loadView()
        setupProgressBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.BrandStyle.white
        setupNavigationBackButton()
    }
    
    private func setupProgressBar() {
        progressBar = UIActivityIndicatorView(style: .large)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.hidesWhenStopped = true
        view.addSubview(progressBar)
        NSLayoutConstraint.activate([
            progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressBar.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    func showProgress() {
        DispatchQueue.main.async { [progressBar] in
            progressBar?.isHidden = false
            progressBar?.startAnimating()
        }
    }
    
    func hideProgress() {
        DispatchQueue.main.async { [progressBar] in
            progressBar?.stopAnimating()
        }
    }
    
    
    private func setupNavigationBackButton() {
        let backButton = UIBarButtonItem()
        backButton.title = " "
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        navigationController?.navigationBar.topItem?.backBarButtonItem?.tintColor = UIColor.BrandStyle.black
    }
    
    func registerForKeyboardWillShowNotification(_ scrollView: UIScrollView, usingBlock block: ((CGSize?) -> Void)? = nil) {
        _ = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil, using: { notification -> Void in
            let userInfo = notification.userInfo!
            let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey]! as AnyObject).cgRectValue.size
            let contentInsets = UIEdgeInsets(top: scrollView.contentInset.top, left: scrollView.contentInset.left, bottom: keyboardSize.height+16, right: scrollView.contentInset.right)
            scrollView.contentInset = (contentInsets)
            block?(keyboardSize)
        })
    }
    
    func registerForKeyboardWillHideNotification(_ scrollView: UIScrollView, usingBlock block: (() -> Void)? = nil) {
        _ = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil, using: { _ -> Void in
            let contentInsets = UIEdgeInsets(top: scrollView.contentInset.top, left: scrollView.contentInset.left, bottom: 0, right: scrollView.contentInset.right)
            scrollView.contentInset = (contentInsets)
            block?()
        })
    }
    
}
