//
//  ReactiveViewController.swift
//  Roomie_Study
//
//  Created by 김승원 on 1/4/25.
//

import UIKit

class ReactiveViewController: UIViewController {
    
    // MARK: - Property
    
    private let rootView = LoginView()
    private let viewModel = ReactiveViewModel()
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setAction()
        bindViewModel()
    }
    
    // MARK: - Functions
    
    private func setAction() {
        rootView.idTextField.addTarget(
            self,
            action: #selector(textFieldDidChange),
            for: .editingChanged
        )
        
        rootView.passwordTextField.addTarget(
            self,
            action: #selector(textFieldDidChange),
            for: .editingChanged
        )
        
        rootView.loginButton.addTarget(
            self,
            action: #selector(loginButtonDidTap),
            for: .touchUpInside
        )
    }
    
    private func bindViewModel() {
        viewModel.isButtonEnabled.bind { [weak self] isButtonEnabled in
            guard let isButtonEnabled else { return }
            guard let self else { return }
            
            UIView.animate(withDuration: 0.3) {
                self.rootView.loginButton.isEnabled = isButtonEnabled ? true : false
                self.rootView.loginButton.backgroundColor = isButtonEnabled ? .mainPurple : .gray2
            }
        }
        
        viewModel.isLoginSucceed.bind { [weak self] isLoginSucceed in
            guard let isLoginSucceed else { return }
            guard let self else { return }
            
            if isLoginSucceed {
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
    
    @objc
    private func loginButtonDidTap() {
        viewModel.buttonToggle.toggle()
    }
    
    @objc
    private func textFieldDidChange(sender: UITextField) {
        if sender == rootView.idTextField {
            viewModel.id = sender.text ?? ""
        } else {
            viewModel.password = sender.text ?? ""
        }
    }

}
