//
//  SignUpModel.swift
//  ETASTE
//
//  Created by hakuchan on 2019/09/08.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation


class SignUpModel{
    var Firstnamekanzi:String?
    var Secondnamekanzi:String?
    var Firstnamekatakana:String?
    var Secondnamekatakana:String?
    
    init(fkan:String,Skan:String,Fkata:String,Skata:String) {
        self.Firstnamekanzi = fkan as String
        self.Secondnamekanzi = Skan as String
        self.Firstnamekatakana = Fkata as String
        self.Secondnamekatakana = Skata as String
    }
}
