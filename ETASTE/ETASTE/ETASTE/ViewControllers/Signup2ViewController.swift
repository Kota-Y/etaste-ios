//
//  Signup2ViewController.swift
//  ETASTE
//
//  Created by hakuchan on 2019/09/03.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import UIKit

class Signup2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationItem.title = "サインアップ"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextbutton(_ sender: Any) {
        //let viewControllerStoryboard = UIStoryboard(name: "Signup3ViewController", bundle: nil)
        //let viewController = viewControllerStoryboard.instantiateInitialViewController() as! Signup3ViewController
        let storyboard: UIStoryboard = UIStoryboard(name: "Signup3ViewController", bundle: nil)
        let nextVC = storyboard.instantiateInitialViewController()as! Signup3ViewController
        self.present(nextVC, animated: false, completion: nil)
        
        
        //self.navigationController?.pushViewController(viewController, animated: true)
        
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
