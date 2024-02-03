//
//  JoinMemberViewController.swift
//  SeSACFirstApp_HW
//
//  Created by 박지은 on 1/29/24.
//

import UIKit
import SnapKit

// class
// uikit은 class, swiftui는 struct?
// uikit에서의 모든 뷰는 uiview라는 클래스를 상속받고 있다

// UIViewController: 부모 클래스
// JoinMemberViewController: 자식 클래스
// UIViewController의 모든 기능을 물려받기 위해 작성한다
// 부모 클래스를 상속하지 않으면? -> 물려받지 못하겠지?
// 채택과 상속은 다르다
// 채택은 여러 개 가능하지만, 상속은 하나만 가능하다.
// UIViewController는 상속이고 뒤에 , Delegate, Datasource 같이 추가로 붙였던 것들이 채택이다
class JoinMemberViewController: UIViewController {
    
    let email = UITextField()
    let password = UITextField()
    let nickname = UITextField()
    let location = UITextField()
    let code = UITextField()
    let join = UIButton()
    let addLabel = UILabel()
    let addSwitch = UISwitch()
    
    // viewDidLoad -> 앱이 실행되면 처음 보여지는 화면
    // 처음에 한번만 호출된다
    // override -> 재정의 -> 뭘 재정의 하는데? -> 부모클래스로부터 상속받은 기능을 재정의한다
    override func viewDidLoad() {
        // super는 부모 클래스
        // 부모의 작업을 받아서 실행한다
        // 슈퍼클래스에 접근을 가능하게 해준다
        // 부모의 작업을 실행해줄지 말지
        // super를 써주지 않으면? -> 에러는 안나네?
        // 그래도 애초에 UIViewController 부모클래스를 상속받아서 쓰고있으니까 써주는게 맞다고 생각하면 되려나
        // -> 규칙이 있다기보다는 부모클래스가 가진 viewDidLoad 기능에 접근 가능하게끔 써주는거라고 생각하면 된다
        
        // 슈퍼클래스가 해야할 설정을 완료한 후 하위 클래스 설정을 수행하는 것이 일반적이다
        
        
        // 인스턴스 프로퍼티, 타입 프로퍼티 🚨
        // 인스턴스 메서드, 타입 메서드 🚨
        
        
        super.viewDidLoad()
        
        
        configureHierachy()
        configureView()
        configureConstraints()

    }
    
    func configureHierachy() {
        // 누가 맨 위에 있는지 생각해라
        [email, password, nickname, location, code, join, addLabel, addSwitch].forEach {
            view.addSubview($0)
        }
        
    }
    
    func configureView() {
        email.placeholder = "이메일 주소 또는 전화번호"
        email.backgroundColor = .gray
        email.textAlignment = .center
        email.layer.cornerRadius = 5
        password.placeholder = "비밀번호"
        password.backgroundColor = .gray
        password.textAlignment = .center
        password.layer.cornerRadius = 5
        nickname.placeholder = "닉네임"
        nickname.backgroundColor = .gray
        nickname.textAlignment = .center
        nickname.layer.cornerRadius = 5
        location.placeholder = "위치"
        location.backgroundColor = .gray
        location.textAlignment = .center
        location.layer.cornerRadius = 5
        code.placeholder = "추천 코드 입력"
        code.backgroundColor = .gray
        code.textAlignment = .center
        code.layer.cornerRadius = 5
        join.setTitle("회원가입", for: .normal)
        join.backgroundColor = .white
        join.setTitleColor(.black, for: .normal)
        join.layer.cornerRadius = 5
        addLabel.text = "추가 정보 입력"
    }
    
    func configureConstraints() {
        
        email.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.bottom.equalTo(password.snp.top).offset(-20)
            $0.height.equalTo(35)
        }
        
        password.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.bottom.equalTo(nickname.snp.top).offset(-20)
            $0.height.equalTo(35)
        }
        
        nickname.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(35)
        }
        
        location.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.top.equalTo(nickname.snp.bottom).offset(20)
            $0.height.equalTo(35)
        }
        
        code.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.top.equalTo(location.snp.bottom).offset(20)
            $0.height.equalTo(35)
        }
        
        join.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.top.equalTo(code.snp.bottom).offset(20)
            $0.height.equalTo(35)
        }
        
        addLabel.snp.makeConstraints {
            $0.leading.equalTo(join)
            $0.top.equalTo(join.snp.bottom).offset(20)
            $0.height.equalTo(42)
        }
        
        addSwitch.snp.makeConstraints {
            $0.trailing.equalTo(join)
            $0.top.equalTo(addLabel)
        }
        
    }


}
