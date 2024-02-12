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
    let movieInfoLabel = UILabel()
    let playButton = UIButton()
    let likeListButton = UIButton()
    let contentsLabel = UILabel()
    let stackView = UIStackView()
    let firstSubImg = UIImageView()
    let secondSubImg = UIImageView()
    let thirdSubImg = UIImageView()
    let images = ["노량","더퍼스트슬램덩크","밀수","범죄도시3","서울의봄","스즈메의문단속","아바타물의길","오펜하이머","육사오","콘크리트유토피아"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        navigationItem.title = "고래밥"
        
        configureHierachy()
        configureView()
        setupConstraints()
        
        // 똑같이 했는데 왜 안될까 왜 왜왜왜왜오애왜왜 🚨🚨🚨🚨🚨
//        playButton.addTarget(self, action: #selector(playButtonClicked), for: .touchUpInside)
    }
    
//    @objc func playButtonClicked() {
//        print("버튼 눌렸")
//        mainImg.image = UIImage(named: images.randomElement()!)
//        firstSubImg.image = UIImage(named: images.randomElement()!)
//        secondSubImg.image = UIImage(named: images.randomElement()!)
//        thirdSubImg.image = UIImage(named: images.randomElement()!)
//    }
    
    func configureHierachy() {
        
        [mainImg, contentsLabel, stackView].forEach {
            view.addSubview($0)
        }
        
        // forEach와 map의 차이는 ?? ? ? ? ?
        // forEach는 리턴하는 값이 없고
        // map은 리턴하는 값이 있어서 연달아 다른 작업을 할 수 있다
        // 그러고보니 프로그래머스 풀 때 .map 뒤에 뭐 숫자*2 이런거 했던거같다
        // 그러면 세개의 이미지가 리턴해서 다른 작업할게 뭐가 있지
        // 이것도 foreach 써도 되는거 아닌가
        [firstSubImg, secondSubImg, thirdSubImg].forEach {
            stackView.addArrangedSubview($0)
        }
        
        //        [firstSubImg, secondSubImg, thirdSubImg].map {
        //            stackView.addArrangedSubview($0)
        //        }
        
        [movieInfoLabel, playButton, likeListButton].forEach {
            mainImg.addSubview($0)
        }
    }
    
    func configureView() {
        mainImg.image = UIImage(named: images.randomElement()!)
        //scaleAspectFit: 위아래 남음
        //scaleToFill: 이상하게 위아래로 주욱 늘어남
        //scaleAspectFill: 여백 무시해버리고 지맘대로 자리 차지함 ✅
        mainImg.contentMode = .scaleAspectFill
        mainImg.layer.cornerRadius = 10
        mainImg.clipsToBounds = true
        
        movieInfoLabel.text = "응원하고픈 · 흥미진진 · 사극 · 전투 · 한극 작품"
        movieInfoLabel.font = UIFont.boldSystemFont(ofSize: 13)
        movieInfoLabel.textColor = .white
        movieInfoLabel.textAlignment = .center
                
        buttonType(playButton, imageName: "play.fill", tintColor: .black, title: "  재생", titleColor: .black, backColor: .white)
        buttonType(likeListButton, imageName: "plus", tintColor: .white, title: "  내가 찜한 리스트", titleColor: .white, backColor: .gray)
        
        contentsLabel.text = "지금 뜨는 콘텐츠"
        
        // 스택뷰 방향
        stackView.axis = .horizontal
        // subview들을 정렬하는 방법
        stackView.alignment = .center
        // subview들의 크기를 어떻게 분배할지
        stackView.distribution = .equalSpacing
        //         subview들 간의 간격
        // 이걸 내가 못써먹고있는거같은데
        stackView.spacing = 10
        
        firstSubImg.image = UIImage(named: images.randomElement()!)
        secondSubImg.image = UIImage(named: images.randomElement()!)
        thirdSubImg.image = UIImage(named: images.randomElement()!)
        
        firstSubImg.contentMode = .scaleAspectFit
        firstSubImg.clipsToBounds = true
        
        // 두번째 이미지만 추가하면 세개의 위치가 잘 안맞는다 🚨
        // 오케이 스택뷰 도전
        secondSubImg.contentMode = .scaleAspectFit
        secondSubImg.clipsToBounds = true
        
        thirdSubImg.contentMode = .scaleAspectFit
        thirdSubImg.clipsToBounds = true
    }
    
    func setupConstraints() {
        mainImg.snp.makeConstraints {
            // safearea는 기본적으로 위 아래만이여서, 좌우 여백을 주려면 inset이 필요하다
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.top.equalTo(view.safeAreaLayoutGuide)
            // 이미지 비율로 주고 싶을 때: multipliedBy
            $0.height.equalToSuperview().multipliedBy(0.6)
        }
        
        movieInfoLabel.snp.makeConstraints {
            $0.bottom.equalTo(playButton.snp.top).offset(-20)
            $0.horizontalEdges.equalToSuperview().inset(40)
        }
        
        playButton.snp.makeConstraints {
            // 재생버튼의 엄빠는 메인이미지니까~
            $0.leading.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(20)
            $0.width.equalTo(140)
            $0.height.equalTo(40)
        }
        
        likeListButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(20)
            $0.width.equalTo(140)
            $0.height.equalTo(40)
        }
        
        contentsLabel.snp.makeConstraints {
            $0.top.equalTo(mainImg.snp.bottom).offset(10)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        stackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(contentsLabel.snp.bottom).offset(10)
        }
        
        firstSubImg.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(150)
        }
        
        secondSubImg.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(150)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(firstSubImg.snp.trailing).offset(stackView.spacing)
        }
        
        thirdSubImg.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(150)
            $0.trailing.equalToSuperview()
            $0.leading.equalTo(secondSubImg.snp.trailing).offset(stackView.spacing)
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
