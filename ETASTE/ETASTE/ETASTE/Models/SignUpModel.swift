//
//  SignUpModel.swift
//  ETASTE
//
//  Created by hakuchan on 2019/09/08.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation

import UIKit
class SignUpModel{

    func startSignUp(user:User,label:UILabel){
        UserAPI.loginUser{ user, error in
            if let _ = error {
                //print(error)
                label.text = "エラー"
            } else {
                //print(data)
               //print("ok")
                //label.text = "ok"
            }
        }
    }
}
