//
//  File.swift
//  
//
//  Created by Ji-hoon Ahn on 2022/04/07.
//

import Foundation

public extension Date{
    public func usingDate(time : Date) -> String{
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "yyyy-MM-dd a"
        return dataFormatter.string(from: time )
    }
}
