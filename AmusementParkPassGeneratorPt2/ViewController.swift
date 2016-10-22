//
//  ViewController.swift
//  AmusementParkPassGeneratorPt2
//
//  Created by Bill Merickel on 10/13/16.
//  Copyright © 2016 Bill Merickel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var guest = Guest(guestType: .classic, DOB: CustomDate(day: 21, month: 10, year: 2002), information: Information(firstName: nil, lastName: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil))
    
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // There are different swipe methods for different park assets
    func swipeForRides(_ entrant: Entrant) {
        if entrant.accessGranted == true {
            playGrantedSound(grantedSoundURL)
            if entrant.rideAccess.skipAllLines {
                print("Access GRANTED: allowed to skip rides")
            } else {
                print("Access GRANTED")
            }
        } else {
            playDeniedSound(deniedSoundURL)
            print("Access DENIED")
        }
    }
    
    func swipeForAreas(_ entrant: Entrant) {
        if entrant.accessGranted {
            playGrantedSound(grantedSoundURL)
            if entrant.areaAccess.kitchenAreas {
                print("Kitchen: GRANTED")
            }
            if entrant.areaAccess.rideControlAreas {
                print("Ride Control: GRANTED")
            }
            if entrant.areaAccess.maintainanceAreas {
                print("Maintainence Areas: GRANTED")
            }
            if entrant.areaAccess.amusementAreas {
                print("Amusement Areas: GRANTED")
            }
            if entrant.areaAccess.officeAreas {
                print("Office Areas: GRANTED")
            }
        } else {
            playDeniedSound(deniedSoundURL)
            print("Access: DENIED")
        }
    }
    
    func swipeForDiscounts(_ entrant: Entrant) {
        if let discount = entrant.discountAccess {
            playGrantedSound(grantedSoundURL)
            print("\(discount.foodDiscount) discount on food, \(discount.merchandiseDiscount) discount on merchandise.")
        } else {
            playDeniedSound(deniedSoundURL)
            print("Sorry, no discounts.")
        }
        
    }
    
    
}
