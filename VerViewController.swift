//
//  VerViewController.swift
//  ar_app
//
//  Created by 岸本蓮 on 2021/01/05.
//

import UIKit

class VerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func QrRead(_ sender: Any) {
        self.performSegue(withIdentifier: "ARSegue", sender: nil)
    }
    @IBAction func Coupon(_ sender: Any) {
        self.performSegue(withIdentifier: "CouponSegue", sender: nil)
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ARSegue" {
//            //移動する変数vcを定義する
//            let vc = segue.destination as! ViewController
//            //TestViewControllerのtextFieldのテキストを代入
//            vc.choose = self.choose!
//        }
//    }
    
    
}
