//
//  LoginViewModel.swift
//  Roomie_Study
//
//  Created by 김승원 on 12/31/24.
//

import Foundation

final class LoginViewModel {
    
    // MARK: - Property
    
    var isButtonEnabled = Observable<Bool>.init(false)
    var isLoginSucceed = Observable<Bool>.init(nil)
    private var user: User = User(id: "", password: "")
    
    // MARK: - Functions
    
    private func isValidUser() {
        isButtonEnabled.value = user.id.count >= 5 && user.password.count >= 8 ? true : false
    }
    
    func updateID(_ id: String) {
        user.id = id
        isValidUser()
    }
    
    func updatePassword(_ password: String) {
        user.password = password
        isValidUser()
    }
    
    func login() {
        isLoginSucceed.value = user.id == "roomienotty" && user.password == "guhappyshare"
    }
    
}
