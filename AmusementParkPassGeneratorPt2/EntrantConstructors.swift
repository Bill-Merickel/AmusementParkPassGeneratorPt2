//
//  EntrantConstructors.swift
//  AmusementParkPassGeneratorPt2
//
//  Created by Bill Merickel on 10/17/16.
//  Copyright © 2016 Bill Merickel. All rights reserved.
//

import Foundation

// The protocol to define any entrant in the park

protocol Entrant {
    var areaAccess: AreaAccess { get set }
    var rideAccess: RideAccess { get set }
    var discountAccess: DiscountAccess? { get set }
    var information: Information? { get set }
    var accessGranted: Bool { get set }
}

// Enums to provide types of Entrants, Project ID's, Vendor Companies, etc.

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

enum EntrantType {
    case classicGuest
    case vipGuest
    case freeChildGuest
    case seniorGuest
    case seasonPassGuest
    case foodEmployee
    case rideEmployee
    case maintainenceEmployee
    case contract
    case manager
    case vendor
}

// Error Enums

enum Errors: Error {
    case missingDOB
    case missingInformation
    case invalidProjectNumber
    case invalidVendorCompany
    case missingEntrantSelection
    case inputsTooShort
}

// Struct to create the characteristics of the entrant

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

// An extension to String to convert a string into a date format (used to check the birthday of guest)

extension String {
    func convertStringToDate(date: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/DD"
        let dateFromString: Date = dateFormatter.date(from: self)!
        return dateFromString
    }
}


