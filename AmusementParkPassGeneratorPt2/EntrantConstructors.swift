//
//  EntrantConstructors.swift
//  AmusementParkPassGeneratorPt2
//
//  Created by Bill Merickel on 10/17/16.
//  Copyright © 2016 Bill Merickel. All rights reserved.
//

import Foundation
import UIKit

// Entrant enums

enum GuestType {
    case classic
    case vip
    case freeChild
    case seasonPassGuest
    case seniorGuest
}

enum EmployeeType {
    case foodServices
    case rideServices
    case maintainence
    case contract
}

enum VendorCompany: String {
    case Acme
    case Orkin
    case Fedex
    case NWElectrical
}

enum ProjectID: String {
    case AAA1
    case AAA2
    case AAA3
    case BBB1
    case BBB2
}

enum EntrantSelection {
    case guest
    case employee
    case manager
    case vendor
}

// Errors

enum Errors: Error {
    case missingDOB
    case missingInformation
    case invalidProjectNumber
    case invalidVendorCompany
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
    var accessAllRides: Bool
    var skipAllLines: Bool
}

struct DiscountAccess {
    var foodDiscount: Int?
    var merchandiseDiscount: Int?
}

struct Information {
    var firstName: String?
    var lastName: String?
    var DOB: String?
    var DOV: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: String?
    
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?) {
        self.firstName = firstName
        self.lastName = lastName
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
}





// Protocols

protocol Entrant {
    var areaAccess: AreaAccess { get set }
    var rideAccess: RideAccess { get set }
    var discountAccess: DiscountAccess? { get set }
    var information: Information? { get set }
    var accessGranted: Bool { get set }
}
