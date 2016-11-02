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
    
    init(guestType: GuestType, DOB: String, information: Information) throws {
        self.guestType = guestType
        switch guestType {
        case .vip: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: false, maintainanceAreas: false, officeAreas: false); self.rideAccess = RideAccess(accessAllRides: true, skipAllLines: false); self.discountAccess = DiscountAccess(foodDiscount: 10, merchandiseDiscount: 20); self.information = nil
        case .classic: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: false, maintainanceAreas: false, officeAreas: false); self.rideAccess = RideAccess(accessAllRides: true, skipAllLines: false); self.discountAccess = nil; self.information = nil
        case .freeChild: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: false, maintainanceAreas: false, officeAreas: false); self.rideAccess = RideAccess(accessAllRides: true, skipAllLines: false); self.discountAccess = nil; self.information = Information(firstName: nil, lastName: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil); self.information?.DOB = DOB
            if DOB == "" {
                throw Errors.missingDOB
            }
        case .seniorGuest: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: false, maintainanceAreas: false, officeAreas: false); self.rideAccess = RideAccess(accessAllRides: true, skipAllLines: true); self.discountAccess = DiscountAccess(foodDiscount: 10, merchandiseDiscount: 10); self.information = information; self.information!.DOB = DOB
        case .seasonPassGuest: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: false, maintainanceAreas: false, officeAreas: false); self.rideAccess = RideAccess(accessAllRides: true, skipAllLines: true); self.discountAccess = DiscountAccess(foodDiscount: 10, merchandiseDiscount: 20); self.information = information
        }
    }
    
    
    // Class function that checks if it's your birthday
    
    /* func checkForBirthday(_ guest: Entrant) {
        if let dateOfBirth = guest.information?.DOB {
            if dateOfBirth.day == day && dateOfBirth.month == month {
                print("Happy Birthday!! I hope you have a fantastic day at the park!")
            }
        }
    }*/
}

class Employee: Entrant {
    var areaAccess: AreaAccess
    var rideAccess: RideAccess
    var discountAccess: DiscountAccess?
    var information: Information?
    var employeeType: EmployeeType
    var accessGranted: Bool = true
    var projectID: ProjectID
    
    init(employeeType: EmployeeType, information: Information, projectID: String?) throws {
        self.employeeType = employeeType
        
        switch employeeType {
        case .foodServices: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: false, maintainanceAreas: false, officeAreas: false); self.rideAccess = RideAccess(accessAllRides: true, skipAllLines: false); self.discountAccess = DiscountAccess(foodDiscount: 15, merchandiseDiscount: 25); self.information = information
        case .rideServices: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: true, maintainanceAreas: true, officeAreas: false); self.rideAccess = RideAccess(accessAllRides: true, skipAllLines: false); self.discountAccess = DiscountAccess(foodDiscount: 15, merchandiseDiscount: 25); self.information = information
        case .maintainence: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: false, maintainanceAreas: true, officeAreas: false); self.rideAccess = RideAccess(accessAllRides: true, skipAllLines: false); self.discountAccess = DiscountAccess(foodDiscount: 15, merchandiseDiscount: 25); self.information = information
        case .contract:
        if projectID == ProjectID.AAA1.rawValue {
            self.projectID = ProjectID.AAA1
        } else if projectID == ProjectID.AAA2.rawValue {
            self.projectID = ProjectID.AAA2
        } else if projectID == ProjectID.AAA3.rawValue {
            self.projectID = ProjectID.AAA3
        } else if projectID == ProjectID.BBB1.rawValue {
            self.projectID = ProjectID.BBB1
        } else if projectID == ProjectID.BBB2.rawValue {
            self.projectID = ProjectID.BBB2
        } else {
            throw Errors.invalidProjectNumber
        }
        self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: false, maintainanceAreas: true, officeAreas: false); self.rideAccess = RideAccess(accessAllRides: true, skipAllLines: false); self.discountAccess = nil; self.information = information

            
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

class Vendor: Entrant {
    var discountAccess: DiscountAccess? = nil
    var accessGranted: Bool = true
    var rideAccess: RideAccess
    var areaAccess: AreaAccess
    var information: Information?
    var vendorCompany: VendorCompany
    
    init(vendor: String, firstName: String, lastName: String, DOB: String, DOV: String) throws {
        self.information = Information(firstName: firstName, lastName: lastName, streetAddress: nil, city: nil, state: nil, zipCode: nil)
        self.information?.DOB = DOB
        self.information?.DOV = DOV
        switch vendor {
        case VendorCompany.Acme.rawValue: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: true, maintainanceAreas: true, officeAreas: true); self.rideAccess = RideAccess(accessAllRides: false, skipAllLines: false)
        case VendorCompany.Orkin.rawValue: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: true, maintainanceAreas: false, officeAreas: false); self.rideAccess = RideAccess(accessAllRides: false, skipAllLines: false)
        case VendorCompany.Fedex.rawValue: self.areaAccess = AreaAccess(amusementAreas: false, kitchenAreas: false, rideControlAreas: false, maintainanceAreas: true, officeAreas: true); self.rideAccess = RideAccess(accessAllRides: false, skipAllLines: false)
        case VendorCompany.NWElectrical.rawValue: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: true, maintainanceAreas: true, officeAreas: true); self.rideAccess = RideAccess(accessAllRides: false, skipAllLines: false)
        default: throw Errors.invalidVendorCompany
        }
        
        if firstName == "" || lastName == "" || DOB == "" || DOV == "" {
            throw Errors.missingInformation
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

