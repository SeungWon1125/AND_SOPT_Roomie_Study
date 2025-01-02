//
//  TourState.swift
//  Roomie_Study
//
//  Created by 김승원 on 1/2/25.
//

import Foundation

enum TourState {
    case applyTour
    case startTour
    case writeContract
    case endTour
    
    var buttonTitle: String {
        switch self {
        case .applyTour:
            return "진행 현황이 존재하지 않아요.\n투어 신청을 시작해보아요."
        case .startTour:
            return "투어 신청을 완료했어요!\n투어를 시작해보세요."
        case .writeContract:
            return "투어를 완료했어요!\n계약서 작성을 시작해보세요."
        case .endTour:
            return "계약서 작성을 완료했어요!\n축하드려요."
        }
    }
}
