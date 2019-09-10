//
//  FavoriteViewController.swift
//  ETASTE
//
//  Created by 石黒晴也 on 2019/08/10.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation
import UIKit

class FavoriteViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "お気に入り"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "loginicon")?.withRenderingMode(.alwaysOriginal),
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(login))
        
        favoritetable.delegate = self
        favoritetable.dataSource = self
        favoritetable.tableFooterView = UIView(frame: .zero)
        favoritetable.register(UINib(nibName: "FavoriteTableViewCell", bundle: nil), forCellReuseIdentifier: "FavoriteTableViewCell")
        self.setupFavoriteTable()
//        let frame = CGRect(x: 0, y: 0, width: favoritetable.frame.width, height: 1/*お好きな高さに*/)
//        favoritetable.tableHeaderView = UIView(frame: frame)
//        favoritetable.tableHeaderView!.backgroundColor = UIColor.gray
        
    }
    
    @objc func login() {
        
    }
    
    @IBOutlet weak var favoritetable: UITableView!
    var favoritecell:[FavoriteItemCell] = [FavoriteItemCell]()

    func setupFavoriteTable(){
        favoritecell = [FavoriteItemCell(favoriteimagestring: "https://dl.dropboxusercontent.com/s/7vyyl6u3h66enwv/takigawa-pan.jpg", favoritestorename: "Eパン", favoritestorelocation: "熊本", id: "1"),FavoriteItemCell(favoriteimagestring: "https://dl.dropboxusercontent.com/s/7vyyl6u3h66enwv/takigawa-pan.jpg", favoritestorename: "滝川パン", favoritestorelocation: "熊本中央区", id: "1"),FavoriteItemCell(favoriteimagestring: "https://dl.dropboxusercontent.com/s/7vyyl6u3h66enwv/takigawa-pan.jpg", favoritestorename: "Eパン", favoritestorelocation: "熊本", id: "1")]
    }
}

extension FavoriteViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  favoritecell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTableViewCell", for: indexPath ) as! FavoriteTableViewCell
        
        cell.setCell(item:favoritecell[indexPath.row])
        
        return cell
    }
}

