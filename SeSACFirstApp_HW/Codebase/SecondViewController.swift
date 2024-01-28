//
//  SecondViewController.swift
//  SeSACFirstApp_HW
//
//  Created by 박지은 on 1/26/24.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    
    let searchBar = UISearchBar()
    let firstButton = UIButton()
    let secondButton = UIButton()
    let thirdButton = UIButton()
    let firstText = UILabel()
    let secondText = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "NEW & HOT 검색"
        
        configureHierachy()
        configureView()
        configureConstraints()
    }
    
    func configureHierachy() {
        
        [searchBar, firstButton, secondButton, thirdButton, firstText, secondText].map {
            view.addSubview($0)
        }
    }
    
    func configureView() {
        searchBar.placeholder = "게임, 시리즈, 영화를 검색하세요..."
        
        buttonType(firstButton, iconImg: "blue", title: "공개 예정", titleColor: .black)
        firstButton.backgroundColor = .white
        firstButton.layer.cornerRadius = 15
        firstText.clipsToBounds = true
        
        buttonType(secondButton, iconImg: "turquoise", title: "모두의 인기 콘텐츠", titleColor: .white)
        buttonType(thirdButton, iconImg: "pink", title: "TOP 10 시리즈", titleColor: .white)
        
        firstText.text = "이런! 찾으시는 작품이 없습니다."
        firstText.font = UIFont.boldSystemFont(ofSize: 23)
        
        secondText.text = "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요."
        secondText.font = UIFont.systemFont(ofSize: 15)
        secondText.textColor = .gray
        
    }
    
    func configureConstraints() {
        searchBar.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        firstButton.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(35)
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        secondButton.snp.makeConstraints { make in
            make.width.equalTo(155)
            make.height.equalTo(35)
            make.top.equalTo(firstButton)
            make.leading.equalTo(firstButton.snp.trailing)
        }
        
        thirdButton.snp.makeConstraints { make in
            make.width.equalTo(115)
            make.height.equalTo(35)
            make.top.equalTo(firstButton)
            make.leading.equalTo(secondButton.snp.trailing)
        }
        
        firstText.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
        }
        
        secondText.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(firstText.snp.bottom)
        }
        
    }
    
    func buttonType(_ sender: UIButton, iconImg: String, title: String, titleColor: UIColor) {
        sender.setImage(UIImage(named: iconImg), for: .normal)
        sender.setTitle(title, for: .normal)
        sender.setTitleColor(titleColor, for: .normal)
        sender.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    }
}
//
//#Preview {
//    SecondViewController()
//}
