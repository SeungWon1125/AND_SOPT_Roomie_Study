//
//  LoginMVVMViewController.swift
//  Roomie_Study
//
//  Created by 김승원 on 12/31/24.
//

import UIKit

final class LoginMVVMViewController: UIViewController {
    
    // MARK: - Property
    
    private let rootView = LoginView()
    
    private var user: User = User(id: "", password: "")
    
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
    
    // 뷰 모델
    private func isUserValid(user: User) -> Bool {
        return user.id == "roomienotty" && user.password == "guhappyshare" ? true : false
    }
    
    @objc
    private func loginButtonDidTapped() {
        guard let id = rootView.idTextField.text,
              let password = rootView.passwordTextField.text else { return }
        
        user = User(id: id, password: password)
        
        // 이 부분에서 서버와 통신 후 올바른 id와 password인지 판단할 것 같다
        // 이 친구도 Bool값으로 뷰모델한테 전달받으면 좋을 거 같은데
        if isUserValid(user: user) {
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

// MARK: - UITextFieldDelegate

extension LoginMVVMViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let currentText = textField.text ?? ""
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        // 이 아래의 부분도 뷰모델로 보내고 싶다..
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
