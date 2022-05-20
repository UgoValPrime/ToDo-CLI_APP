//
//  Constants.swift
//  CLI-ToDo-App
//
//  Created by  Ugo  Val on 20/05/2022.
//

import Foundation


func stringToDate(_ string: String) -> Date? {
    let formatter = DateFormatter()
    formatter.timeZone = .init(abbreviation: "GMT")
    formatter.locale    = .current
    formatter.dateFormat = "dd-MM-yyyy"
    return formatter.date(from: string)
}

func formateDate(_ date: Date) -> String {
    let formatter           = DateFormatter()
    formatter.timeZone      = .current
    formatter.locale        = .current
    formatter.dateFormat    = "dd-MM-yyyy"
    return formatter.string(from: date)
}
