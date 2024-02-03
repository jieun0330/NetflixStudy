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
        buttonType(comingSoon, title: "공개 예정")
        buttonType(hotContents, title: "모두의 인기 콘텐츠")
        buttonType(topTen, title: "TOP 10 시리즈")    
        
        comingSoonClicked(comingSoon)
    }
    
    @IBAction func comingSoonClicked(_ sender: UIButton) {
        // 순서가 중요한거였구나
        // 클릭함과 동시에 -> 다른 버튼이 다 꺼지고 -> 얘 하나만 선택이 되어야 하는거니까
        buttonClicked()
        buttonOn(sender)
        
        designText(firstText, body: "이런! 찾으시는 작품이 없습니다")
        designText(secText, body: "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해보세요.")
    }
    
    @IBAction func hotContentsClicked(_ sender: UIButton) {
        buttonClicked()
        buttonOn(sender)
        
        designText(firstText, body: "Netflix 인기 콘텐츠입니다")
        designText(secText, body: "헬's 키친 보실래요?")
    }
    
    @IBAction func topTenClicked(_ sender: UIButton) {
        buttonClicked()
        buttonOn(sender)
        
        designText(firstText, body: "한국의 TOP 10 콘텐츠입니다")
        designText(secText, body: "빈센조 보실래요?")
    }

    // active 대신 sender 이용해서 해보기
    func buttonType(_ button: UIButton, title: String) {
        
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = 15
    }
    
    func buttonOn(_ sender: UIButton) {
        sender.setTitleColor(.black, for: .normal)
        sender.backgroundColor = .white
    }
    
    func buttonOff(_ sender: UIButton) {
        sender.setTitleColor(.white, for: .normal)
        sender.backgroundColor = .black
    }
    
    // 어느 버튼을 눌렀을 때 나머지가 다 꺼지게끔
    func buttonClicked() {
        buttonOff(comingSoon)
        buttonOff(hotContents)
        buttonOff(topTen)
    }
    
    
    func designText(_ content: UILabel, body: String) {
        content.textAlignment = .center
        content.text = body
    }
}
