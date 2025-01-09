//
//  LoginCombineViewModel.swift
//  Roomie_Study
//
//  Created by 김승원 on 1/9/25.
//

import Foundation
import Combine

final class LoginCombineViewModel {
    
}

extension LoginCombineViewModel: ViewModelType {
    struct Input {
        let idText: AnyPublisher<String, Never>
        let passwordText: AnyPublisher<String, Never>
    }
    
    struct Output {
        let buttonEnabled: AnyPublisher<Bool, Never>
    }
    
    func transform(from input: Input, cancelBag: CancelBag) -> Output {
        let buttonEnabled = input.idText
            .combineLatest(input.passwordText)
            .map { $0.count >= 5 && $1.count >= 8 }
            .eraseToAnyPublisher()
        
        return Output (buttonEnabled: buttonEnabled)
    }
    
    
}

