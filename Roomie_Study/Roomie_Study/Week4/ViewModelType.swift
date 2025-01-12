//
//  ViewModelType.swift
//  Roomie_Study
//
//  Created by 김승원 on 1/10/25.
//

import Foundation

protocol ViewModelType {
    associatedtype Input // stream의 역할
    associatedtype Output // 데이터를 변경 및 조작
    
    func transform(from input: Input, cancelBag: CancelBag) -> Output
    // VC에서 전달 받은 이벤트(input)에 대해 적절한 비즈니스 로직을 처리하여 output을 반환
}
