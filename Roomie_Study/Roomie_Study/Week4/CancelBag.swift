//
//  CancelBag.swift
//  Roomie_Study
//
//  Created by 김승원 on 1/9/25.
//

import Foundation
import Combine

final class CancelBag {
    fileprivate var subscriptions = Set<AnyCancellable>()
    
    deinit {
        cancel()
    }
    
    func cancel() {
        subscriptions.forEach { $0.cancel() }
        subscriptions.removeAll()
    }
}

extension AnyCancellable {
    func store(in cancelBag: CancelBag) {
        cancelBag.subscriptions.insert(self)
    }
}
