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
    public var allergy: String
    public var whySale: String
    public var image: String
    public var mapLatitude: String
    public var mapLongitude: String

    public init(_id: Int64, name: String, originalPrice: Int, salePrice: Int, startTime: String, endTime: String, allergy: String, whySale: String, image: String, mapLatitude: String, mapLongitude: String) {
        self._id = _id
        self.name = name
        self.originalPrice = originalPrice
        self.salePrice = salePrice
        self.startTime = startTime
        self.endTime = endTime
        self.allergy = allergy
        self.whySale = whySale
        self.image = image
        self.mapLatitude = mapLatitude
        self.mapLongitude = mapLongitude
    }

    public enum CodingKeys: String, CodingKey { 
        case _id = "id"
        case name
        case originalPrice
        case salePrice
        case startTime
        case endTime
        case allergy
        case whySale
        case image
        case mapLatitude
        case mapLongitude
    }


}

