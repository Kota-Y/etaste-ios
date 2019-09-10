//
//  DealViewController.swift
//  ETASTE
//
//  Created by 石黒晴也 on 2019/08/10.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation
import UIKit

class DealViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
   
    @IBOutlet weak var dwillbutton: UIButton!
    @IBOutlet weak var dpastbutton: UIButton!
    @IBOutlet weak var dealwilllabel: Deallabel!
    @IBOutlet weak var dealpastlabel: Deallabel!
    @IBOutlet weak var Dealwillview: UIView!
    @IBOutlet weak var Dealpastview: UIView!
    @IBOutlet weak var tableviewout: UIView!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var dwillunder: UILabel!
    @IBOutlet weak var dpastunder: UILabel!
    
    
    var itemwill:[DealTableItem] = [DealTableItem]()
    var itempast:[DealTableItem] = [DealTableItem]()
    var screen:Bool = true
    
    
    override func viewDidLoad() {
        self.navigationItem.title = "受取履歴"
        super.viewDidLoad()
        self.tableview.tableFooterView = UIView(frame: .zero)
        self.setupbuttonlayout()
        self.tableview.dataSource = self
        self.tableview.delegate = self
        self.tableview.register(UINib(nibName: "DealWillTableViewCell", bundle: nil), forCellReuseIdentifier: "DealWillTableViewCell")
        self.setuptableitem()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
    }
    
    
    
    @objc func yesButton(_ sender: UIButton) {
        if let viewWithTag = self.view.viewWithTag(100) {
            //tag見つかる
            viewWithTag.removeFromSuperview()
        }
    }
    
    
    @objc func noButton(_ sender: UIButton) {
        if let viewWithTag = self.view.viewWithTag(100) {
            //tag見つかる
            viewWithTag.removeFromSuperview()
        }
    }
    
    
    @IBAction func dealwillbutton(_ sender: Any) {
       self.dealwillon()
        screen = true
        self.tableview.reloadData()
    }
    
    @IBAction func dealpastbutton(_ sender: Any) {
        self.dealpaston()
        screen = false
        self.tableview.reloadData()
    }
    
    @objc func tapCellButton(_ sender: UIButton) {
        print("タップされたよ")
        print(sender.tag)
        alert()
    }

    
    //function
    
    func dealwillon(){
        dpastbutton.layer.borderColor = UIColor.gray.cgColor
        dwillbutton.layer.borderColor = UIColor.etasteYellow.cgColor
        dealwilllabel.labelstate(state: true)
        dealpastlabel.labelstate(state: false)
        dwillunder.backgroundColor = UIColor.white
        dpastunder.backgroundColor = UIColor.etasteYellow
    }
    
    func dealpaston(){
        dwillbutton.layer.borderColor = UIColor.gray.cgColor
        dpastbutton.layer.borderColor = UIColor.etasteYellow.cgColor
        dealwilllabel.labelstate(state: false)
        dealpastlabel.labelstate(state: true)
        
        
        dpastunder.backgroundColor = UIColor.white
        dwillunder.backgroundColor = UIColor.etasteYellow
    }
    
    
    func alert(){
        
        let popupView:DealAlert = UINib(nibName: "DealAlert", bundle: nil).instantiate(withOwner: self,options: nil)[0] as! DealAlert
        popupView.yesbutton.addTarget(self, action: #selector(yesButton(_:)), for: .touchUpInside)
        popupView.nobutton.addTarget(self, action: #selector(noButton(_:)), for: .touchUpInside)
        
        let viewColor = UIColor.black
        popupView.backgroundColor = viewColor.withAlphaComponent(0.5)
        popupView.frame = self.view.frame
        popupView.tag = 100
        // 貼り付ける
        self.view.addSubview(popupView)
    }
    
    //setup//
    func setupbuttonlayout(){
        dealwilllabel.setuplabel(state: true ,title: "受取予定")
        dealpastlabel.setuplabel(state: false ,title: "受取済み")
        tableviewout.backgroundColor = UIColor.etasteYellow
        dwillbutton.layer.cornerRadius = 15
        dwillbutton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        dwillbutton.layer.borderWidth = 2.0
        dwillbutton.layer.borderColor = UIColor.etasteYellow.cgColor
        dpastbutton.layer.cornerRadius = 15
        dpastbutton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        dpastbutton.layer.borderWidth = 2.0
        dpastbutton.layer.borderColor = UIColor.etasteYellow.cgColor
        dwillunder.backgroundColor = UIColor.white
        dpastunder.backgroundColor = UIColor.etasteYellow
        dealwillon()
        
    }
    
    func setuptableitem(){
        itemwill = [DealTableItem(id: "1", name: "あんぱん", itemNum: 3, sum: 150, time: "2018/12/12/18:00", storeName: "滝川パン", image: "https://dl.dropboxusercontent.com/s/fxss9wae0iq143q/an-pan.jpg")]
        itempast = [DealTableItem(id:"2",name: "あんぱん2", itemNum: 5, sum: 150, time: "2018/12/12/18:00", storeName: "滝川", image: "https://dl.dropboxusercontent.com/s/fxss9wae0iq143q/an-pan.jpg")]
    }
    
    
    
   
}

extension DealViewController{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
extension DealViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if screen == true{
            return itemwill.count
        } else {
            return itempast.count
        }
    }
}
extension DealViewController{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DealWillTableViewCell", for: indexPath ) as!
        DealWillTableViewCell
        if screen == true {
            cell.hidenbutton(hidden: false)
            cell.setupCell(cell: itemwill[indexPath.row])
            //xibのbutton
            
            cell.dealcompletebutton.addTarget(self, action: #selector(tapCellButton(_:)), for: .touchUpInside)
            cell.dealcompletebutton.tag = Int(itemwill[indexPath.row].id)!
            
        } else{
            cell.hidenbutton(hidden: true)
            cell.setupCell(cell: itempast[indexPath.row])
            
        }
       
        return cell
    }
}
extension DealViewController {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if screen == true {
            return 220
        } else{
            return 200
            
        }
    }
}

