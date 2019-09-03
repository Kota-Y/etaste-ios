//
//  Signup1ViewController.swift
//  ETASTE
//
//  Created by hakuchan on 2019/09/03.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import UIKit
import Foundation

class Signup1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         self.title = "サインアップ"
       
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextbutton(_ sender: Any) {
        let viewControllerStoryboard = UIStoryboard(name: "Signup2ViewController", bundle: nil)
        let viewController = viewControllerStoryboard.instantiateInitialViewController() as! Signup2ViewController
        self.navigationController?.pushViewController(viewController, animated: true)
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
