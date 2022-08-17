//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Juan Diego Ocampo on 15/08/2022.
//

import Foundation

extension Date {
    
    var formattedAsMonthYear: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: self)
    }
    
}
