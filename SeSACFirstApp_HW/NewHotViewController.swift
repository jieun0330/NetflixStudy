//
//  newHotViewController.swift
//  SeSACFirstApp_HW
//
//  Created by 박지은 on 12/27/23.
//

import UIKit

class NewHotViewController: UIViewController {
    
    // 서치바
    @IBOutlet var searchBar: UISearchBar!
    // 버튼
    @IBOutlet var comingSoon: UIButton!
    @IBOutlet var hotContents: UIButton!
    @IBOutlet var topTen: UIButton!
    
    @IBOutlet var firstText: UILabel!
    @IBOutlet var secText: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button(comingSoon, title: "공개 예정", active: true)
        button(hotContents, title: "모두의 인기 콘텐츠", active: false)
        button(topTen, title: "TOP 10 시리즈", active: false)
    }
    
    @IBAction func comingSoonClicked(_ sender: UIButton) {
        
        // 이것도 하드 코딩인것 같은데,,
        button(comingSoon, title: "공개 예정", active: true)
        button(hotContents, title: "모두의 인기 콘텐츠", active: false)
        button(topTen, title: "TOP 10 시리즈", active: false)
        
        designText(firstText, body: "이런! 찾으시는 작품이 없습니다")
        designText(secText, body: "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해보세요.")
    }
    
    @IBAction func hotContentsClicked(_ sender: Any) {
        
        // 이것도 하드 코딩인것 같은데,,22
        button(comingSoon, title: "공개 예정", active: false)
        button(hotContents, title: "모두의 인기 콘텐츠", active: true)
        button(topTen, title: "TOP 10 시리즈", active: false)
        
        designText(firstText, body: "Netflix 인기 콘텐츠입니다")
        designText(secText, body: "헬's 키친 보실래요?")
    }
    
    @IBAction func topTenClicked(_ sender: UIButton) {
        
        // 이것도 하드 코딩인것 같은데,,333
        button(comingSoon, title: "공개 예정", active: false)
        button(hotContents, title: "모두의 인기 콘텐츠", active: false)
        button(topTen, title: "TOP 10 시리즈", active: true)
        
        designText(firstText, body: "한국의 TOP 10 콘텐츠입니다")
        designText(secText, body: "빈센조 보실래요?")
    }
    
    // 버튼 디자인
    // 버튼 폰트 크기 어떻게 설정하누,,
    func button(_ button: UIButton, title: String, active: Bool) {
        
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = 15
        
        if active == true {
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .white
        } else {
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .black
        }
    }
    
    // 아래 내용 디자인
    func designText(_ content: UILabel, body: String) {
        content.textAlignment = .center
        content.text = body
    }
}
