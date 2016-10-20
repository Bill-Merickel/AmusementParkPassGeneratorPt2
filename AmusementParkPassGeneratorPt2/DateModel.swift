//
//  DateModel.swift
//  AmusementParkPassGeneratorPt2
//
//  Created by Bill Merickel on 10/15/16.
//  Copyright © 2016 Bill Merickel. All rights reserved.
//

import Foundation

struct CustomDate {
    var day: Int
    var month: Int
    var year: Int
    
    init(day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }
}

let date = Date()
let calendar = Calendar.current

let month = calendar.component(.month, from: date)
let day = calendar.component(.day, from: date)
