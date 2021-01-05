//
//  TestViewController.swift
//  ar_app
//
//  Created by 岸本蓮 on 2020/12/03.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var qrLabel: UILabel!
    
    var QrText = String()
    
    //ナビ選択情報
    var navi = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        qrLabel.text = QrText
        
        // Do any additional setup after loading the view.
    }
    @IBAction func closeActionButton(_ sender: Any) {
        let vcont = self.presentingViewController as! ViewController
        print(vcont.cnt)
        vcont.cnt = 0
        print(vcont.cnt)
            dismiss(animated: true, completion: nil)
            
        }
    
    @IBAction func naviChoose(_ sender: Any) {
        self.performSegue(withIdentifier: "NaviSegue", sender: nil)
    }
    
    @IBAction func backButton(_ sender: Any) {
        let vcont = self.presentingViewController as! ViewController
        print(vcont.cnt)
        vcont.cnt = 0
        print(vcont.cnt)
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension CALayer {

    func setBorderIBColor(color: UIColor!) -> Void{
        self.borderColor = color.cgColor
    }
}
