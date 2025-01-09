//
//  Week4FirstView.swift
//  Roomie_Study
//
//  Created by 김승원 on 1/9/25.
//

import UIKit

import SnapKit
import Then

final class Week4FirstView: UIView {
    
    // MARK: - UIComponent
    
    let numberLabel = UILabel()
    
    let doubleNumberLabel = UILabel()
    
    let downButton = UIButton(type: .system)
    
    let upButton = UIButton(type: .system)
    
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
        numberLabel.do {
            $0.text = "0"
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 32, weight: .bold)
            $0.textAlignment = .center
            $0.numberOfLines = 1
        }
        
        doubleNumberLabel.do {
            $0.text = "0"
            $0.textColor = .mainPurpleLight
            $0.font = .systemFont(ofSize: 32, weight: .bold)
            $0.textAlignment = .center
            $0.numberOfLines = 1
        }
        
        downButton.do {
            $0.setTitle("누르면 줄어듬", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            $0.backgroundColor = .mainPurple
            $0.layer.cornerRadius = 12
            $0.clipsToBounds = true
        }
        
        upButton.do {
            $0.setTitle("누르면 늘어남", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            $0.backgroundColor = .mainPurple
            $0.layer.cornerRadius = 12
            $0.clipsToBounds = true
        }
    }
    
    private func setUI() {
        backgroundColor = .white
        
        addSubview(numberLabel)
        addSubview(doubleNumberLabel)
        addSubview(downButton)
        addSubview(upButton)
    }
    
    private func setLayout() {
        numberLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(200)
        }
        
        doubleNumberLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(numberLabel.snp.bottom).offset(70)
        }
        
        upButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(62)
        }
        
        downButton.snp.makeConstraints {
            $0.bottom.equalTo(upButton.snp.top).offset(-12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(62)
        }
    }
    
}
