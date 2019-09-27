//
//  Signup2ViewController.swift
//  ETASTE
//
//  Created by hakuchan on 2019/09/03.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import UIKit


var FirstNameKanzi:String!
var LastNameKanzi:String!
var FirstNameKatakana:String!
var LastNameKatakana:String!

class Signup2ViewController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var emailaddress: CustomTextField!
    @IBOutlet weak var password: CustomTextField!
    @IBOutlet weak var passwordconfirm: CustomTextField!
    @IBOutlet weak var Errorlabel: UILabel!
    
    var flag2 = false
    
    var EmailAddress:String!
    var Password:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "サインアップ"
        emailaddress.delegate = self
        password.delegate = self
        passwordconfirm.delegate = self
        Errorlabel.numberOfLines = 0
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.flag2 = false
        Errorlabel.text = ""
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func nextbutton(_ sender: Any) {
     
        let text5:String? = emailaddress.text
        let text6:String? = password.text
        let text7:String? = passwordconfirm.text
        if self.flag2 == false{

            if(text5 == "" || text6 == "" || text7 == ""){
                self.Errorlabel.text = "全ての項目を記入してください"
            } else if(text5?.isEmailmerif() == false){
                self.Errorlabel.text = "有効なメールアドレスではありません"
            }else if(text6?.isAlphanumeric() == false){
                self.Errorlabel.text = "パスワードを半角英数字8文字以上で記入してください"
        }else if(text6 != text7) {
                self.Errorlabel.text = "パスワードが一致しません"
            }else{
                self.flag2 = true
            }
            
        }

        if self.flag2 == true{
               self.view.endEditing(true)
            EmailAddress = text5
            Password = text6
            self.signup()
            
            
        let viewControllerStoryboard = UIStoryboard(name: "Signup3ViewController", bundle: nil)
        let viewController = viewControllerStoryboard.instantiateInitialViewController() as! Signup3ViewController
        viewController.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    
    func signup(){
        let user = User(firstName: FirstNameKanzi, lastName: LastNameKanzi, firstNameKana: FirstNameKatakana, lastNameKana:LastNameKatakana, mail: EmailAddress, password: Password)
        let startsignup = SignUpModel()
        startsignup.startSignUp(user: user,label:Errorlabel)
        
        
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
extension Signup2ViewController{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
