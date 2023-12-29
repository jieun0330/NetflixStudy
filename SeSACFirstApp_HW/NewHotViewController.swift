//
//  newHotViewController.swift
//  SeSACFirstApp_HW
//
//  Created by 박지은 on 12/27/23.
//

import UIKit

class NewHotViewController: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var comingSoon: UIButton!
    @IBOutlet var hotContents: UIButton!
    @IBOutlet var topTen: UIButton!
    @IBOutlet var firstText: UILabel!
    @IBOutlet var secText: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 버튼 텍스트 크기 달라지는거 확인해야함
        button(comingSoon, title: "공개 예정", active: true)
        button(hotContents, title: "모두의 인기 콘텐츠", active: false)
        button(topTen, title: "TOP 10 시리즈", active: false)
    }
    
    @IBAction func comingSoonClicked(_ sender: UIButton) {
        button(comingSoon, title: "공개 예정", active: true)
        button(hotContents, title: "모두의 인기 콘텐츠", active: false)
        button(topTen, title: "TOP 10 시리즈", active: false)
        
        designText(firstText, body: "이런! 찾으시는 작품이 없습니다")
        designText(secText, body: "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해보세요.")
    }
    
    @IBAction func hotContentsClicked(_ sender: UIButton) {
        button(comingSoon, title: "공개 예정", active: false)
        button(hotContents, title: "모두의 인기 콘텐츠", active: true)
        button(topTen, title: "TOP 10 시리즈", active: false)
        
        designText(firstText, body: "Netflix 인기 콘텐츠입니다")
        designText(secText, body: "헬's 키친 보실래요?")
    }
    
    @IBAction func topTenClicked(_ sender: UIButton) {
        button(comingSoon, title: "공개 예정", active: false)
        button(hotContents, title: "모두의 인기 콘텐츠", active: false)
        button(topTen, title: "TOP 10 시리즈", active: true)
        
        designText(firstText, body: "한국의 TOP 10 콘텐츠입니다")
        designText(secText, body: "빈센조 보실래요?")
    }

    // active 대신 sender 이용해서 해보기
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
    
    func designText(_ content: UILabel, body: String) {
        content.textAlignment = .center
        content.text = body
    }
}
