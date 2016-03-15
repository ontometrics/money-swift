//
//  Money.swift
//  Sourcerer
//
//  Created by Rob Williams on 7/13/15.
//  Copyright © 2015 ontometrics. All rights reserved.
//

import Foundation

protocol ExchangeBasis {
    var name:String { get }
    var symbol:String { get }
}

public enum Currency : ExchangeBasis, Equatable {
    case USD
    
    static let allValues = [ USD ]
    
    var symbol:String {
        get {
            switch self {
            case .USD:
                return "$"
            }
        }
    }
    
    var name:String {
        get {
            switch self {
            case .USD:
                return "US Dollar"
            }
        }
    }
    
    
}

public func ==(lhs:Currency, rhs:Currency) -> Bool {
    return lhs.symbol==rhs.symbol
}

let defaultCurrency:Currency = .USD

protocol Exchangeable {
    var amount:Double { get }
    var currency:Currency { get }
}

@objc
public class Money : NSObject, Exchangeable {
    let amount:Double
    let currency:Currency
    override public var description:String {
        get {
            return currency.symbol + String(format: "%.2f", amount)
        }
    }
    
    public init(amount:Double, currency:Currency = defaultCurrency){
        self.amount = amount
        self.currency = currency
    }
    
}

public func ==(lhs:Money, rhs:Money) -> Bool {
    return lhs.currency==rhs.currency && lhs.amount==rhs.amount
}

public func +(lhs:Money, rhs:Double) -> Money {
    return Money(amount: lhs.amount + rhs, currency: lhs.currency)
}

public func >(lhs:Money, rhs:Money) -> Bool {
    return lhs.amount > rhs.amount
}

public func <(lhs:Money, rhs:Money) -> Bool {
    return lhs.amount < rhs.amount
}

/*
enum MoneyParseError : ErrorType {
    case UnknownCurrency
}

class MoneyParser {
    func parse(input:String) throws -> Money {
        for currency in Currency.allValues {
            if input.characters.contains(currency.symbol.characters.first!) {
                let amountString = input.stringByReplacingOccurrencesOfString(currency.symbol, withString: "")
                return Money(amount: (amountString as NSString).doubleValue, currency: currency)
            }
        }
        throw MoneyParseError.UnknownCurrency
    }

}
*/