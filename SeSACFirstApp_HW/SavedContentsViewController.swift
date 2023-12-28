//
//  SavedContentsViewController.swift
//  SeSACFirstApp_HW
//
//  Created by 박지은 on 12/27/23.
//

import UIKit

class SavedContentsViewController: UIViewController {
    
    @IBOutlet var savedTitle: UILabel!
    @IBOutlet var savedBody: UILabel!
    @IBOutlet var contentImg: UIImageView!
    @IBOutlet var settingButton: UIButton!
    @IBOutlet var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // savedTitle과 savedBody를 같이 묶어서 코드를 줄일 수가 있을까? 공통적인 요소들이 없는데?
        savedTitle.text = "'나만의 자동 저장' 기능"
        savedTitle.font = .boldSystemFont(ofSize: 20)
        savedTitle.textAlignment = .center
        
        savedBody.text = "취향에 맞는 영화와 시리즈를 자동으로 저장해 드립니다. 디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이 없어요."
        savedBody.font = .systemFont(ofSize: 12)
        savedBody.numberOfLines = 3
        savedBody.textAlignment = .center
        savedBody.textColor = .gray
        
        contentImg.image = .dummy
        
        setButton(button: settingButton, title: "설정하기", fontColor: .white, buttonColor: .blue)
        setButton(button: searchButton, title: "저장 가능한 콘텐츠 살펴보기", fontColor: .black, buttonColor: .white)
        
        func setButton(button: UIButton, title: String, fontColor: UIColor, buttonColor: UIColor) {
            button.setTitle(title, for: .normal)
            button.setTitleColor(fontColor, for: .normal)
            button.layer.cornerRadius = 5
            button.backgroundColor = buttonColor
        }
    }
}
