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

   
    @IBOutlet weak var lastnamekanzi: CustomTextField!
    @IBOutlet weak var firstnamekanzi: CustomTextField!
    @IBOutlet weak var lastnamekatakana: CustomTextField!
    @IBOutlet weak var firstnamekatakana: CustomTextField!
    @IBOutlet weak var errorlabel: UILabel!
    
    var flag1 = false
    var t = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "サインアップ"
        lastnamekanzi.delegate = self
        firstnamekanzi.delegate = self
        lastnamekatakana.delegate = self
        firstnamekatakana.delegate = self
        // Do any additional setup after loading the view.
        configureObserver()
        lastnamekanzi.text = LastNameKanzi
        firstnamekanzi.text = FirstNameKanzi
        lastnamekatakana.text = LastNameKatakana
        firstnamekatakana.text = FirstNameKatakana
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        errorlabel.text = ""
        self.flag1 = false
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func wantscrollmei(_ sender: Any) {
        t = true
    }
    @IBAction func wantscrollsei(_ sender: Any) {
        t = true
    }
    
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
             self.view.endEditing(true)
        let viewControllerStoryboard = UIStoryboard(name: "Signup2ViewController", bundle: nil)
        let viewController = viewControllerStoryboard.instantiateInitialViewController() as! Signup2ViewController
        viewController.hidesBottomBarWhenPushed = true
        LastNameKanzi = text1
        FirstNameKanzi = text2
        LastNameKatakana = text3
        FirstNameKatakana = text4
        
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
    func configureObserver() {
        
        let notification = NotificationCenter.default
        notification.addObserver(self, selector: #selector(keyboardWillShow(_:)),
                                 name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide(_:)),
                                 name: UIResponder.keyboardWillHideNotification, object: nil)
        print("Notificationを発行")
        
    }
    
    /// キーボードが表示時に画面をずらす。
    @objc func keyboardWillShow(_ notification: Notification?) {
        if(t == true){
            guard let rect = (notification?.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue,
                let duration = notification?.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }
            UIView.animate(withDuration: duration) {
                let transform = CGAffineTransform(translationX: 0, y: -(rect.size.height))
                self.view.transform = transform
            }
            print("keyboardWillShowを実行")
        }
    }
    
    /// キーボードが降りたら画面を戻す
    @objc func keyboardWillHide(_ notification: Notification?) {
        if(t == true){
            guard let duration = notification?.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? TimeInterval else { return }
            UIView.animate(withDuration: duration) {
                self.view.transform = CGAffineTransform.identity
            }
            print("keyboardWillHideを実行")
            t = false
        }
    }
}
extension Signup1ViewController{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
