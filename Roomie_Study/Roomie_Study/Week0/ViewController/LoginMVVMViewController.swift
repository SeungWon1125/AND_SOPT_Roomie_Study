//
//  LoginMVVMViewController.swift
//  Roomie_Study
//
//  Created by 김승원 on 12/31/24.
//

import UIKit

final class LoginMVVMViewController: UIViewController {
    
    // MARK: - Property
    
    private let viewModel = LoginViewModel()
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
        viewModel.delegate = self
    }

    @objc
    private func loginButtonDidTapped() {
        viewModel.login()
    }
}

// MARK: - UITextFieldDelegate

extension LoginMVVMViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        
        let currentText = textField.text ?? ""
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        if textField == rootView.idTextField {
            viewModel.updateID(updatedText)
        } else if textField == rootView.passwordTextField {
            viewModel.updatePassword(updatedText)
        }
        
        return true
    }
}

// MARK: - LoginViewModelProtocol

extension LoginMVVMViewController: LoginViewModelDelegate {
    func loginButtonChange(_ isButtonEnabled: Bool) {
        if isButtonEnabled {
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
    }
    
    func loginResult(_ isLoginSuccess: Bool) {
        if isLoginSuccess {
            AlertManager
                .showAlert(
                    on: self,
                    title: "로그인 성공",
                    message: nil,
                    needsCancelButton: false
                )
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
