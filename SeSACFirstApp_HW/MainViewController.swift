//
//  MainViewController.swift
//  SeSACFirstApp_HW
//
//  Created by 박지은 on 12/27/23.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var likeListButton: UIButton!
    @IBOutlet var subFirstImage: UIImageView!
    @IBOutlet var subSecImage: UIImageView!
    @IBOutlet var subThirdImage: UIImageView!
    
    let images = ["노량","더퍼스트슬램덩크","밀수","범죄도시3","서울의봄","스즈메의문단속","아바타물의길","오펜하이머","육사오","콘크리트유토피아"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        poster(mainImage, borderColor: .red)
        mainImage.layer.cornerRadius = 15
        mainImage.layer.borderWidth = 2
        button(playButton, backgroundColor: .white, setTitle: "재생", tintColor: .black, imageName: "play.fill")
        button(likeListButton, backgroundColor: .black, setTitle: "내가 찜한 리스트", tintColor: .white, imageName: "plus")
        poster(subFirstImage, borderColor: .orange)
        poster(subSecImage, borderColor: .yellow)
        poster(subThirdImage, borderColor: .green)
    }
    
    // sender의 의미를 더 공부해야할듯
    // 랜덤 이미지가 겹치게 하지 않으려면 어떻게 해야되지?
    // 이것도 image끼리 파라미터로(?) 묶을 수 있을거같은데 -> 배열에 넣고 for문 돌리면 됨
    @IBAction func playButtonClicked(sender: UIButton) {
        mainImage.image = UIImage(named: images.randomElement()!)
        subFirstImage.image = UIImage(named: images.randomElement()!)
        subSecImage.image = UIImage(named: images.randomElement()!)
        subThirdImage.image = UIImage(named: images.randomElement()!)
    }
    
    func poster(_ img: UIImageView, borderColor bc: UIColor) {
        img.layer.cornerRadius = 10
        img.layer.borderColor = bc.cgColor
        img.layer.borderWidth = 1
        img.contentMode = .scaleAspectFill
    }
    
    // sf symbol이랑 text 간격 어떻게 벌어지게 해
    func button(_ button: UIButton, backgroundColor bc: UIColor, setTitle: String, tintColor tc: UIColor, imageName: String) {
        button.backgroundColor = bc
        button.setImage(UIImage(systemName: imageName), for: .normal)
        button.setTitle(setTitle, for: .normal)
        button.tintColor = tc
        button.layer.cornerRadius = 10
    }
}
