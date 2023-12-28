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
        
        firstText.textAlignment = .center
        secText.textAlignment = .center
    }
    
    @IBAction func comingSoonClicked(_ sender: UIButton) {
        firstText.text = "이런! 찾으시는 작품이 없습니다"
        secText.text = "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해보세요."
    }
    
    @IBAction func hotContentsClicked(_ sender: Any) {
        firstText.text = "Netflix 인기 콘텐츠입니다"
        secText.text = "헬's 키친 보실래요?"
    }
    
    @IBAction func topTenClicked(_ sender: UIButton) {
        firstText.text = "한국의 TOP 10 콘텐츠입니다"
        secText.text = "빈센조 보실래요?"
    }
}
