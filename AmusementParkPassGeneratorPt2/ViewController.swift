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
        adaptUIFromCurrentSelection(); disableAllTextFields()
    }
    @IBAction func employeeButton(_ sender: AnyObject) {
        currentEntrantSelection = .employee
        adaptUIFromCurrentSelection(); disableAllTextFields()
    }
    @IBAction func managerButton(_ sender: AnyObject) {
        currentEntrantSelection = .manager
        adaptUIFromCurrentSelection(); disableAllTextFields(); controlFirstNameTextField(on: true); controlLastNameTextField(on: true); controlFullAddressTextFields(on: true)
    }
    @IBAction func vendorButton(_ sender: AnyObject) {
       currentEntrantSelection = .vendor
       adaptUIFromCurrentSelection(); disableAllTextFields(); controlDOVTextField(on: true)
    }
    
    @IBAction func button1(_ sender: AnyObject) {
        switch currentEntrantSelection {
        case .some(.guest): secondCurrentEntrantSelection = GuestType.classic as AnyObject?;
        firstButton.setTitle("Classic", for: .normal); disableAllTextFields()
        case .some(.employee): secondCurrentEntrantSelection = EmployeeType.foodServices as AnyObject?
        firstButton.setTitle("Food Services", for: .normal); disableAllTextFields(); controlFirstNameTextField(on: true); controlLastNameTextField(on: true); controlFullAddressTextFields(on: true)
        case .some(.manager): secondCurrentEntrantSelection = nil; disableAllTextFields(); controlFirstNameTextField(on: true); controlLastNameTextField(on: true); controlFullAddressTextFields(on: true)
        case .some(.vendor): secondCurrentEntrantSelection = nil; disableAllTextFields(); controlCompanyTextField(on: true)
        case .none: break
        }
    }
    @IBAction func button2(_ sender: AnyObject) {
        switch currentEntrantSelection {
        case .some(.guest): secondCurrentEntrantSelection = GuestType.vip as AnyObject?;
        secondButton.setTitle("VIP", for: .normal); disableAllTextFields()
        case .some(.employee): secondCurrentEntrantSelection = EmployeeType.rideServices as AnyObject?
        secondButton.setTitle("Ride Services", for: .normal); disableAllTextFields(); controlFirstNameTextField(on: true); controlLastNameTextField(on: true); controlFullAddressTextFields(on: true)
        case .some(.manager): secondCurrentEntrantSelection = nil; disableAllTextFields(); controlFirstNameTextField(on: true); controlLastNameTextField(on: true); controlFullAddressTextFields(on: true)
        case .some(.vendor): secondCurrentEntrantSelection = nil; disableAllTextFields(); controlCompanyTextField(on: true)
        case .none: break
        }

    }
    @IBAction func button3(_ sender: AnyObject) {
        switch currentEntrantSelection {
        case .some(.guest): secondCurrentEntrantSelection = GuestType.seniorGuest as AnyObject?;
        thirdButton.setTitle("Senior", for: .normal); disableAllTextFields(); controlFirstNameTextField(on: true); controlLastNameTextField(on: true); controlDOBTextField(on: true)
        case .some(.employee): secondCurrentEntrantSelection = EmployeeType.maintainence as AnyObject?
        thirdButton.setTitle("Maintainence", for: .normal); disableAllTextFields(); controlFirstNameTextField(on: true); controlLastNameTextField(on: true); controlFullAddressTextFields(on: true)
        case .some(.manager): secondCurrentEntrantSelection = nil; disableAllTextFields(); controlFirstNameTextField(on: true); controlLastNameTextField(on: true); controlFullAddressTextFields(on: true)
        case .some(.vendor): secondCurrentEntrantSelection = nil; disableAllTextFields(); controlCompanyTextField(on: true)
        case .none: break
        }

    }
    @IBAction func button4(_ sender: AnyObject) {
        switch currentEntrantSelection {
        case .some(.guest): secondCurrentEntrantSelection = GuestType.freeChild as AnyObject?;
        fourthButton.setTitle("Child", for: .normal); disableAllTextFields(); controlDOBTextField(on: true)
        case .some(.employee): secondCurrentEntrantSelection = EmployeeType.contract as AnyObject?
        fourthButton.setTitle("Contract", for: .normal); disableAllTextFields(); controlFirstNameTextField(on: true); controlLastNameTextField(on: true); controlFullAddressTextFields(on: true); controlProjectIDTextField(on: true)
        case .some(.manager): secondCurrentEntrantSelection = nil; disableAllTextFields(); controlFirstNameTextField(on: true); controlLastNameTextField(on: true); controlFullAddressTextFields(on: true)
        case .some(.vendor): secondCurrentEntrantSelection = nil; disableAllTextFields(); controlCompanyTextField(on: true)
        case .none: break
        }

    }
    @IBAction func button5(_ sender: AnyObject) {
        switch currentEntrantSelection {
        case .some(.guest): secondCurrentEntrantSelection = GuestType.seasonPassGuest as AnyObject?;
        fifthButton.setTitle("Season Pass", for: .normal); disableAllTextFields(); controlFirstNameTextField(on: true); controlLastNameTextField(on: true); controlFullAddressTextFields(on: true)
        case .some(.employee): secondCurrentEntrantSelection = nil
        removeFifthButton()
        case .some(.manager): secondCurrentEntrantSelection = nil; disableAllTextFields(); controlFirstNameTextField(on: true); controlLastNameTextField(on: true); controlFullAddressTextFields(on: true)
        case .some(.vendor): secondCurrentEntrantSelection = nil; disableAllTextFields(); controlCompanyTextField(on: true)
        case .none: break
        }
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
    
    @IBAction func generatePass(_ sender: Any) {
        initEntrant()
        print("First \(entrant?.information?.firstName)")
    }
    
    @IBAction func populateData(_ sender: AnyObject) {
        firstNameTextView.text = "John"
        lastNameTextField.text = "Smith"
        dateOfBirthTextField.text = "1/25/90"
        dateOfVisitTextLabel.text = "9/30/16"
        projectIDTextLabel.text = "AAA1"
        companyTextField.text = "Fedex"
        streetAddressTextLabel.text = "1234 Main Street"
        cityTextField.text = "Los Angeles"
        stateTextField.text = "California"
        zipCodeTextField.text = "12345"
    }
    
    func initEntrant() {
            switch currentEntrantSelection {
            case .some(.guest): do {
                try entrant = Guest(guestType: secondCurrentEntrantSelection as! GuestType, DOB: (dateOfBirthTextField.text!), information: Information(firstName: firstNameTextView.text!, lastName: lastNameTextField.text!, streetAddress: streetAddressTextLabel.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text))
            } catch Errors.missingDOB {
                showAlert(title: "Missing Date of Birth", message: "All Free Child entrants must have a date of birth!")
            } catch _ {
                fatalError()
                }
            case .some(.employee): do {
                try entrant = Employee(employeeType: secondCurrentEntrantSelection as! EmployeeType, information: Information(firstName: firstNameTextView.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextLabel.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text), projectID: projectIDTextLabel.text)
            } catch Errors.invalidProjectNumber {
                showAlert(title: "Invalid Project ID", message: "The project ID you entered isn't valid.")
            } catch Errors.missingInformation {
                showAlert(title: "Missing Information", message: "Select an entrant to create a pass for.")
            } catch _ {
                fatalError()
                }
            case .some(.manager): entrant = Manager(information: Information(firstName: firstNameTextView.text!, lastName: lastNameTextField.text!, streetAddress: streetAddressTextLabel.text!, city: cityTextField.text!, state: stateTextField.text!, zipCode: zipCodeTextField.text!))
            case .some(.vendor): do {
                try entrant = Vendor(vendor: companyTextField.text!, firstName: firstNameTextView.text!, lastName: lastNameTextField.text!, DOB: dateOfBirthTextField.text!, DOV: dateOfVisitTextLabel.text!)
            } catch Errors.missingInformation {
                showAlert(title: "Missing Information", message: "Not all required fields have information!")
            } catch _ {
                fatalError()
                }
            case .none: showAlert(title: "No Entrant Selected", message: "Select an entrant to create a pass for.")
            }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainController" {
            if let destinationVC = segue.destination as? PassController {
                if let entrant = self.entrant {
                    destinationVC.entrant = entrant
                }
            }
        }
    }
    
    // There are different swipe methods for different park assets
        
    func adaptUIFromCurrentSelection() {
        switch currentEntrantSelection {
        case .some(.guest): firstButton.setTitle("Classic", for: .normal); secondButton.setTitle("VIP", for: .normal); thirdButton.setTitle("Senior", for: .normal); fourthButton.setTitle("Child", for: .normal); fifthButton.setTitle("Season Pass", for: .normal); showFirst4Buttons(); fifthButton.isHidden = false; addFifthButton()
        case .some(.employee): firstButton.setTitle("Food Services", for: .normal); secondButton.setTitle("Ride Services", for: .normal); thirdButton.setTitle("Maintainence", for: .normal); fourthButton.setTitle("Contract", for: .normal); showFirst4Buttons(); removeFifthButton()
        case .some(.manager): firstButton.isHidden = true; secondButton.isHidden = true; thirdButton.isHidden = true; fourthButton.isHidden = true; fifthButton.isHidden = true
        case .some(.vendor): firstButton.isHidden = true; secondButton.isHidden = true; thirdButton.isHidden = true; fourthButton.isHidden = true; fifthButton.isHidden = true
        case .none: break
        }
    }
    
    func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
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
    
    func controlDOVTextField(on: Bool) {
        if on == true {
            dateOfVisit.isEnabled = true
            dateOfVisitTextLabel.isEnabled = true
        } else {
            dateOfVisit.isEnabled = false
            dateOfVisitTextLabel.isEnabled = false
        }
    }
    
    func controlProjectIDTextField(on: Bool) {
        if on == true {
            projectID.isEnabled = true
            projectIDTextLabel.isEnabled = true
        } else {
            projectID.isEnabled = false
            projectIDTextLabel.isEnabled = false
        }
    }
    
    func controlCompanyTextField(on: Bool) {
        if on == true {
            company.isEnabled = true
            companyTextField.isEnabled = true
        } else {
            company.isEnabled = false
            companyTextField.isEnabled = false
        }
    }
    
    func controlFirstNameTextField(on: Bool) {
        if on == true {
            firstName.isEnabled = true
            firstNameTextView.isEnabled = true
        } else {
            firstName.isEnabled = false
            firstNameTextView.isEnabled = false
        }
    }
    
    func controlLastNameTextField(on: Bool) {
        if on == true {
            lastName.isEnabled = true
            lastNameTextField.isEnabled = true
        } else {
            lastName.isEnabled = false
            lastNameTextField.isEnabled = false
        }
    }
    
    func controlFullAddressTextFields(on: Bool) {
        if on == true {
            streetAddress.isEnabled = true
            streetAddressTextLabel.isEnabled = true
            city.isEnabled = true
            cityTextField.isEnabled = true
            state.isEnabled = true
            stateTextField.isEnabled = true
            zipCode.isEnabled = true
            zipCodeTextField.isEnabled = true
        } else {
            streetAddress.isEnabled = false
            streetAddressTextLabel.isEnabled = false
            city.isEnabled = false
            cityTextField.isEnabled = false
            state.isEnabled = false
            stateTextField.isEnabled = false
            zipCode.isEnabled = false
            zipCodeTextField.isEnabled = false
        }
    }
    
    func disableAllTextFields() {
        dateOfBirth.isEnabled = false
        dateOfBirthTextField.isEnabled = false
        dateOfVisit.isEnabled = false
        dateOfVisitTextLabel.isEnabled = false
        projectID.isEnabled = false
        projectIDTextLabel.isEnabled = false
        firstName.isEnabled = false
        firstNameTextView.isEnabled = false
        lastName.isEnabled = false
        lastNameTextField.isEnabled = false
        streetAddress.isEnabled = false
        streetAddressTextLabel.isEnabled = false
        city.isEnabled = false
        cityTextField.isEnabled = false
        state.isEnabled = false
        stateTextField.isEnabled = false
        zipCode.isEnabled = false
        zipCodeTextField.isEnabled = false
    }
}
