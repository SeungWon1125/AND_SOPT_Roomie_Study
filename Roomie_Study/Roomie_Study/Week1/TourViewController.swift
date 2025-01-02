//
//  TourViewController.swift
//  Roomie_Study
//
//  Created by 김승원 on 1/2/25.
//

import UIKit

final class TourViewController: UIViewController {
    
    // MARK: - Property
    
    private let rootView = TourView()
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
