//
//  TabBarViewController.swift
//  SeSACFirstApp_HW
//
//  Created by 박지은 on 1/28/24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabbarItem()
        tabBar.tintColor = .white
        tabBar.barTintColor = .black
    }
    
    func setupTabbarItem() {
        let firstView = FirstViewController()
        firstView.tabBarItem = UITabBarItem(title: "홈",
                                            image: UIImage(systemName: "house"),
                                            selectedImage: UIImage(systemName: "house.fill"))
        
        let secondView = SecondViewController()
        secondView.tabBarItem = UITabBarItem(title: "NEW & HOT",
                                             image: UIImage(systemName: "play.rectangle.on.rectangle"),
                                             selectedImage: UIImage(systemName: "play.rectangle.on.rectangle.fill"))
        
        let thirdView = ThirdViewController()
        thirdView.tabBarItem = UITabBarItem(title: "저장한 콘텐츠 목록",
                                            image: UIImage(systemName: "arrowshape.down.circle"),
                                            selectedImage: UIImage(systemName: "arrowshape.down.circle.fill"))
        
        viewControllers = [firstView, secondView, thirdView]
    }
}
