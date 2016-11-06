//
//  PassController.swift
//  AmusementParkPassGeneratorPt2
//
//  Created by Bill Merickel on 10/23/16.
//  Copyright © 2016 Bill Merickel. All rights reserved.
//

import UIKit

class PassController: UIViewController {
    
    // Same main data aspects as ViewController
    
    var entrant: Entrant?
    var currentEntrantSelection: EntrantSelection?
    var secondCurrentEntrantSelection: EntrantType?

    // viewDidLoad prepares the UI for the pass and the text box
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createPass()
        firstTestResult.text = ""
        secondTestResult.text = ""
        fourthTestResult.text = ""
        fifthTestResult.text = ""
        
        if let entrant = self.entrant {
            checkForBirthday(entrant)
        }
        
        if let skipRides = entrant?.rideAccess.skipAllLines {
            if skipRides {
                rideLabel.text = "Skip All Rides"
            }
        } else {
            rideLabel.text = ""
        }
        
        if let food = entrant?.discountAccess?.foodDiscount {
            foodLabel.text = "\(food)% Food Discount"
        }
        if let merch = entrant?.discountAccess?.merchandiseDiscount {
            merchLabel.text = "\(merch)% Merchandise Discount"
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Buttons to test the privilages of the entrant (that kinda sounds harsh)
    
    @IBAction func testAreaAccess(_ sender: AnyObject) {
        swipeForAreas(entrant!)
    }
    @IBAction func testRideAccess(_ sender: AnyObject) {
        swipeForRides(entrant!)
    }
    @IBAction func testDiscountAccess(_ sender: AnyObject) {
        swipeForDiscounts(entrant!)
    }
    
    // Connections from the UI
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var entrantTypeLabel: UILabel!
    @IBOutlet weak var rideLabel: UILabel!
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var merchLabel: UILabel!
    @IBOutlet weak var firstTestResult: UILabel!
    @IBOutlet weak var secondTestResult: UILabel!
    @IBOutlet weak var thirdTestResult: UILabel!
    @IBOutlet weak var fourthTestResult: UILabel!
    @IBOutlet weak var fifthTestResult: UILabel!
    
    // The next three function test to see if the entrant can access certain areas (and which ones) of the amusement park. Sounds are also included.
    
    func swipeForRides(_ entrant: Entrant) {
        firstTestResult.text = ""
        secondTestResult.text = ""
        thirdTestResult.text = ""
        fourthTestResult.text = ""
        fifthTestResult.text = ""
        if entrant.accessGranted == true {
            playGrantedSound(grantedSoundURL)
            if entrant.rideAccess.skipAllLines {
                thirdTestResult.text = "Access GRANTED"
                fourthTestResult.text = "Allowed to skip rides"
            } else if entrant.rideAccess.accessAllRides {
                thirdTestResult.text = "Access GRANTED"
            }
        } else {
            playDeniedSound(deniedSoundURL)
            thirdTestResult.text = "Access DENIED"
        }
    }
    
    func swipeForAreas(_ entrant: Entrant) {
        firstTestResult.text = ""
        secondTestResult.text = ""
        thirdTestResult.text = ""
        fourthTestResult.text = ""
        fifthTestResult.text = ""
        if entrant.accessGranted {
            playGrantedSound(grantedSoundURL)
            if entrant.areaAccess.kitchenAreas {
                firstTestResult.text = "Kitchen: GRANTED"
            }
            if entrant.areaAccess.rideControlAreas {
                secondTestResult.text = "Ride Control: GRANTED"
            }
            if entrant.areaAccess.maintainanceAreas {
                thirdTestResult.text = "Maintainence Areas: GRANTED"
            }
            if entrant.areaAccess.amusementAreas {
                fourthTestResult.text = "Amusement Areas: GRANTED"
            }
            if entrant.areaAccess.officeAreas {
                fifthTestResult.text = "Office Areas: GRANTED"
            }
        } else {
            playDeniedSound(deniedSoundURL)
            thirdTestResult.text = "Access: DENIED"
        }
    }
    
    func swipeForDiscounts(_ entrant: Entrant) {
        firstTestResult.text = ""
        secondTestResult.text = ""
        thirdTestResult.text = ""
        fourthTestResult.text = ""
        fifthTestResult.text = ""
        if (entrant.discountAccess) != nil {
            playGrantedSound(grantedSoundURL)
            if let food = entrant.discountAccess?.foodDiscount {
                secondTestResult.text = "\(food)% discount on food"
            }
            if let merch = entrant.discountAccess?.merchandiseDiscount {
                fourthTestResult.text = "\(merch)% discount on merchandise"
            }
        } else {
            playDeniedSound(deniedSoundURL)
            thirdTestResult.text = "Sorry, no discounts."
        }
        
    }
    
    // createPass() creates the visual look of the pass for the entrant.
    
    func createPass() {
        if let firstName = entrant?.information?.firstName, let lastName = entrant?.information?.lastName {
            nameLabel.text = "\(firstName) \(lastName)"
        } else {
            nameLabel.text = ""
        }
        
        if currentEntrantSelection != nil {
            if let entrantType = secondCurrentEntrantSelection {
                if entrantType == .classicGuest {
                    entrantTypeLabel.text = "Classic Guest"
                } else if entrantType == .vipGuest {
                    entrantTypeLabel.text = "VIP Guest"
                } else if entrantType == .freeChildGuest {
                    entrantTypeLabel.text = "Free Child Guest"
                } else if entrantType == .seniorGuest {
                    entrantTypeLabel.text = "Senior Guest"
                } else if entrantType == .seasonPassGuest {
                    entrantTypeLabel.text = "Season Pass Guest"
                } else if entrantType == .foodEmployee {
                    entrantTypeLabel.text = "Food Services Employee"
                } else if entrantType == .rideEmployee {
                    entrantTypeLabel.text = "Ride Services Employee"
                } else if entrantType == .maintainenceEmployee {
                    entrantTypeLabel.text = "Maintainence Employee"
                } else if entrantType == .contract {
                    entrantTypeLabel.text = "Contract Employee"
                } else if entrantType == .manager {
                    entrantTypeLabel.text = "Manager"
                } else if entrantType == .vendor {
                    entrantTypeLabel.text = "Vendor"
                }
            }
        }
    }
    
    // This function checks if the date the user inputs matches the current date (a birthday checker)
    
    func checkForBirthday(_ guest: Entrant) {
        if let dateOfBirth = guest.information?.DOB {
            var array: [String] = dateOfBirth.components(separatedBy: "/")
            if array[0] == "\(month)" && array[1] == "\(day)" {
                firstTestResult.text = "Happy Birthday!!!"
            }
        }
    }
    
    // And finally, dismiss the view controller
    
    @IBAction func createNewPass(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
}
