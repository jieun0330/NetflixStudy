//
//  LoginViewController.swift
//  SeSACFirstApp_HW
//
//  Created by 박지은 on 2/23/24.
//

import UIKit
import SnapKit

class LoginViewController: BaseViewController {
    
    let stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 20
        $0.alignment = .center
        $0.distribution = .equalSpacing
//        $0.layer.borderColor = UIColor.red.cgColor
//        $0.layer.borderWidth = 1
    }
        
    let emailTextField = UITextField().then { _ in
        
    }
    
    let pwTextField = UITextField().then { _ in
        
    }
    
    let resultLabel = UILabel().then {
        $0.text = "결과 라벨 공간"
        $0.textAlignment = .center
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func configureHierarchy() {
        [stackView, resultLabel].forEach {
            view.addSubview($0)
        }
        
        [emailTextField, pwTextField].forEach {
            stackView.addSubview($0)
        }
        
    }
    
    override func configureConstraints() {
        
        stackView.snp.makeConstraints {
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(40)
            $0.verticalEdges.equalTo(view.safeAreaLayoutGuide).inset(200)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(30)
        }
        
        pwTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.height.equalTo(30)
        }
        
        resultLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(40)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(stackView.snp.bottom)
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
