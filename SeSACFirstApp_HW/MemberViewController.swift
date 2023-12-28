//
//  MemberViewController.swift
//  SeSACFirstApp_HW
//
//  Created by 박지은 on 12/27/23.
//

import UIKit

class MemberViewController: UIViewController {
    
    // 로고
    @IBOutlet var logo: UIImageView!
    // 텍스트필드
    @IBOutlet var emailOrNumber: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var nickname: UITextField!
    @IBOutlet var location: UITextField!
    @IBOutlet var code: UITextField!
    // 회원가입 버튼
    @IBOutlet var joinMember: UIButton!
    // 회원가입 가능 여부 멘트
    @IBOutlet var conditionOfMember: UILabel!
    // 추가 정보 입력 및 토글 버튼
    @IBOutlet var addInfo: UILabel!
    @IBOutlet var toggleButton: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 로고
        logo.image = .wordmark
        
        // 텍스트필드
        setTextfield(emailOrNumber, placeholder: "이메일 주소 또는 전화번호")
        emailOrNumber.keyboardType = .emailAddress
        setTextfield(password, placeholder: "비밀번호")
        password.keyboardType = .numberPad
        password.isSecureTextEntry = true
        setTextfield(nickname, placeholder: "닉네임")
        setTextfield(location, placeholder: "위치")
        setTextfield(code, placeholder: "추천 코드 입력")
        code.keyboardType = .numberPad
        
        // 회원가입 버튼
        designButton(joinMember)
        
        // 회원가입 가능 여부 멘트
        conditionOfMember.text = ""
        
        // 추가 정보 입력 및 토글 버튼
        addInfo.text = "추가 정보 입력"
        
//        toggleButton.isOn = true
        toggleButton.onTintColor = .red
    }
    
    // 회원가입 가능 여부 멘트
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
    
    // 추가 정보 입력 토글 선택 시
    @IBAction func infoToggle(_ sender: UISwitch) {
                        
        if sender.isOn {
            // 여기서 한번 더 써야 가능한건가? 위에 색상을 지정했는데 왜 풀리지?
            // 더 좋은 코드가 있을 것 같다
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
    
    // 텍스트필드 디자인
    // 텍스트필드 글자 흰색으로 바꾸고싶은데
    func setTextfield(_ join: UITextField, placeholder ph: String) {
        join.placeholder = ph
        join.backgroundColor = .gray
        join.keyboardType = .default
        join.textAlignment = .center
        join.layer.cornerRadius = 3
    }
    
    // 회원가입 버튼 디자인
    func designButton(_ button: UIButton) {
        button.setTitle("회원가입", for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 3
        button.setTitleColor(.black, for: .normal)
    }
    
    // 회원가입 가능 여부 디자인
    func checkMember(state: String) {
        conditionOfMember.text = state
        conditionOfMember.font = .systemFont(ofSize: 13)
        conditionOfMember.textColor = .red
    }
}
