//
// FoodDetail.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



public struct FoodDetail: Codable {

    public var id: Int64
    public var whySale: String
    public var allergy: String
    public var foodInfo: [StoreItem]
    public var storeInfo: [StoreDetail]

    public init(id: Int64, whySale: String, allergy: String, foodInfo: [StoreItem], storeInfo: [StoreDetail]) {
        self.id = id
        self.whySale = whySale
        self.allergy = allergy
        self.foodInfo = foodInfo
        self.storeInfo = storeInfo
    }


}
