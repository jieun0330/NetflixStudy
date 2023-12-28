//
//  MainViewController.swift
//  SeSACFirstApp_HW
//
//  Created by 박지은 on 12/27/23.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var subFirstImage: UIImageView!
    @IBOutlet var subSecImage: UIImageView!
    @IBOutlet var subThirdImage: UIImageView!
    
    @IBOutlet var playButton: UIButton!
    @IBOutlet var likeListButton: UIButton!
    
    let images = ["노량","더퍼스트슬램덩크","밀수","범죄도시3","서울의봄","스즈메의문단속","아바타물의길","오펜하이머","육사오","콘크리트유토피아"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainImage.layer.cornerRadius = 30
        mainImage.layer.borderColor = UIColor.red.cgColor
        mainImage.layer.borderWidth = 2
        mainImage.contentMode = .scaleAspectFill
        
        subFirstImage.layer.cornerRadius = 10
        subFirstImage.layer.borderColor = UIColor.orange.cgColor
        subFirstImage.layer.borderWidth = 1
        subFirstImage.contentMode = .scaleAspectFill
        
        subSecImage.layer.cornerRadius = 10
        subSecImage.layer.borderColor = UIColor.yellow.cgColor
        subSecImage.layer.borderWidth = 1
        subSecImage.contentMode = .scaleAspectFill
        
        subThirdImage.layer.cornerRadius = 10
        subThirdImage.layer.borderColor = UIColor.green.cgColor
        subThirdImage.layer.borderWidth = 1
        subThirdImage.contentMode = .scaleAspectFill
        
        playButton.backgroundColor = .white
        playButton.tintColor = .black
        playButton.layer.cornerRadius = 10
        
        likeListButton.tintColor = .white
        likeListButton.layer.cornerRadius = 10
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        // 랜덤 이미지가 겹치게 하지 않으려면 어떻게 해야되지?
        mainImage.image = UIImage(named: images.randomElement()!)
        subFirstImage.image = UIImage(named: images.randomElement()!)
        subSecImage.image = UIImage(named: images.randomElement()!)
        subThirdImage.image = UIImage(named: images.randomElement()!)
    }
}
