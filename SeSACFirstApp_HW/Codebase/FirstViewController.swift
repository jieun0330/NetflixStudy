//
//  FirstViewController.swift
//  SeSACFirstApp_HW
//
//  Created by 박지은 on 1/26/24.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController {
    
    let mainImg = UIImageView()
    let playButton = UIButton()
    let likeListButton = UIButton()
    
    let contentsLabel = UILabel()
    let firstSubImg = UIImageView()
    let secondSubImg = UIImageView()
    let thirdSubImg = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        navigationItem.title = "고래밥님"
        
        configureHierachy()
        configureView()
        setupConstraints()
        
    }
    
    func configureHierachy() {
        view.addSubview(mainImg)
        
        mainImg.addSubview(playButton)
        mainImg.addSubview(likeListButton)
        
        view.addSubview(contentsLabel)
        view.addSubview(firstSubImg)
        view.addSubview(secondSubImg)
        view.addSubview(thirdSubImg)
    }
    
    func configureView() {
        mainImg.image = .노량
        //scaleAspectFit: 위아래 남음
        //scaleToFill: 이상하게 위아래로 주욱 늘어남
        //scaleAspectFill: 여백 무시해버리고 지맘대로 자리 차지함 ✅
        mainImg.contentMode = .scaleAspectFill
        mainImg.layer.cornerRadius = 10
        // 이미지를 둥그렇게 잘라주려면 이걸 해야 함
        mainImg.clipsToBounds = true
        
        buttonType(playButton, imageName: "play.fill", tintColor: .black, title: "  재생", titleColor: .black, backColor: .white)
        buttonType(likeListButton, imageName: "plus", tintColor: .white, title: "  내가 찜한 리스트", titleColor: .white, backColor: .gray)
        
        contentsLabel.text = "지금 뜨는 콘텐츠"
        
        firstSubImg.contentMode = .scaleAspectFill
        firstSubImg.image = .더퍼스트슬램덩크
        
        // 두번째 이미지만 추가하면 세개의 위치가 잘 안맞는다 🚨🚨🚨🚨🚨
        //        secondSubImg.contentMode = .scaleAspectFill
        //        secondSubImg.image = .밀수
        //
        thirdSubImg.contentMode = .scaleAspectFill
        thirdSubImg.image = .범죄도시3
    }
    
    func setupConstraints() {
        mainImg.snp.makeConstraints { make in
            // leading + trailing = horizontalEdges
            // safearea는 기본적으로 위 아래만이여서, 좌우 여백을 주려면 inset이 필요하다
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide)
            // 이미지 비율로 주고 싶을 때: multipliedBy
            make.height.equalToSuperview().multipliedBy(0.6)
        }
        
        playButton.snp.makeConstraints { make in
            // 재생버튼의 엄빠는 메인이미지니까~
            make.leading.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(20)
            make.width.equalTo(140)
            make.height.equalTo(40)
        }
        
        likeListButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(20)
            make.width.equalTo(140)
            make.height.equalTo(40)
        }
        
        contentsLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImg.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            
        }
        
        firstSubImg.snp.makeConstraints { make in
            make.leading.equalTo(mainImg)
            make.top.equalTo(contentsLabel.snp.bottom).offset(20)
            // 비율로 주고싶은데 잘 안된다 🚨🚨🚨🚨🚨
            make.width.equalTo(100)
            make.height.equalTo(150)
        }
        
        secondSubImg.snp.makeConstraints { make in
            //            make.leading.equalTo(firstSubImg.snp.trailing).offset(20)
            //            make.top.equalTo(firstSubImg)
            //            make.trailing.equalTo(thirdSubImg.snp.leading).offset(10)
            //            make.width.equalTo(100)
            //            make.height.equalTo(150)
        }
        
        thirdSubImg.snp.makeConstraints { make in
            make.leading.equalTo(secondSubImg.snp.trailing).offset(10)
            make.top.equalTo(firstSubImg)
            make.trailing.equalTo(mainImg)
            make.width.equalTo(firstSubImg)
            make.width.equalTo(100)
            make.height.equalTo(150)
        }
    }
    
    // 호에에엥 이렇게 길어도 되는거야? 🚨🚨🚨🚨🚨
    func buttonType(_ sender: UIButton, imageName: String, tintColor: UIColor, title: String, titleColor: UIColor, backColor: UIColor) {
        sender.setImage(UIImage(systemName: imageName), for: .normal)
        sender.tintColor = tintColor
        sender.setTitle(title, for: .normal)
        sender.setTitleColor(titleColor, for: .normal)
        sender.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        sender.backgroundColor = backColor
        sender.layer.cornerRadius = 10
    }
}

#Preview {
    FirstViewController()
}
