//
//  Week4FirstViewController.swift
//  Roomie_Study
//
//  Created by 김승원 on 1/9/25.
//

import UIKit
import Combine

import CombineCocoa

class Week4FirstViewController: UIViewController {
    
    // MARK: - Property
    
    private let rootView = Week4FirstView()
    
    private let tapSubject = CurrentValueSubject<Int, Never>(0)
    private let cancelBag = CancelBag()
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAction()
    }
    
    // MARK: - Functions
    
    private func setAction() {
        rootView.upButton
            .tapPublisher
            .sink { [weak self] _ in
                guard let self else { return }
                self.tapSubject.send(tapSubject.value + 1)
            }
            .store(in: cancelBag)
        
        rootView.downButton
            .tapPublisher
            .sink { [weak self] _ in
                guard let self else { return }
                self.tapSubject.send(tapSubject.value - 1 >= 0 ? tapSubject.value - 1 : 0)
            }
            .store(in: cancelBag)
        
        tapSubject
            .map { "\($0*2)"}
            .sink { [weak self] text in
                guard let self else { return }
                self.rootView.doubleNumberLabel.text = text
            }
            .store(in: cancelBag)
        
        tapSubject
            .map { "\($0)"}
            .sink { [weak self] text in
                guard let self else { return }
                self.rootView.numberLabel.text = text
            }
            .store(in: cancelBag)
    }
    
}
