//
//  Signup1ViewController.swift
//  ETASTE
//
//  Created by hakuchan on 2019/09/03.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import UIKit
import Foundation



class Signup1ViewController: UIViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "サインアップ"
        lastnamekanzi.delegate = self
        firstnamekanzi.delegate = self
        lastnamekatakana.delegate = self
        firstnamekatakana.delegate = self
        // Do any additional setup after loading the view.
       
    }
    override func viewWillAppear(_ animated: Bool) {
       
        errorlabel.text = ""
        self.flag1 = false
        
    }
    @IBOutlet weak var lastnamekanzi: CustomTextField!
    @IBOutlet weak var firstnamekanzi: CustomTextField!
    @IBOutlet weak var lastnamekatakana: CustomTextField!
    @IBOutlet weak var firstnamekatakana: CustomTextField!
    @IBOutlet weak var errorlabel: UILabel!
    
    var flag1 = false
    
    
    @IBAction func nextbutton(_ sender: Any) {
        let text1:String? = lastnamekanzi.text
        let text2:String? = firstnamekanzi.text
        let text3:String? = lastnamekatakana.text
        let text4:String? = firstnamekatakana.text
        if self.flag1 == false{
            if (text1 == "" || text2 == "" || text3 == "" || text4 == ""){
                errorlabel.text = "全ての項目を記入してください"
            } else{
                self.flag1 = true
            }
        }
        
        if self.flag1 == true{
        let viewControllerStoryboard = UIStoryboard(name: "Signup2ViewController", bundle: nil)
        let viewController = viewControllerStoryboard.instantiateInitialViewController() as! Signup2ViewController
        viewController.hidesBottomBarWhenPushed = true
        viewController.LastNameKanzi = text1
        viewController.FirstNameKanzi = text2
        viewController.LastNameKatakana = text3
        viewController.FirstNameKatakana = text4
        
        self.navigationController?.pushViewController(viewController, animated: true)
        } else{
            
            
        }
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

extension Signup1ViewController{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
