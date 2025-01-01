//
//  Observable.swift
//  Roomie_Study
//
//  Created by 김승원 on 1/1/25.
//

import Foundation

class Observable<T> {
    var value: T? {
        didSet {
            self.observer?(value)
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    private var observer: ((T?) -> Void)?
    
    func bind(_ observer: @escaping (T?) -> Void) {
        observer(value)
        self.observer = observer
    }
}
