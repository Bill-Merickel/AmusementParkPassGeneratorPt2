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
        switch currentEntrantSelection {
        case .some(.guest): secondCurrentEntrantSelection = GuestType.classic as AnyObject?;
        firstButton.setTitle("Classic", for: .normal); controlDOBTextField(on: false)
        case .some(.employee): secondCurrentEntrantSelection = HourlyEmployeeType.foodServices as AnyObject?
        firstButton.setTitle("Food Services", for: .normal)
        case .some(.manager): secondCurrentEntrantSelection = nil
        case .some(.vendor): secondCurrentEntrantSelection = nil
        case .none: break
        }
    }
    @IBAction func button2(_ sender: AnyObject) {
        switch currentEntrantSelection {
        case .some(.guest): secondCurrentEntrantSelection = GuestType.vip as AnyObject?;
        secondButton.setTitle("VIP", for: .normal)
        case .some(.employee): secondCurrentEntrantSelection = HourlyEmployeeType.rideServices as AnyObject?
        secondButton.setTitle("Ride Services", for: .normal)
        case .some(.manager): secondCurrentEntrantSelection = nil
        case .some(.vendor): secondCurrentEntrantSelection = nil
        case .none: break
        }

    }
    @IBAction func button3(_ sender: AnyObject) {
        switch currentEntrantSelection {
        case .some(.guest): secondCurrentEntrantSelection = GuestType.seniorGuest as AnyObject?;
        thirdButton.setTitle("Senior", for: .normal)
        case .some(.employee): secondCurrentEntrantSelection = HourlyEmployeeType.maintainence as AnyObject?
        thirdButton.setTitle("Maintainence", for: .normal)
        case .some(.manager): secondCurrentEntrantSelection = nil
        case .some(.vendor): secondCurrentEntrantSelection = nil
        case .none: break
        }

    }
    @IBAction func button4(_ sender: AnyObject) {
        switch currentEntrantSelection {
        case .some(.guest): secondCurrentEntrantSelection = GuestType.freeChild as AnyObject?;
        fourthButton.setTitle("Child", for: .normal); controlDOBTextField(on: true)
        case .some(.employee): secondCurrentEntrantSelection = EmployeeType.contract as AnyObject?
        fourthButton.setTitle("Contract", for: .normal)
        case .some(.manager): secondCurrentEntrantSelection = nil
        case .some(.vendor): secondCurrentEntrantSelection = nil
        case .none: break
        }

    }
    @IBAction func button5(_ sender: AnyObject) {
        switch currentEntrantSelection {
        case .some(.guest): secondCurrentEntrantSelection = GuestType.seasonPassGuest as AnyObject?;
        fifthButton.setTitle("Season Pass", for: .normal)
        case .some(.employee): secondCurrentEntrantSelection = nil
        removeFifthButton()
        case .some(.manager): secondCurrentEntrantSelection = nil
        case .some(.vendor): secondCurrentEntrantSelection = nil
        case .none: break
        }
    }
    
    
    var currentEntrantSelection: EntrantSelection?
    var secondCurrentEntrantSelection: AnyObject?

    @IBOutlet weak var dateOfBirthView: UIView!
    
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
        clearButtonTexts()
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
        switch currentEntrantSelection {
        case .some(.guest): firstButton.setTitle("Classic", for: .normal); secondButton.setTitle("VIP", for: .normal); thirdButton.setTitle("Senior", for: .normal); fourthButton.setTitle("Child", for: .normal); fifthButton.setTitle("Season Pass", for: .normal); showFirst4Buttons(); fifthButton.isHidden = false; addFifthButton()
        case .some(.employee): firstButton.setTitle("Food Services", for: .normal); secondButton.setTitle("Ride Services", for: .normal); thirdButton.setTitle("Maintainence", for: .normal); fourthButton.setTitle("Contract", for: .normal); showFirst4Buttons(); removeFifthButton()
        case .some(.manager): firstButton.isHidden = true; secondButton.isHidden = true; thirdButton.isHidden = true; fourthButton.isHidden = true; fifthButton.isHidden = true
        case .some(.vendor): firstButton.isHidden = true; secondButton.isHidden = true; thirdButton.isHidden = true; fourthButton.isHidden = true; fifthButton.isHidden = true
        case .none: break
        }
    }
    
    func showFirst4Buttons() {
        firstButton.isHidden = false
        secondButton.isHidden = false
        thirdButton.isHidden = false
        fourthButton.isHidden = false
    }
    
    func addFifthButton() {
        buttonView.addArrangedSubview(fifthButton)
        fifthButton.isHidden = false
    }
    
    func removeFifthButton() {
        buttonView.removeArrangedSubview(fifthButton)
        fifthButton.isHidden = true
    }
    
    func clearButtonTexts() {
        firstButton.setTitle("", for: .normal)
        secondButton.setTitle("", for: .normal)
        thirdButton.setTitle("", for: .normal)
        fourthButton.setTitle("", for: .normal)
        fifthButton.setTitle("", for: .normal)
    }
    
    func controlDOBTextField(on: Bool) {
        if on == true {
            dateOfBirth.isEnabled = true
            dateOfBirthTextField.isEnabled = true
        } else {
            dateOfBirth.isEnabled = false
            dateOfBirthTextField.isEnabled = false
        }
    }


