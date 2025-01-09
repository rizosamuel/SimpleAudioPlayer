//
//  TabBarController.swift
//  AudioTestApp
//
//  Created by Rijo Samuel on 27/10/24.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstVC = AudioViewController()
        let secondVC = VideoViewController()
        
        firstVC.tabBarItem = UITabBarItem(title: "Audio", image: UIImage(systemName: "play"), tag: 0)
        secondVC.tabBarItem = UITabBarItem(title: "Video", image: UIImage(systemName: "video"), tag: 1)
        
        viewControllers = [firstVC, secondVC]
    }
}
