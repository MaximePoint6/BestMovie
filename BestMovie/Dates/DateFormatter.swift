//
//  DateFormatter.swift
//  BestMovie
//
//  Created by Maxime Point on 29/03/2022.
//

import Foundation

// on crée cette fonction privée pour avoir une date formaté sous le format "12 oct" par exemple
public func dateToString (date: Date) -> String {
    let dateFormatter = DateFormatter()
    // French Locale (fr_FR)
    dateFormatter.locale = Locale(identifier: "fr_FR")
    dateFormatter.dateFormat = "yyyy"
    return dateFormatter.string(from: date)
}

public func stringToDate (stringDate: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MM-yyyy"
    return dateFormatter.date(from: stringDate)!
}
