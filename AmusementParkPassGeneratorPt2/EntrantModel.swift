//
//  EntrantModel.swift
//  AmusementParkPassGeneratorPt2
//
//  Created by Bill Merickel on 10/13/16.
//  Copyright © 2016 Bill Merickel. All rights reserved.
//

import Foundation

// Protocols

protocol Entrant {
    var areaAccess: AreaAccess { get }
    var rideAccess: RideAccess { get }
    var discountAccess: DiscountAccess? { get }
    var information: Information? { get }
    var accessGranted: Bool { get }
}

// Classes

class Guest: Entrant {
    var areaAccess: AreaAccess
    var rideAccess: RideAccess
    var discountAccess: DiscountAccess?
    var information: Information?
    var guestType: GuestType
    var accessGranted: Bool = true
    
    required init(guestType: GuestType, DOB: DateOfBirth?) {
        self.guestType = guestType
        switch guestType {
        case .vip: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: false, maintainanceAreas: false, officeAreas: false); self.rideAccess = RideAccess(skipAllRides: true); self.discountAccess = DiscountAccess(foodDiscount: 10, merchandiseDiscount: 20); self.information = nil
            
        case .classic: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: false, maintainanceAreas: false, officeAreas: false); self.rideAccess = RideAccess(skipAllRides: false); self.discountAccess = nil; self.information = nil
            
        case .freeChild: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: false, maintainanceAreas: false, officeAreas: false); self.rideAccess = RideAccess(skipAllRides: false); self.discountAccess = nil; self.information = Information(firstName: nil, lastName: nil, DOB: DOB as DateOfBirth!, streetAddress: nil, city: nil, state: nil, zipCode: nil)
        
        do {
            try checkForDate(self)
        } catch Errors.missingDOB {
            print("Missing Date Of Birth!")
            self.accessGranted = false
            break
        } catch _ {
            fatalError("Something unknown went wrong. Sorry!")
            }
            
        }
    }
    
    // Class function that checks if it's your birthday
    
    class func checkForBirthday(_ guest: Entrant) {
        if let dateOfBirth = guest.information?.DOB {
            if dateOfBirth.day == day && dateOfBirth.month == month {
                print("Happy Birthday!! I hope you have an absolutely fantastic day at the park!")
            }
        }
    }
}

class HourlyEmployee: Entrant {
    var areaAccess: AreaAccess
    var rideAccess: RideAccess
    var discountAccess: DiscountAccess?
    var information: Information?
    var employeeType: HourlyEmployeeType
    var accessGranted: Bool = true
    
    required init(employeeType: HourlyEmployeeType, firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String) {
        self.employeeType = employeeType
        switch employeeType {
        case .foodServices: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: false, maintainanceAreas: false, officeAreas: false); self.rideAccess = RideAccess(skipAllRides: false); self.discountAccess = DiscountAccess(foodDiscount: 15, merchandiseDiscount: 25); self.information = Information(firstName: "Bill", lastName: "Merickel", DOB: nil, streetAddress: "1111", city: "LA", state: "CA", zipCode: "92506")
            
        case .rideServices: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: true, maintainanceAreas: true, officeAreas: false); self.rideAccess = RideAccess(skipAllRides: false); self.discountAccess = DiscountAccess(foodDiscount: 15, merchandiseDiscount: 25); self.information = Information(firstName: "Bill", lastName: "Merickel", DOB: nil, streetAddress: "1111", city: "LA", state: "CA", zipCode: "92506")
            
        case .maintainence: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: false, maintainanceAreas: true, officeAreas: false); self.rideAccess = RideAccess(skipAllRides: false); self.discountAccess = DiscountAccess(foodDiscount: 15, merchandiseDiscount: 25); self.information = Information(firstName: firstName, lastName: lastName, DOB: nil, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
            
        }
    }
}



class Manager: Entrant {
    var areaAccess: AreaAccess = AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: true, maintainanceAreas: true, officeAreas: true)
    var rideAccess: RideAccess = RideAccess(skipAllRides: true)
    var discountAccess: DiscountAccess? = DiscountAccess(foodDiscount: 15, merchandiseDiscount: 25)
    var information: Information?
    var accessGranted: Bool = true
    
    required init(information: Information) {
        self.information = information
    }
}

// Entrant enums

enum GuestType {
    case classic
    case vip
    case freeChild
}



enum HourlyEmployeeType {
    case foodServices
    case rideServices
    case maintainence
}

// Errors

enum Errors: Error {
    case missingDOB
}

// Helper structs

struct AreaAccess {
    var amusementAreas: Bool
    var kitchenAreas: Bool
    var rideControlAreas: Bool
    var maintainanceAreas: Bool
    var officeAreas: Bool
}

struct RideAccess {
    let accessAllRides: Bool = true
    var skipAllRides: Bool
}

struct DiscountAccess {
    var foodDiscount: Int?
    var merchandiseDiscount: Int?
}

struct Information {
    var firstName: String?
    var lastName: String?
    var DOB: DateOfBirth?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: String?
    
    init(firstName: String?, lastName: String?, DOB: DateOfBirth?, streetAddress: String?, city: String?, state: String?, zipCode: String?) {
        self.firstName = firstName
        self.lastName = lastName
        self.DOB = DOB
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
}



// Checks the DOB property and throws and an error if missing

func checkForDate(_ guest: Guest) throws {
    if guest.information?.DOB == nil {
        throw Errors.missingDOB
    }
}



// Date Information

struct DateOfBirth {
    let day: Int
    let month: Int
    let year: Int
}

let date = Date()
let calendar = Calendar.current
let components = calendar.components([.day , .month], fromDate: date)

let month = components.month
let day = components.day

