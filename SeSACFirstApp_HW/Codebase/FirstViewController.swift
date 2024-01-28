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
    let stvCell = UIStackView()
    let firstSubImg = UIImageView()
    let secondSubImg = UIImageView()
    let thirdSubImg = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        navigationItem.title = "고래밥"
        
        configureHierachy()
        configureView()
        setupConstraints()
    }
    
    func configureHierachy() {
        
        // 써먹기~3
        // 근데 이게 순서대로 들어가는건가
        // 중간에 뭐 추가되면 중간에 낑겨 넣어줘야되는건가
        // 그러겠지,,,,,,? 🚨
        [mainImg, contentsLabel, stvCell].forEach {
            view.addSubview($0)
        }
        
        // forEach와 map의 차이는 ?? ? ? ? ?
        // forEach는 리턴하는 값이 없고
        // map은 리턴하는 값이 있어서 연달아 다른 작업을 할 수 있다
        // 그러고보니 프로그래머스 풀 때 .map 뒤에 뭐 숫자*2 이런거 했던거같다
        // 그러면 세개의 이미지가 리턴해서 다른 작업할게 뭐가 있지
        // 이것도 foreach 써도 되는거 아닌가
        [firstSubImg, secondSubImg, thirdSubImg].forEach {
            stvCell.addArrangedSubview($0)
        }
        
        //        [firstSubImg, secondSubImg, thirdSubImg].map {
        //            stackView.addArrangedSubview($0)
        //        }
        
        [playButton, likeListButton].forEach {
            mainImg.addSubview($0)
        }
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
        
        // 스택뷰 방향
        stvCell.axis = .horizontal
        // subview들을 정렬하는 방법
        stvCell.alignment = .center
        // subview들의 크기를 어떻게 분배할지
        stvCell.distribution = .equalSpacing
        //         subview들 간의 간격
        // 이걸 내가 못써먹고있는거같은데
        stvCell.spacing = 10
        stvCell.layer.borderColor = UIColor.red.cgColor
        stvCell.layer.borderWidth = 3
        
        firstSubImg.image = .더퍼스트슬램덩크
        secondSubImg.image = .밀수
        thirdSubImg.image = .범죄도시3
        
        firstSubImg.contentMode = .scaleAspectFit
        firstSubImg.clipsToBounds = true
        
        // 두번째 이미지만 추가하면 세개의 위치가 잘 안맞는다 🚨🚨🚨🚨🚨
        // 오케이 스택뷰 도전
        secondSubImg.contentMode = .scaleAspectFit
        secondSubImg.clipsToBounds = true
        
        thirdSubImg.contentMode = .scaleAspectFit
        thirdSubImg.clipsToBounds = true
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
        
        stvCell.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.top.equalTo(contentsLabel.snp.bottom).offset(20)
        }
        
        firstSubImg.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(150)
        }
        
        secondSubImg.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(150)
            make.centerX.equalToSuperview()
            make.leading.equalTo(firstSubImg.snp.trailing).offset(stvCell.spacing)
        }
        
        thirdSubImg.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(150)
            make.trailing.equalToSuperview()
            make.leading.equalTo(secondSubImg.snp.trailing).offset(stvCell.spacing)
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

//#Preview {
//    FirstViewController()
//}
