//
//  RoomieTextField.swift
//  Roomie_Study
//
//  Created by 김승원 on 12/29/24.
//

import UIKit

enum RoomieTextFieldStyle {
    case id
    case password
    case nickName
    
    var placeholder: String {
        switch self {
        case .id: return "아이디"
        case .password: return "비밀번호"
        case .nickName: return "닉네임을 입력해주세요."
        }
    }
}

class RoomieTextField: UITextField {
    
    // MARK: - Property
    
    private let textFieldStyle: RoomieTextFieldStyle

    // MARK: - Initializer
    
    init(_ textFieldStyle: RoomieTextFieldStyle) {
        self.textFieldStyle = textFieldStyle
        
        super.init(frame: .zero)
        
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UISetting
    
    private func setStyle() {
        layer.borderColor = UIColor.gray2.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
        clipsToBounds = true
        placeholder = textFieldStyle.placeholder
        font = .systemFont(ofSize: 16)
        let leftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        leftView = leftPadding
        leftViewMode = .always
    }
}
