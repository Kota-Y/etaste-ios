//
// FoodItem.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



public struct FoodItem: Codable {

    public var _id: Int64
    public var name: String
    public var originalPrice: Int
    public var salePrice: Int
    public var startTime: String
    public var endTime: String
    public var image: String
    public var storeMap: String

    public init(_id: Int64, name: String, originalPrice: Int, salePrice: Int, startTime: String, endTime: String, image: String, storeMap: String) {
        self._id = _id
        self.name = name
        self.originalPrice = originalPrice
        self.salePrice = salePrice
        self.startTime = startTime
        self.endTime = endTime
        self.image = image
        self.storeMap = storeMap
    }

    public enum CodingKeys: String, CodingKey { 
        case _id = "id"
        case name
        case originalPrice
        case salePrice
        case startTime
        case endTime
        case image
        case storeMap
    }


}

