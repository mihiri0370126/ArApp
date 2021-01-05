//
//  ChooseViewController.swift
//  ar_app
//
//  Created by 岸本蓮 on 2021/01/05.
//

import UIKit

class ChooseViewController: UIViewController {

    var navi : String?
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

    @IBAction func TapButton(_ sender: Any) {
        self.navi = "1"
        segue()
    }
    @IBAction func TapButton1(_ sender: Any) {
        self.navi = "2"
        segue()
    }
    func segue(){
        self.performSegue(withIdentifier: "ARStart", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        //移動する変数vcを定義する
//        let vc = segue.destination as! VerViewController
//        //TestViewControllerのtextFieldのテキストを代入
//        vc.choose = self.navi!
    }
}
