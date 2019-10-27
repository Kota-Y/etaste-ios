//
//  PayConfirmingViewController.swift
//  
//
//  Created by 石黒晴也 on 2019/10/28.
//

import Foundation
import UIKit

class PayConfirmingViewController: UIViewController {
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemAmountLabel: UILabel!
    @IBOutlet weak var itemReceiveTimeLabel: UILabel!
    
    var foodDetailData: FoodDetail! // 次の遷移先で必要
    var itemAmount: String!
    var itemReceiveTime: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "購入確認"
        
        itemNameLabel.text = foodDetailData.foodInfo.first?.name
        itemAmountLabel.text = itemAmount
        itemReceiveTimeLabel.text = itemReceiveTime
    }

    
    @IBAction func tapPayConfirmFinishButton(_ sender: UIButton) {
    }
    
}
