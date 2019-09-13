//
//  APIConfiguration.swift
//  ETASTE
//
//  Created by 石黒晴也 on 2019/08/24.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation

struct APIHost {
    static var basePath: String = APIHostType.swagger.rawValue
    
    enum APIHostType: String {
        case release = "https://etaste.net/v1"
        case staging = "https://staging.etaste.net/v1"
        case develop = "https://develop.etaste.net/v1"
        case swagger = "http://127.0.0.1:8084"
    }
}
