//
//  Signup3ViewController.swift
//  ETASTE
//
//  Created by hakuchan on 2019/09/03.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import UIKit

class Signup3ViewController: UIViewController {

    
    @IBOutlet weak var toplabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "メール確認"
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
        toplabel.numberOfLines = 0
    }
    
    @IBAction func signupagainbutton(_ sender: Any) {
        let layere_number = navigationController!.viewControllers.count
    self.navigationController?.popToViewController(navigationController!.viewControllers[layere_number-4], animated: true)
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
