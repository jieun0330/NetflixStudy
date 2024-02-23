//
//  LoginViewController.swift
//  SeSACFirstApp_HW
//
//  Created by 박지은 on 2/23/24.
//

import UIKit
import SnapKit

class LoginViewController: BaseViewController {
        
    let emailTextField = UITextField().then { _ in
        
    }
    
    let pwTextField = UITextField().then { _ in
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func configureHierarchy() {
        [emailTextField, pwTextField].forEach {
            view.addSubview($0)
        }
    }
    
    override func configureConstraints() {
        emailTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(40)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(30)
        }
        
        pwTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(40)
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.height.equalTo(30)
        }
    }
    
    override func configureView() {
        view.backgroundColor = .black
        textFieldDesign(emailTextField, placeholder: "이메일 주소 또는 전화번호")
        textFieldDesign(pwTextField, placeholder: "비밀번호")
    }
    
    func textFieldDesign(_ textField: UITextField, placeholder: String) {
        textField.placeholder = placeholder
        textField.backgroundColor = .systemGray6
        textField.textAlignment = .center
    }
}
