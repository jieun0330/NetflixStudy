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
    
    @IBOutlet var addInfo: UILabel!
    @IBOutlet var toggleButton: UISwitch!
    
    @IBOutlet var conditionOfMember: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logo.image = .wordmark
        
        emailOrNumber.placeholder = "이메일 주소 또는 전화번호"
        emailOrNumber.backgroundColor = .gray
        emailOrNumber.keyboardType = .emailAddress
        emailOrNumber.textAlignment = .center
        emailOrNumber.layer.cornerRadius = 3
        
        password.placeholder = "비밀번호"
        password.backgroundColor = .gray
        password.isSecureTextEntry = true
        password.textAlignment = .center
        password.layer.cornerRadius = 3
        password.keyboardType = .numberPad
        password.textColor = .white
        
        nickname.placeholder = "닉네임"
        nickname.backgroundColor = .gray
        nickname.textAlignment = .center
        nickname.layer.cornerRadius = 3
        nickname.textColor = .white
        
        location.placeholder = "위치"
        location.backgroundColor = .gray
        location.textAlignment = .center
        location.layer.cornerRadius = 3
        location.textColor = .white
        
        code.placeholder = "추천 코드 입력"
        code.backgroundColor = .gray
        code.textAlignment = .center
        code.layer.cornerRadius = 3
        code.textColor = .white
        code.keyboardType = .numberPad
        
        joinMember.setTitle("회원가입", for: .normal)
        joinMember.backgroundColor = .white
        joinMember.titleLabel?.textAlignment = .center
        joinMember.layer.cornerRadius = 3
        joinMember.setTitleColor(.black, for: .normal)
        
        conditionOfMember.text = ""
        conditionOfMember.font = .systemFont(ofSize: 13)
        conditionOfMember.textColor = .red
        
        addInfo.text = "추가 정보 입력"
        
        toggleButton.setOn(false, animated: true)
        toggleButton.onTintColor = .red
        toggleButton.thumbTintColor = .blue
    }
    
    @IBAction func joinMemeberClicked(_ sender: UIButton) {
        
        if emailOrNumber.text!.count == 0 {
            conditionOfMember.text = "이메일 주소 또는 전화번호를 입력해주세요"
        } else if password.text!.count == 0 {
            conditionOfMember.text = "비밀번호를 입력해주세요"
        } else if password.text!.count < 6 {
            conditionOfMember.text = "비밀번호는 최소 6자리 이상입니다"
        } else {
            conditionOfMember.text = "회원가입 성공"
            conditionOfMember.textColor = .white
        }
        view.endEditing(true)
    }
}
