//
//  LoginMVCViewController.swift
//  Roomie_Study
//
//  Created by 김승원 on 12/29/24.
//

import UIKit

final class LoginMVCViewController: UIViewController {
    
    // MARK: - Property
    
    private let rootView = LoginView()
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAction()
        setDelegate()
    }
    
    // MARK: - Functions
    
    private func setAction() {
        rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
    }
    
    private func setDelegate() {
        rootView.idTextField.delegate = self
        rootView.passwordTextField.delegate = self
    }
    
    @objc
    private func loginButtonDidTapped() {
        if rootView.idTextField.text == "roomienotty" && rootView.passwordTextField.text == "guhappyshare" {
            AlertManager.showAlert(on: self, title: "로그인 성공", message: nil, needsCancelButton: false)
        } else {
            AlertManager
                .showAlert(
                    on: self,
                    title: "로그인 실패",
                    message: "다시 시도하세요",
                    needsCancelButton: false
                )
        }
    }
}

// MARK: - UITextFieldDelegate

extension LoginMVCViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let currentText = textField.text ?? ""
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        let isIDValid = (
            textField == rootView.idTextField
        ) ? updatedText.count >= 5 : rootView.idTextField.text?.count ?? 0 >= 5
        
        let isPasswordValid = (
            textField == rootView.passwordTextField
        ) ? updatedText.count >= 8 : rootView.passwordTextField.text?.count ?? 0 >= 8
        
        if isIDValid && isPasswordValid {
            UIView.animate(withDuration: 0.3) { [weak self] in
                guard let self else { return }
                rootView.loginButton.isEnabled = true
                rootView.loginButton.backgroundColor = .mainPurple
            }
        } else {
            UIView.animate(withDuration: 0.3) { [weak self] in
                guard let self else { return }
                rootView.loginButton.isEnabled = false
                rootView.loginButton.backgroundColor = .gray2
            }
        }
        
        return true
    }
}
