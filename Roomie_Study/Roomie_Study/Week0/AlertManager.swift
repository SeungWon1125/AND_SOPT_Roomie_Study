//
//  AlertManager.swift
//  Roomie_Study
//
//  Created by 김승원 on 12/30/24.
//

import UIKit

class AlertManager {
    
    /// 화면에 알림을 표시합니다.
    ///
    /// - Parameters:
    ///   - vc: 알림을 표시할 대상 'UIViewController' 인스턴스입니다.
    ///   - title: 알림의 제목을 나타내는 문자열입니다.
    ///   - message: 알림의 내용이나 메세지를 나타내는 문자열입니다. 메세지가 필요 없는 경우 'nil'을 사용할 수 있습니다.
    ///   - needsCancelButton: 'true'일 경우 취소 버튼이 추가되고, 'false'일 경우 추가되지 않습니다.
    ///
    public static func showAlert(
        on vc: UIViewController, title: String, message: String?, needsCancelButton: Bool,
        confirmHandler: ((UIAlertAction) -> Void)? = nil
    ) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            if needsCancelButton {
                let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
                alert.addAction(cancelAction)
            }
            
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: confirmHandler))
            vc.present(alert, animated: true, completion: nil)
        }
    }
}
