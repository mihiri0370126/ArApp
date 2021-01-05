//
//  MusicViewController.swift
//  ar_app
//
//  Created by 岸本蓮 on 2020/11/20.
//

import UIKit
import MediaPlayer
import FloatingPanel

class MusicViewController: UIViewController,MPMediaPickerControllerDelegate,FloatingPanelControllerDelegate {
    
    
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var select: UIButton!
    
    var fpc = FloatingPanelController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    //各ボタンのアクション
    @IBAction func pick(sender: AnyObject){
//        print("選曲ボタン押下")
//        // MPMediaPickerControllerのインスタンスを作成
//        let picker = MPMediaPickerController()
//        // ピッカーのデリゲートを設定
//        picker.delegate = self
//        // 複数選択を不可にする。（trueにすると、複数選択できる）
//        picker.allowsPickingMultipleItems = false
//        // ピッカーを表示する
//        present(picker, animated: true, completion: nil)
        let contentVC = TestViewController()
        fpc.set(contentViewController: contentVC)
        fpc.addPanel(toParent: self)
    }

    

}
