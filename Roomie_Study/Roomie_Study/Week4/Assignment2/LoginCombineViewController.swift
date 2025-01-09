//
//  LoginCombineViewController.swift
//  Roomie_Study
//
//  Created by 김승원 on 1/9/25.
//

import UIKit
import Combine

import CombineCocoa

final class LoginCombineViewController: UIViewController {
    
    // MARK: - Property
    
    private let rootView = LoginView()
    //    private let viewModel = LoginCombineViewModel()
    
    private let cancelBag = CancelBag()
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAction()
    }
    
    // MARK: - Functions
    
    private func setAction() {
        Publishers
            .CombineLatest(
                rootView.idTextField.textPublisher.compactMap { $0 },
                rootView.passwordTextField.textPublisher.compactMap { $0 }
            )
            .map { id, password in
                id.count >= 5 && password.count >= 8
            }
            .sink { [weak self] isValid in
                guard let self else { return }
                self.rootView.loginButton.isEnabled = isValid
                UIView.animate(withDuration: 0.3) {
                    self.rootView.loginButton.backgroundColor = isValid ? .mainPurple : .gray2
                }
            }
            .store(in: cancelBag)
        
        rootView.loginButton
            .tapPublisher
            .sink { [weak self] _ in
                guard let self else { return }
                let id = self.rootView.idTextField.text ?? ""
                let password = self.rootView.passwordTextField.text ?? ""
                
                if id == "roomienotty" && password == "guhappyshare" {
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
            .store(in: cancelBag)
    }
}
