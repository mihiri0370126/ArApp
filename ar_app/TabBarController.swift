//
//  TabBarController.swift
//  ar_app
//
//  Created by 岸本蓮 on 2020/11/20.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    var con1 = TopViewController()
    var con2 = MusicViewController()
    var con1Cnt : Int = 0
    var con2Cnt : Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        // タブのタイトルとタグを設定
       con1.tabBarItem.title = "AAAAA"
       con1.tabBarItem.tag = 1
       
       con2.tabBarItem.title = "BBBBB"
       con2.tabBarItem.tag = 2
    }
    

    //called whenever a tab button is tapped
     func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

      if let firstVC = viewController as? TopViewController {
       firstVC.doSomeAction()
      }
       else if let firstVC = viewController as? MusicViewController {
//        firstVC.pick(sender: firstVC.select)
        }

      if viewController is TopViewController {
       print("First tab")
//        con1.doSomeAction()
      } else if viewController is MusicViewController {
       print("Second tab")
      }
     }

     //alternate method if you need the tab bar item
     override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
      //...
     }

}
