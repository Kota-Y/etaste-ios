//
// TradeComplete.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



public struct TradeComplete: Codable {

    public var userId: Int64
    public var tradeId: Int64

    public init(userId: Int64, tradeId: Int64) {
        self.userId = userId
        self.tradeId = tradeId
    }


}
