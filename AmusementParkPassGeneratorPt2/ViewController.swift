//
//  ViewController.swift
//  AmusementParkPassGeneratorPt2
//
//  Created by Bill Merickel on 10/13/16.
//  Copyright © 2016 Bill Merickel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var entrant: Entrant?
    
    
    @IBAction func guestButton(_ sender: AnyObject) {
        currentEntrantSelection = .guest
        adaptUIFromCurrentSelection()
    }
    @IBAction func employeeButton(_ sender: AnyObject) {
        currentEntrantSelection = .employee
        adaptUIFromCurrentSelection()
    }
    @IBAction func managerButton(_ sender: AnyObject) {
        currentEntrantSelection = .manager
        adaptUIFromCurrentSelection()
    }
    @IBAction func vendorButton(_ sender: AnyObject) {
       currentEntrantSelection = .vendor
       adaptUIFromCurrentSelection()
    }
    
    @IBAction func button1(_ sender: AnyObject) {
        addFifthButton()
    }
    @IBAction func button2(_ sender: AnyObject) {
        removeFifthButton()
    }
    @IBAction func button3(_ sender: AnyObject) {
    }
    @IBAction func button4(_ sender: AnyObject) {
    }
    @IBAction func button5(_ sender: AnyObject) {
    }
    
    
    var currentEntrantSelection: EntrantSelection?
    var secondCurrentEntrantSelection: AnyObject?

    
    @IBOutlet weak var buttonView: UIStackView!
    @IBOutlet weak var guestButton: UIButton!
    @IBOutlet weak var employeeButton: UIButton!
    @IBOutlet weak var managerButton: UIButton!
    @IBOutlet weak var vendorButton: UIButton!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var fifthButton: UIButton!
    @IBOutlet weak var dateOfBirth: UILabel!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var dateOfVisit: UILabel!
    @IBOutlet weak var dateOfVisitTextLabel: UITextField!
    @IBOutlet weak var projectID: UILabel!
    @IBOutlet weak var projectIDTextLabel: UITextField!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var firstNameTextView: UITextField!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var streetAddress: UILabel!
    @IBOutlet weak var streetAddressTextLabel: UITextField!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipCode: UILabel!
    @IBOutlet weak var zipCodeTextField: UITextField!
    
    @IBAction func populateData(_ sender: AnyObject) {
    }
    
    
    
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
    
    func adaptUIFromCurrentSelection() {
        /*switch currentEntrantSelection {
        case .guest: firstButton.titleLabel?.text = "Classic"; secondButton.titleLabel?.text = "VIP"; thirdButton.titleLabel?.text = "Senior"; fourthButton.titleLabel?.text = "Child"; fifthButton.titleLabel?.text = "Season Pass"
        case .employee: firstButton.titleLabel?.text = "Food Services"; secondButton.titleLabel?.text = "Ride Services"; thirdButton.isHidden = true; fourthButton.titleLabel?.text = "Contract"; fifthButton.titleLabel?.text = "Maintanence"
        case .manager: firstButton.isHidden = true; secondButton.isHidden = true; thirdButton.isHidden = true; fourthButton.isHidden = true; fifthButton.isHidden = true
        case .vendor: firstButton.isHidden = true; secondButton.isHidden = true; thirdButton.isHidden = true; fourthButton.isHidden = true; fifthButton.isHidden = true*/
        }
    }
    
    func addFifthButton() {
        self.buttonView.addArrangedSubview(addFifthButton)
        fifthButton.isHidden = false
    }
    
    func removeFifthButton() {
        buttonView.removeArrangedSubview(fifthButton)
        fifthButton.isHidden = true
    }
    
    
}
