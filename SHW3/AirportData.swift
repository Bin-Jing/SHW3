//
//  File.swift
//  SHW3
//
//  Created by Mac on 2017/5/18.
//  Copyright © 2017年 bjh. All rights reserved.
//

import Foundation

struct AirportData{
    static func getFilePath(fileName :String,fileType :String) -> String{
        return Bundle.main.path(forResource: fileName, ofType: fileType)!
    }
    static func getAirportData() ->[[String:AnyObject]]{
        return (NSArray(contentsOfFile: getFilePath(fileName: "airports",fileType: "plist"))! as? [[String : AnyObject]])!
    }
    static func distinctCountry() -> [String]{
        let airport = AirportData.getAirportData()
        var countries : [String] = []
        for i in 0..<airport.count{
            if(!countries.contains(airport[i]["Country"] as! String)){
                countries.append(airport[i]["Country"] as! String)
            }
        }
        return countries
    }
    static func airportInCountry() ->[[[String:AnyObject]]]{
        let countries = distinctCountry()
        let airport = AirportData.getAirportData()
        var sortedAirport :[[[String:AnyObject]]] = Array(repeating: [[:]], count: countries.count)
        var count:Int = 0
        for i in 0..<countries.count{
            for j in 0..<airport.count{
                if(countries[i] == (airport[j]["Country"] as! String)){
                    sortedAirport[i].insert(airport[j], at: count)
                    count += 1
                }
            }
            count = 0
        }
        return sortedAirport
    }
    
    

}
