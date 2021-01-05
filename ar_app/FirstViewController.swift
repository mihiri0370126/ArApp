//
//  FirstViewController.swift
//  ar_app
//
//  Created by 岸本蓮 on 2021/01/05.
//

import UIKit

class FirstViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {


    @IBOutlet weak var ageTxF: UITextField!
    @IBOutlet weak var sexTxF: UITextField!
    
    var pickerView: UIPickerView = UIPickerView()
    var pickerView1: UIPickerView = UIPickerView()
    let list = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "12", "13", "14", "15", "16", "17", "18", "19", "20","21", "22", "23", "24", "25", "26", "27", "28", "29", "30","31", "32", "33", "34", "35", "36", "37", "38", "39", "40","51", "52", "53", "54", "55", "56", "57", "58", "59", "60","61", "62", "63", "64", "65", "66", "67", "68", "69", "70","71", "72", "73", "74", "75", "76", "77", "78", "79", "80","81", "82", "83", "84", "85", "86", "87", "88", "89", "90","91", "92", "93", "94", "95", "96", "97", "98", "99", "100"]
    let sexlist = ["男性","女性","どちらでもない"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefaults = UserDefaults.standard
        
        print(userDefaults.string(forKey: "String")!)
        if (userDefaults.string(forKey: "String")! == "str") {
            self.performSegue(withIdentifier: "VerSegue1", sender: nil)
            print("ここつうか")
        }
        self.ageTxF.text = list[0]
        self.sexTxF.text = sexlist[0]
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.tag = 0
        pickerView.showsSelectionIndicator = true
        
        pickerView1.delegate = self
        pickerView1.dataSource = self
        pickerView1.tag = 1
        pickerView1.showsSelectionIndicator = true

        let toolbar = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(FirstViewController.done))
//        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(FirstViewController.cancel))
//        toolbar.setItems([cancelItem, doneItem], animated: true)
        toolbar.setItems([doneItem], animated: true)
        self.ageTxF.inputView = pickerView
        self.ageTxF.inputAccessoryView = toolbar
        
        self.sexTxF.inputView = pickerView1
        self.sexTxF.inputAccessoryView = toolbar

        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
   }

   func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if pickerView.tag == 0{
       return list.count
    }else{
        return sexlist.count
    }
   }

   func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if pickerView.tag == 0{
       return list[row]
    }else{
        return sexlist[row]
    }
   }

   func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    if pickerView.tag == 0{
        self.ageTxF.text = list[row]
    }else{
        self.sexTxF.text = sexlist[row]
    }
   }

    @objc func cancel() {
        if pickerView.tag == 0{
           self.ageTxF.text = ""
           self.ageTxF.endEditing(true)
        }else{
            self.sexTxF.text = ""
            self.sexTxF.endEditing(true)
        }
   }

    @objc func done() {
        if pickerView.tag == 0{
            self.ageTxF.endEditing(true)
        }else{
            self.sexTxF.endEditing(true)
        }
   }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }

   func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
       return CGRect(x: x, y: y, width: width, height: height)
   }

    override func didReceiveMemoryWarning() {
       super.didReceiveMemoryWarning()
       // Dispose of any resources that can be recreated.
   }
    
    @IBAction func agree(_ sender: Any) {

        let userDefaults = UserDefaults.standard
        userDefaults.set(
            "str",forKey:"String"
        )
        performSegue(withIdentifier: "VerSegue1", sender: self)
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let userDefaults = UserDefaults.standard
        userDefaults.set(
            "str",forKey:"String"
        )
        return true
    }
    
}
