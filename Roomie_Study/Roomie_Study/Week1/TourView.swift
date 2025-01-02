//
//  TourView.swift
//  Roomie_Study
//
//  Created by 김승원 on 1/2/25.
//

import UIKit

import SnapKit
import Then

final class TourView: UIView {

    // MARK: - UIComponent
    
    let titleLabel = UILabel()
    
    let applyTourButton = UIButton(type: .system)
    
    let startTourButton = UIButton(type: .system)
    
    let contractButton = UIButton(type: .system)
    
    private let buttonStackView = UIStackView()
    
    // MARK: - Initialzer
    
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
            $0.text = " "
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 24, weight: .semibold)
            $0.numberOfLines = 2
            $0.textAlignment = .left
        }
        
        applyTourButton.do {
            $0.setTitle("투어 신청", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            $0.backgroundColor = .mainPurpleLight
            $0.layer.cornerRadius = 12
            $0.clipsToBounds = true
            $0.isEnabled = false
        }
        
        startTourButton.do {
            $0.setTitle("투어", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            $0.backgroundColor = .mainPurpleLight
            $0.layer.cornerRadius = 12
            $0.clipsToBounds = true
            $0.isEnabled = false
        }
        
        contractButton.do {
            $0.setTitle("계약서 작성", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            $0.backgroundColor = .mainPurpleLight
            $0.layer.cornerRadius = 12
            $0.clipsToBounds = true
            $0.isEnabled = false
        }
        
        buttonStackView.do {
            $0.addArrangedSubview(applyTourButton)
            $0.addArrangedSubview(startTourButton)
            $0.addArrangedSubview(contractButton)
            $0.spacing = 16
            $0.distribution = .fillEqually
            $0.axis = .vertical
            $0.alignment = .fill
        }
    }
    
    private func setUI() {
        self.addSubview(titleLabel)
        self.addSubview(buttonStackView)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(70)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(64)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(180 + 32)
        }
        
    }
}
