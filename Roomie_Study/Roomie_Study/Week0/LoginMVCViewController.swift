//
//  LoginMVCViewController.swift
//  Roomie_Study
//
//  Created by 김승원 on 12/29/24.
//

import UIKit

final class LoginMVCViewController: UIViewController {
    
    // MARK: - Property
    
    private let rootView = LoginView()
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
