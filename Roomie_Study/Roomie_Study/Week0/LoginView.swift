//
//  LoginView.swift
//  Roomie_Study
//
//  Created by 김승원 on 12/29/24.
//

import UIKit

import SnapKit
import Then

final class LoginView: UIView {
    
    // MARK: - UIComponent
    
    private let titleLabel = UILabel()
    
    let idTextField = RoomieTextField(.id)
    
    let passwordTextField = RoomieTextField(.password)
    
    let loginButton = UIButton()
    
    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UISetting
    
    private func setStyle() {
        self.backgroundColor = .white
        
        titleLabel.do {
            $0.text = "ROOMIE"
            $0.textColor = .mainPurple
            $0.font = .systemFont(ofSize: 20, weight: .bold)
            $0.textAlignment = .center
        }
        
        loginButton.do {
            $0.setTitle("로그인하기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
            $0.backgroundColor = .gray2
            $0.layer.cornerRadius = 12
            $0.clipsToBounds = true
        }
    }
    
    private func setUI() {
        addSubview(titleLabel)
        addSubview(idTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).inset(48)
            $0.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(36)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(48)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(48)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(32)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
    }
}
