//
//  TabBarController.swift
//  ar_app
//
//  Created by 岸本蓮 on 2020/11/20.
//

import UIKit
import FloatingPanel

class TabBarController: UITabBarController, UITabBarControllerDelegate, FloatingPanelControllerDelegate {
    
    var con1 = TopViewController()
    var con2 = MusicViewController()
    var con1Cnt : Int = 0
    var con2Cnt : Int = 0
    var fpc = FloatingPanelController()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        fpc.delegate = self
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
//            let contentVC = MusicViewController()
//            fpc.set(contentViewController: contentVC)
//            fpc.addPanel(toParent: self)
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

        switch item.tag{
        case 0:break
        case 1:
//            let contentVC = MusicViewController()
//            fpc.set(contentViewController: contentVC)
//            fpc.addPanel(toParent: self)
            tabBarController?.present(con2, animated: true, completion: nil)
        default:break
        }
     }

    //tabbarボタン押下時の処理メソッド
    func didTapButton(_ button: UIButton) {
        present(con2, animated: true, completion: nil)
    }
}
