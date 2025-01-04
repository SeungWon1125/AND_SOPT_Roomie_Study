//
//  TourViewModel.swift
//  Roomie_Study
//
//  Created by 김승원 on 1/2/25.
//

import Foundation

final class TourViewModel {
    
    // MARK: - Property
    
    var tourState = Observable<TourState>.init(.applyTour)
    
    // MARK: - Functions
    
    func applyTour() {
        tourState.value = .startTour
    }
    
    func startTour() {
        tourState.value = .writeContract
    }
    
    func writeContract() {
        tourState.value = .endTour
    }
}
