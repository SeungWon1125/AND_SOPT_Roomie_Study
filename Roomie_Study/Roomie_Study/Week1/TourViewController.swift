//
//  TourViewController.swift
//  Roomie_Study
//
//  Created by 김승원 on 1/2/25.
//

import UIKit

final class TourViewController: UIViewController {
    
    // MARK: - Property
    
    private let viewModel = TourViewModel()
    private let rootView = TourView()
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAction()
        bindViewModel()
    }
    
    // MARK: - Functions
    
    private func setAction() {
        rootView.applyTourButton.addTarget(
            self,
            action: #selector(applyTourButtonDidTap),
            for: .touchUpInside
        )
        
        rootView.startTourButton.addTarget(
            self,
            action: #selector(startTourButtonDidTap),
            for: .touchUpInside
        )
        
        rootView.contractButton.addTarget(
            self,
            action: #selector(contractButtonDidTap),
            for: .touchUpInside
        )
    }
    
    private func bindViewModel() {
        viewModel.tourState.bind { [weak self] tourState in
            guard let tourState else { return }
            guard let self else { return }
            
            rootView.titleLabel.text = tourState.buttonTitle
            changeButtonState(tourState: tourState)
        }
    }
    
    @objc
    private func applyTourButtonDidTap() {
        print(#function)
        viewModel.applyTour()
    }
    
    @objc
    private func startTourButtonDidTap() {
        print(#function)
        viewModel.startTour()
    }
    
    @objc
    private func contractButtonDidTap() {
        print(#function)
        viewModel.writeContract()
    }
    
}

extension TourViewController {
    private func changeButtonState(tourState: TourState) {
        switch tourState {
        case .applyTour:
            rootView.applyTourButton.isEnabled = true
            rootView.startTourButton.isEnabled = false
            rootView.contractButton.isEnabled = false
            rootView.applyTourButton.backgroundColor = .mainPurple
            rootView.startTourButton.backgroundColor = .mainPurpleLight
            rootView.contractButton.backgroundColor = .mainPurpleLight
            
        case .startTour:
            rootView.applyTourButton.isEnabled = false
            rootView.startTourButton.isEnabled = true
            rootView.contractButton.isEnabled = false
            UIView.animate(withDuration: 0.3) {
                self.rootView.applyTourButton.backgroundColor = .gray1
                self.rootView.startTourButton.backgroundColor = .mainPurple
                self.rootView.contractButton.backgroundColor = .mainPurpleLight
            }
            
        case .writeContract:
            rootView.applyTourButton.isEnabled = false
            rootView.startTourButton.isEnabled = false
            rootView.contractButton.isEnabled = true
            UIView.animate(withDuration: 0.3) {
                self.rootView.applyTourButton.backgroundColor = .gray1
                self.rootView.startTourButton.backgroundColor = .gray1
                self.rootView.contractButton.backgroundColor = .mainPurple
            }
            
        case .endTour:
            rootView.applyTourButton.isEnabled = false
            rootView.startTourButton.isEnabled = false
            rootView.contractButton.isEnabled = false
            UIView.animate(withDuration: 0.3) {
                self.rootView.applyTourButton.backgroundColor = .gray1
                self.rootView.startTourButton.backgroundColor = .gray1
                self.rootView.contractButton.backgroundColor = .gray1
            }
        }
    }
}
