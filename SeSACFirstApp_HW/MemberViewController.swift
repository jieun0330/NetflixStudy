//
//  MemberViewController.swift
//  SeSACFirstApp_HW
//
//  Created by 박지은 on 12/27/23.
//

import UIKit

class MemberViewController: UIViewController {
    
    @IBOutlet var logo: UIImageView!
    @IBOutlet var emailOrNumber: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var nickname: UITextField!
    @IBOutlet var location: UITextField!
    @IBOutlet var code: UITextField!
    @IBOutlet var joinMember: UIButton!
    @IBOutlet var conditionOfMember: UILabel!
    @IBOutlet var addInfo: UILabel!
    @IBOutlet var toggleButton: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logo.image = .wordmark
        setTextfield(emailOrNumber, placeholder: "이메일 주소 또는 전화번호")
        emailOrNumber.keyboardType = .emailAddress
        setTextfield(password, placeholder: "비밀번호")
        password.keyboardType = .numberPad
        password.isSecureTextEntry = true
        setTextfield(nickname, placeholder: "닉네임")
        setTextfield(location, placeholder: "위치")
        setTextfield(code, placeholder: "추천 코드 입력")
        code.keyboardType = .numberPad
        designButton(joinMember)
        conditionOfMember.text = ""
        addInfo.text = "추가 정보 입력"
        toggleButton.onTintColor = .red
    }
    
    @IBAction func joinMemeberClicked(_ sender: UIButton) {
        if emailOrNumber.text?.isEmpty == true {
            checkMember(state: "이메일 주소 또는 전화번호를 입력해주세요")
        } else if password.text?.isEmpty == true {
            checkMember(state: "비밀번호를 입력해주세요")
        } else if password.text!.count < 6 {
            checkMember(state: "비밀번호는 최소 6자리 이상입니다")
        } else {
            checkMember(state: "회원가입 성공")
            conditionOfMember.textColor = .white
        }
        view.endEditing(true)
    }
    
    @IBAction func infoToggle(_ sender: UISwitch) {
        if sender.isOn {
            toggleButton.onTintColor = .red
            nickname.isHidden = false
            location.isHidden = false
            code.isHidden = false
        } else {
            toggleButton.onTintColor = .gray
            nickname.isHidden = true
            location.isHidden = true
            code.isHidden = true
        }
    }
    
    // 텍스트필드 글자 흰색으로 바꾸고싶은데 -> attribute 어쩌구 쓰면 됨
    func setTextfield(_ join: UITextField, placeholder ph: String) {
        join.placeholder = ph
        join.backgroundColor = .gray
        join.keyboardType = .default
        join.textAlignment = .center
        join.layer.cornerRadius = 3
    }
    
    func designButton(_ button: UIButton) {
        button.setTitle("회원가입", for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 3
        button.setTitleColor(.black, for: .normal)
    }
    
    func checkMember(state: String) {
        conditionOfMember.text = state
        conditionOfMember.font = .systemFont(ofSize: 13)
        conditionOfMember.textColor = .red
    }
}
