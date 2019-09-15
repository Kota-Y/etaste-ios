//
//  SettingViewController.swift
//  ETASTE
//
//  Created by 石黒晴也 on 2019/08/10.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation
import UIKit

class SettingViewController: UIViewController  ,UITableViewDataSource, UITableViewDelegate{
    override func viewDidLoad() {
        super.viewDidLoad()
        SettingTable.isScrollEnabled = false
        SettingTable.tableFooterView = UIView()
        self.navigationItem.title = "設定"
    }
    @IBOutlet weak var SettingTable: UITableView!
}

extension SettingViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
extension SettingViewController {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setting = SettingContent(rawValue: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "sCell", for: indexPath)
        cell.textLabel?.text = String(setting!.info.title)
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell
    }
}
extension SettingViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingContent.allCases.count
    }
}

enum SettingContent:Int, CaseIterable {
    case profile
    case qanda
    case contact
    case opensource
    case termofservice
    case speciffictransactions
    case privacypolify
    case versioninfo
    case logout
    case unsubscription
    
    struct SettingData {
        var title: String
    }
    
    var info: SettingData {
        switch self {
        case .profile:
            let settingData = SettingData(title: "プロフィール編集")
            return settingData
        case .qanda:
            let settingData = SettingData(title: "Q & A")
            return settingData
        case .contact:
            let settingData = SettingData(title: "お問い合わせ")
            return settingData
        case .opensource:
            let settingData = SettingData(title: "オープンソース")
            return settingData
        case .termofservice:
            let settingData = SettingData(title: "利用規約")
            return settingData
        case .speciffictransactions:
            let settingData = SettingData(title: "特定商品取引法")
            return settingData
        case .privacypolify:
            let settingData = SettingData(title: "プライバシーポリシー")
            return settingData
        case .versioninfo:
            let settingData = SettingData(title: "バージョン情報")
            return settingData
        case .logout:
            let settingData = SettingData(title: "ログアウト")
            return settingData
        case .unsubscription:
            let settingData = SettingData(title: "退会について")
            return settingData
        }
    }
}
