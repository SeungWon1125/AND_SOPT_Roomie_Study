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
    private let viewModel = LoginCombineViewModel()
    private let cancelBag = CancelBag()
    
    private let idSubject = CurrentValueSubject<String, Never>("")
    private let passwordSubject = CurrentValueSubject<String, Never>("")
    private let tapSubject = PassthroughSubject<Void, Never>()
    
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
        rootView.idTextField
            .textPublisher
            .compactMap { $0 }
            .sink { [weak self] text in
                guard let self else { return }
                self.idSubject.send(text)
            }
            .store(in: cancelBag)
        
        rootView.passwordTextField
            .textPublisher
            .compactMap { $0 }
            .sink { [weak self] text in
                guard let self else { return }
                self.passwordSubject.send(text)
            }
            .store(in: cancelBag)
        
        rootView.loginButton
            .tapPublisher
            .sink { [weak self] in
                guard let self else { return }
                self.tapSubject.send()
            }
            .store(in: cancelBag)
    }
    
    private func bindViewModel() {
        let input = LoginCombineViewModel.Input(
            idText: idSubject.eraseToAnyPublisher(),
            passwordText: passwordSubject.eraseToAnyPublisher(),
            tapSubject: tapSubject.eraseToAnyPublisher()
        )
        
        let output = viewModel.transform(from: input, cancelBag: cancelBag)
        
        output.buttonEnabled
            .sink { [weak self] buttonEnabled in
                guard let self else { return }
                UIView.animate(withDuration: 0.3) {
                    self.rootView.loginButton.isEnabled = buttonEnabled
                    self.rootView.loginButton.backgroundColor = buttonEnabled ? .mainPurple: .gray2
                }
            }
            .store(in: cancelBag)
        
        output.loginSuccess
            .sink { [weak self] loginSuccess in
                guard let self else { return }
                
                if loginSuccess {
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
