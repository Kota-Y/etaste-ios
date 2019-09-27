//
//  SigninViewController.swift
//  ETASTE
//
//  Created by hakuchan on 2019/09/08.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import UIKit

class SigninViewController: UIViewController,UITextFieldDelegate {

   
    
    @IBOutlet weak var addresstextfield: UITextField!
    @IBOutlet weak var passwordtextfield: UITextField!
    @IBOutlet weak var errorlabel: UILabel!
    var email:String!
    var password:String!
    
    override func viewDidLoad() {
        self.navigationItem.title = "サインイン"
        addresstextfield.delegate = self
        passwordtextfield.delegate = self
        configureObserver()
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
  
    @IBAction func SignUpbutton(_ sender: Any) {
        self.view.endEditing(true)
        let viewControllerStoryboard = UIStoryboard(name: "Signup1ViewController", bundle: nil)
        let viewController = viewControllerStoryboard.instantiateInitialViewController() as! Signup1ViewController
        viewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    @IBAction func Login(_ sender: Any) {
        self.view.endEditing(true)
        let text1:String? = addresstextfield.text
        let text2:String? = passwordtextfield.text
        if (text1 == "" || text2 == "") {
            errorlabel.text = "全ての項目を記入してください"
        }else if(text1?.isEmailmerif() == false){
            errorlabel.text = "メールアドレスが有効では\nありません"
        }else if(text2?.isAlphanumeric() == false){
            errorlabel.text = "英数字8文字以上のパスワードを\n入力してください"
        }else{
            email = text1
            password = text2
            let signinmodel = SignInModel()
            let loginuser = UserLogin(mail: email, password: password)
            signinmodel.startSignIn(loginuser: loginuser, label: errorlabel)
            print(signinmodel.isloginable)
            if signinmodel.isloginable == false {
                errorlabel.text = "ログインできません"
            } else {
                print("liginol")
                let layere_number = navigationController!.viewControllers.count
                self.navigationController?.popToViewController(navigationController!.viewControllers[layere_number-2], animated: true)
            }
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
extension SigninViewController{
    //キーボードスクロール
  
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
       
            guard let rect = (notification?.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue,
                let duration = notification?.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }
            UIView.animate(withDuration: duration) {
                let transform = CGAffineTransform(translationX: 0, y: -(rect.size.height))
                self.view.transform = transform
            }
            print("keyboardWillShowを実行")
        
        
    }
    
    
    /// キーボードが降りたら画面を戻す
    @objc func keyboardWillHide(_ notification: Notification?) {
       
            guard let duration = notification?.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? TimeInterval else { return }
            UIView.animate(withDuration: duration) {
                self.view.transform = CGAffineTransform.identity
            }
            print("keyboardWillHideを実行")
        
        
        }
   
    
    
}
extension SigninViewController{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}

