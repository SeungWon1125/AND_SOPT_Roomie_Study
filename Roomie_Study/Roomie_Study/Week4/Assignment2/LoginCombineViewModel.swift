//
//  LoginCombineViewModel.swift
//  Roomie_Study
//
//  Created by 김승원 on 1/9/25.
//

import Foundation
import Combine

final class LoginCombineViewModel {
    var id: String = ""
    var password: String = ""
}

extension LoginCombineViewModel: ViewModelType {
    struct Input {
        let idText: AnyPublisher<String, Never>
        let passwordText: AnyPublisher<String, Never>
        let tapSubject: AnyPublisher<Void, Never>
    }
    
    struct Output {
        let buttonEnabled: AnyPublisher<Bool, Never>
        let loginSuccess: AnyPublisher<Bool, Never>
    }
    
    func transform(from input: Input, cancelBag: CancelBag) -> Output {
        input.idText
            .sink { self.id = $0 }
            .store(in: cancelBag)
        
        input.passwordText
            .sink { self.password = $0 }
            .store(in: cancelBag)
        
        let buttonEnabled = input.idText
            .combineLatest(input.passwordText)
            .map { $0.count >= 5 && $1.count >= 8 }
            .eraseToAnyPublisher()
        
        let loginSuccess = input.tapSubject
            .map {
                self.id == "roomienotty" && self.password == "guhappyshare"
            }
            .eraseToAnyPublisher()
            
        return Output (buttonEnabled: buttonEnabled, loginSuccess: loginSuccess)
    }
}
