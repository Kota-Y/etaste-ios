//
//  SettingViewController.swift
//  ETASTE
//
//  Created by 石黒晴也 on 2019/08/10.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation
import UIKit

class SettingViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SettingTable.isScrollEnabled = false
        SettingTable.tableFooterView = UIView()
        self.navigationItem.title = "設定"
    }

    
    @IBOutlet weak var SettingTable: UITableView!
    
    let settingContent = ["プロフィール編集", "Q＆A","お問い合わせ","オープンソース","利用規約","特定商品取引法","プライバシーポリシー","バージョン情報","ログアウト","退会について"]
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SettingTable.dequeueReusableCell(withIdentifier: "sCell", for: indexPath)
        let label = cell.viewWithTag(1) as! UILabel
         label.text =  String(settingContent[indexPath.row])
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell
    }
   
}
