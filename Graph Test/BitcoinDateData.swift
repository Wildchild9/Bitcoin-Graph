//
//  BitcoinDateData.swift
//  Graph Test
//
//  Created by Noah Wilder on 2018-02-13.
//  Copyright © 2018 Noah Wilder. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

func getBitcoinDateArrayDataDictionary(url: String, dates: [String], completion: @escaping (Bool, [String : Double]?) -> Void) {
    
    Alamofire.request(url, method: .get)
        
        .responseJSON { response in
            if response.result.isSuccess {
                
                print("Sucess! Completed the currency conversion")
                
                let btcJSON : JSON = JSON(response.result.value!)
                var totalSuccess : Bool = true
                var datesValueArray : [String: Double] = [:]
                
                for day in 1...dates.count {
                    
                    if let bitcoinResult = btcJSON["bpi"]["\(dates[day - 1])"].double {
                        let data : Double = bitcoinResult
                        let currentDate = "\(dates[day - 1])"
                        datesValueArray[currentDate] = data
                    } else {
                        totalSuccess = false
                    }
                }
                if totalSuccess == false {
                    let isSuccess = false
                    completion(isSuccess, nil)
                } else {
                    let isSuccess = true
                    completion(isSuccess, datesValueArray)
                }
                
                
                
                
                
                
                
            } else {
                print("Error: \(String(describing: response.result.error))")
                
                let isSuccess = false
                completion(isSuccess, nil)
                
            }
    }
    
}

func getBitcoinDateArrayData(url: String, dates: [String], completion: @escaping (Bool, [Double]) -> Void) {
    
    Alamofire.request(url, method: .get)
        
        .responseJSON { response in
            if response.result.isSuccess {
                
                print("Sucess! Completed the currency conversion")
                
                let btcJSON : JSON = JSON(response.result.value!)
                var isSuccess : Bool = true
                var datesValueArray : [Double] = []
                
                
                for day in 1...dates.count {
                    
                    if let bitcoinResult = btcJSON["bpi"]["\(dates[day - 1])"].double {
                        let data : Double = bitcoinResult
                        isSuccess = true
                        datesValueArray.append(data)
                        print("Date #\(datesValueArray.count) -> \(data), \(isSuccess)")
                        
                    } else {
                        isSuccess = false
                    }
                }
                completion(isSuccess, datesValueArray)
                
                
                
                
                
                
                
            } else {
                print("Error: \(String(describing: response.result.error))")
                
                let isSuccess = false
                let data : [Double] = [0]
                completion(isSuccess, data)
                
            }
    }
    
}

func getBitcoinDateSingleData(url: String, date: String, completion: @escaping (Bool, Double) -> Void) {
    
    Alamofire.request(url, method: .get)
        
        .responseJSON { response in
            if response.result.isSuccess {
                
                print("Sucess! Completed the currency conversion")

                
                
                let btcJSON : JSON = JSON(response.result.value!)
                
                if let bitcoinResult = btcJSON["bpi"]["\(date)"].double {
                    let isSuccess = true
                    let data : Double = bitcoinResult
                    completion(isSuccess, data)
                } else {
                    let isSuccess = false
                    let data : Double = 0
                    completion(isSuccess, data)
                }
                
                
                
                
                
            } else {
                print("Error: \(String(describing: response.result.error))")
                
                let isSuccess = false
                let data : Double = 0
                completion(isSuccess, data)
                
            }
    }
    
}

extension Double {
    func currencyFormat() -> String {
        let num : Double = self
        let numberFormatter = NumberFormatter()
        let result : NSNumber = num as NSNumber
        numberFormatter.numberStyle = NumberFormatter.Style.currency
        let formattedResult = numberFormatter.string(from: result)
        let finalResult : String = "\(formattedResult!.dropFirst())"
        return finalResult
    }
}


/*
 {
 "ask": 8693.49,
 "bid": 8684.24,
 "last": 8691.26,
 "high": 9303.96,
 "low": 7456.06,
 "open": {
 "hour": 8962.63,
 "day": 8658.63,
 "week": 14027.45,
 "month": 20955.59,
 "month_3": 9108.95,
 "month_6": 4043.01,
 "year": 1300.20
 },
 "averages": {
 "day": 8304.76,
 "week": 8690.67,
 "month": 10912.96
 },
 "volume": 602377.81590893,
 "changes": {
 "percent": {
 "hour": -3.03,
 "day": 0.38,
 "week": -38.04,
 "month": -58.53,
 "month_3": -4.59,
 "month_6": 114.97,
 "year": 568.46
 },
 "price": {
 "hour": -271.37,
 "day": 32.63,
 "week": -5336.19,
 "month": -12264.33,
 "month_3": -417.69,
 "month_6": 4648.25,
 "year": 7391.06
 }
 },
 "volume_percent": 0.55,
 "timestamp": 1517928282,
 "display_timestamp": "2018-02-06 14:44:42"
 }
 */

//    "ask": 8693.49,
//    "bid": 8684.24,
//    "last": 8691.26,
//    "high": 9303.96,
//    "low": 7456.06,
//    "open": {
//    "hour": 8962.63,
//    "day": 8658.63,
//    "week": 14027.45,
//    "month": 20955.59,
//    "month_3": 9108.95,
//    "month_6": 4043.01,
//    "year": 1300.20
//    },
//    "averages": {
//    "day": 8304.76,
//    "week": 8690.67,
//    "month": 10912.96
//    },
//    "volume": 602377.81590893,
//    "changes": {
//    "percent": {
//    "hour": -3.03,
//    "day": 0.38,
//    "week": -38.04,
//    "month": -58.53,
//    "month_3": -4.59,
//    "month_6": 114.97,
//    "year": 568.46
//    },
//    "price": {
//    "hour": -271.37,
//    "day": 32.63,
//    "week": -5336.19,
//    "month": -12264.33,
//    "month_3": -417.69,
//    "month_6": 4648.25,
//    "year": 7391.06
//    }
//    },
//    "volume_percent": 0.55,
//    "timestamp": 1517928282,
//    "display_timestamp": "2018-02-06 14:44:42"



