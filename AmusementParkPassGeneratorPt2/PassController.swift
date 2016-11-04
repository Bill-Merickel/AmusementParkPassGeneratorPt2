//
//  PassController.swift
//  AmusementParkPassGeneratorPt2
//
//  Created by Bill Merickel on 10/23/16.
//  Copyright © 2016 Bill Merickel. All rights reserved.
//

import UIKit

class PassController: UIViewController {
    
    var entrant: Entrant?

    @IBAction func testAreaAccess(_ sender: AnyObject) {
        swipeForAreas(entrant!)
    }
    @IBAction func testRideAccess(_ sender: AnyObject) {
        swipeForRides(entrant!)
    }
    @IBAction func testDiscountAccess(_ sender: AnyObject) {
        swipeForDiscounts(entrant!)
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var entrantTypeLabel: UILabel!
    @IBOutlet weak var rideLabel: UILabel!
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var merchLabel: UILabel!
    @IBOutlet weak var testResults: UILabel!
    
    func swipeForRides(_ entrant: Entrant) {
        if entrant.accessGranted == true {
            playGrantedSound(grantedSoundURL)
            if entrant.rideAccess.skipAllLines {
                testResults.text = "Access GRANTED: allowed to skip rides"
            } else if entrant.rideAccess.accessAllRides {
                testResults.text = "Access GRANTED"
            }
        } else {
            playDeniedSound(deniedSoundURL)
            testResults.text = "Access DENIED"
        }
    }
    
    func swipeForAreas(_ entrant: Entrant) {
        if entrant.accessGranted {
            playGrantedSound(grantedSoundURL)
            if entrant.areaAccess.kitchenAreas {
                testResults.text = "Kitchen: GRANTED"
            }
            if entrant.areaAccess.rideControlAreas {
                testResults.text = "Ride Control: GRANTED"
            }
            if entrant.areaAccess.maintainanceAreas {
                testResults.text = "Maintainence Areas: GRANTED"
            }
            if entrant.areaAccess.amusementAreas {
                testResults.text = "Amusement Areas: GRANTED"
            }
            if entrant.areaAccess.officeAreas {
                testResults.text = "Office Areas: GRANTED"
            }
        } else {
            playDeniedSound(deniedSoundURL)
            testResults.text = "Access: DENIED"
        }
    }
    
    func swipeForDiscounts(_ entrant: Entrant) {
        if let discount = entrant.discountAccess {
            playGrantedSound(grantedSoundURL)
            testResults.text = "\(discount.foodDiscount) discount on food, \(discount.merchandiseDiscount) discount on merchandise."
        } else {
            playDeniedSound(deniedSoundURL)
            testResults.text = "Sorry, no discounts."
        }
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Second \(entrant?.information?.firstName)")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createNewPass(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
}
