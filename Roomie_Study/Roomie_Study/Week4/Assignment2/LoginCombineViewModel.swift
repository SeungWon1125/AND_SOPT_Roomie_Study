//
//  LoginCombineViewModel.swift
//  Roomie_Study
//
//  Created by 김승원 on 1/9/25.
//

import Foundation

final class LoginCombineViewModel {
    
    // MARK: - Property
    
    var id: String = "" {
        didSet {
            print("ReactiveViewModel: 입력받은 id \(id)")
            buttonValid()
        }
    }
    
    var password: String = "" {
        didSet {
            print("ReactiveViewModel: 입력받은 password \(password)")
            buttonValid()
        }
    }
    
    var buttonToggle: Bool = false {
        didSet {
            print("ReactiveViewModel: 버튼 눌림")
            LoginValid()
        }
    }
    
    var isButtonEnabled = Observable<Bool>.init(false)
    var isLoginSucceed = Observable<Bool>.init(nil)
    
    // MARK: - Property
    
    private func buttonValid() {
        isButtonEnabled.value = id.count >= 5 && password.count >= 8 ? true : false
    }
    
    private func LoginValid() {
        isLoginSucceed.value = id == "roomienotty" && password == "guhappyshare"
    }
    
}

