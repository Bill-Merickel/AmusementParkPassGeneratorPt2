//
//  EntrantModel.swift
//  AmusementParkPassGeneratorPt2
//
//  Created by Bill Merickel on 10/13/16.
//  Copyright © 2016 Bill Merickel. All rights reserved.
//

import Foundation
import UIKit

// Entrant Types

class Guest: Entrant {
    var areaAccess: AreaAccess
    var rideAccess: RideAccess
    var discountAccess: DiscountAccess?
    var information: Information?
    var guestType: GuestType
    var accessGranted: Bool = true
    
    init(guestType: GuestType, DOB: CustomDate, information: Information) {
        self.guestType = guestType
        switch guestType {
        case .vip: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: false, maintainanceAreas: false, officeAreas: false); self.rideAccess = RideAccess(accessAllRides: true, skipAllLines: false); self.discountAccess = DiscountAccess(foodDiscount: 10, merchandiseDiscount: 20); self.information = nil
        case .classic: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: false, maintainanceAreas: false, officeAreas: false); self.rideAccess = RideAccess(accessAllRides: true, skipAllLines: false); self.discountAccess = nil; self.information = nil
        case .freeChild: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: false, maintainanceAreas: false, officeAreas: false); self.rideAccess = RideAccess(accessAllRides: true, skipAllLines: false); self.discountAccess = nil; self.information = Information(firstName: nil, lastName: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil)
        case .seniorGuest: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: false, maintainanceAreas: false, officeAreas: false); self.rideAccess = RideAccess(accessAllRides: true, skipAllLines: true); self.discountAccess = DiscountAccess(foodDiscount: 10, merchandiseDiscount: 10); self.information = information
        case .seasonPassGuest: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: false, maintainanceAreas: false, officeAreas: false); self.rideAccess = RideAccess(accessAllRides: true, skipAllLines: true); self.discountAccess = DiscountAccess(foodDiscount: 10, merchandiseDiscount: 20); self.information = information
        }
    }
    
    
    // Class function that checks if it's your birthday
    
    func checkForBirthday(_ guest: Entrant) {
        if let dateOfBirth = guest.information?.DOB {
            if dateOfBirth.day == day && dateOfBirth.month == month {
                print("Happy Birthday!! I hope you have a fantastic day at the park!")
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
    
    init(employeeType: HourlyEmployeeType, information: Information) {
        self.employeeType = employeeType
        switch employeeType {
        case .foodServices: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: false, maintainanceAreas: false, officeAreas: false); self.rideAccess = RideAccess(accessAllRides: true, skipAllLines: false); self.discountAccess = DiscountAccess(foodDiscount: 15, merchandiseDiscount: 25); self.information = information
            
        case .rideServices: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: true, maintainanceAreas: true, officeAreas: false); self.rideAccess = RideAccess(accessAllRides: true, skipAllLines: false); self.discountAccess = DiscountAccess(foodDiscount: 15, merchandiseDiscount: 25); self.information = information
            
        case .maintainence: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: false, maintainanceAreas: true, officeAreas: false); self.rideAccess = RideAccess(accessAllRides: true, skipAllLines: false); self.discountAccess = DiscountAccess(foodDiscount: 15, merchandiseDiscount: 25); self.information = information
            
        }
    }
}



class Manager: Entrant {
    var areaAccess: AreaAccess = AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: true, maintainanceAreas: true, officeAreas: true)
    var rideAccess: RideAccess = RideAccess(accessAllRides: true, skipAllLines: true)
    var discountAccess: DiscountAccess? = DiscountAccess(foodDiscount: 15, merchandiseDiscount: 25)
    var information: Information?
    var accessGranted: Bool = true
    
    init(information: Information) {
        self.information = information
    }
}

class ContractEmployee: Entrant {
    var areaAccess: AreaAccess
    var rideAccess: RideAccess
    let discountAccess: DiscountAccess? = nil
    var information: Information?
    var projectNumber:  ProjectID
    var accessGranted: Bool = true
    
    init(projectNumber: ProjectID, information: Information) throws {
        self.information = information
        self.projectNumber = projectNumber
        switch projectNumber {
        case .AAA1: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: true, maintainanceAreas: true, officeAreas: true); self.rideAccess = RideAccess(accessAllRides: false, skipAllLines: false)
        case .AAA2: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: true, maintainanceAreas: true, officeAreas: true); self.rideAccess = RideAccess(accessAllRides: false, skipAllLines: false)
        case .AAA3: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: true, maintainanceAreas: true, officeAreas: true); self.rideAccess = RideAccess(accessAllRides: false, skipAllLines: false)
        case .BBB1: self.areaAccess = AreaAccess(amusementAreas: false, kitchenAreas: false, rideControlAreas: false, maintainanceAreas: false, officeAreas: true); self.rideAccess = RideAccess(accessAllRides: false, skipAllLines: false)
        case .BBB2: self.areaAccess = AreaAccess(amusementAreas: false, kitchenAreas: true, rideControlAreas: false, maintainanceAreas: true, officeAreas: false); self.rideAccess = RideAccess(accessAllRides: false, skipAllLines: false)
        }
    }
}

class Vendor: Entrant {
    var accessGranted: Bool = true
    var rideAccess: RideAccess
    var areaAccess: AreaAccess
    let discountAccess: DiscountAccess? = nil
    var information: Information?
    var vendorCompany: VendorCompany
    
    init(vendor: VendorCompany, information: Information) throws {
        self.information = information
        self.vendorCompany = vendor
        switch vendor {
        case .acme: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: true, maintainanceAreas: true, officeAreas: true); self.rideAccess = RideAccess(accessAllRides: false, skipAllLines: false)
        case .orkin: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: true, maintainanceAreas: false, officeAreas: false); self.rideAccess = RideAccess(accessAllRides: false, skipAllLines: false)
        case .fedex: self.areaAccess = AreaAccess(amusementAreas: false, kitchenAreas: false, rideControlAreas: false, maintainanceAreas: true, officeAreas: true); self.rideAccess = RideAccess(accessAllRides: false, skipAllLines: false)
        case .nwElectrical: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: true, maintainanceAreas: true, officeAreas: true); self.rideAccess = RideAccess(accessAllRides: false, skipAllLines: false)
        }
    }
}



// Checks the DOB property and throws and an error if missing

func checkForDate(guest: Guest) throws {
    if guest.guestType == .freeChild {
        if guest.information?.DOB == nil {
            throw Errors.missingDOB
        }
    }
}

func checkForInformation(_ guest: Guest) throws {
    if guest.information == nil {
        throw Errors.missingInformation
    }
}

