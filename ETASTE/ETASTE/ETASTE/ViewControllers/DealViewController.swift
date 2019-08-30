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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.tableFooterView = UIView(frame: .zero)
        self.setupbuttonlayout()
        self.tableview.dataSource = self
        self.tableview.delegate = self
        self.tableview.register(UINib(nibName: "DealTableViewCell", bundle: nil), forCellReuseIdentifier: "DealTableViewCell")
        self.setuptableitem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
    }
    
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
    
    
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    func setuptableitem(){
        itemwill = [DealTableItem(name: "あんぱん", itemNum: 3, sum: 150, time: "2018/12/12/18:00", storeName: "滝川パン", image: "https://dl.dropboxusercontent.com/s/fxss9wae0iq143q/an-pan.jpg")]
         itempast = [DealTableItem(name: "あんぱん2", itemNum: 5, sum: 150, time: "2018/12/12/18:00", storeName: "滝川", image: "https://dl.dropboxusercontent.com/s/fxss9wae0iq143q/an-pan.jpg")]
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if screen == true{
        return itemwill.count
        } else {
            return itempast.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DealTableViewCell", for: indexPath ) as!
        DealTableViewCell
        if screen == true {
        cell.setupCell(cell: itemwill[indexPath.row])
        } else{
            cell.setupCell(cell: itempast[indexPath.row])
        }
        
        return cell
    }
    
    
}

