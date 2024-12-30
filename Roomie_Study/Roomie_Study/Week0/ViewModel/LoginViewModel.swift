//
//  LoginViewModel.swift
//  Roomie_Study
//
//  Created by 김승원 on 12/31/24.
//

import Foundation

protocol LoginViewModelDelegate: AnyObject {
    func loginButtonChange(_ isButtonEnabled: Bool)
    func loginResult(_ isLoginSuccess: Bool)
}

final class LoginViewModel {
    
    // MARK: - Property
    
    weak var delegate: LoginViewModelDelegate?
    private var user: User = User(id: "", password: "")
    
    // MARK: - Functions
    
    private func isValidUser() {
        let isButtonEnabled = user.id.count >= 5 && user.password.count >= 8 ? true : false
        
        delegate?.loginButtonChange(isButtonEnabled)
    }
    
    func updateID(_ id: String) {
        // id를 받으면 현재까지 입력된 id, password의 글자수가 유요한지 검사해야함 흠..
        user.id = id
        isValidUser()
        
    }
    
    func updatePassword(_ password: String) {
        // password를 받으면 현재까지 입력된 id, password의 글자수가 유요한지 검사해야함
        user.password = password
        isValidUser()
    }
    
    func login() {
        let isLoginSuccess = user.id == "roomienotty" && user.password == "guhappyshare"
        
        delegate?.loginResult(isLoginSuccess)
    }
    
}
