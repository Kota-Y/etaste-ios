//
//  String.swift
//  ETASTE
//
//  Created by hakuchan on 2019/09/08.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation
extension String {
    func isAlphanumeric() -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[a-zA-Z0-9]{8,100}").evaluate(with: self)
    }
    func isEmailmerif() -> Bool{
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}").evaluate(with: self)
    }
}
