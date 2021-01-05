//
//  CouponViewController.swift
//  ar_app
//
//  Created by 岸本蓮 on 2021/01/05.
//

import UIKit

class CouponViewController: UIViewController {

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

    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        print("top")
    }
    
}
