//
//  ViewController.swift
//  AmusementParkPassGeneratorPt2
//
//  Created by Bill Merickel on 10/13/16.
//  Copyright © 2016 Bill Merickel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /* NOTE: A few things I want to point out about this project.
    First things first, I changed the SSN text field to Date of Visit, becuase there was no implemention of SSN's but there was a Date of Visit that had no text field. I thought this was logical.
    Second, there are no example entrants in my code because there is no way the user can interact with them without giving major changes to the app. I thought about this for a while, and I came to the desicion that not implementing them would be logical also.
    Lastly, I had a great time with this project. It took me countless to work on, but I truly gained from this. Thank you Treehouse!
    OK, I'm done now, please continue :)
     */
    
    // This is the entrant that the administer will control throughout the app
    var entrant: Entrant?
    
    // And these variables describe the type of entrant that is selected
    var currentEntrantSelection: EntrantSelection?
    var secondCurrentEntrantSelection: EntrantType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearButtonTexts()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Transfer important data from this view controller to PassController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainController" {
            if let destinationVC = segue.destination as? PassController {
                destinationVC.entrant = entrant
                destinationVC.currentEntrantSelection = currentEntrantSelection
                destinationVC.secondCurrentEntrantSelection = secondCurrentEntrantSelection
            }
        }
    }
    
    // The UI Buttons a (at the top of the app) used to customize the app
    
    @IBAction func guestButton(_ sender: AnyObject) {
        currentEntrantSelection = .guest
        deleteText()
        adaptUIFromCurrentSelection(); disableAllTextFields()
    }
    @IBAction func employeeButton(_ sender: AnyObject) {
        currentEntrantSelection = .employee
        deleteText()
        adaptUIFromCurrentSelection(); disableAllTextFields()
    }
    @IBAction func managerButton(_ sender: AnyObject) {
        currentEntrantSelection = .manager
        deleteText()
        adaptUIFromCurrentSelection(); disableAllTextFields(); controlFirstNameTextField(on: true); controlLastNameTextField(on: true); controlFullAddressTextFields(on: true)
    }
    @IBAction func vendorButton(_ sender: AnyObject) {
        currentEntrantSelection = .vendor
        deleteText()
        adaptUIFromCurrentSelection(); disableAllTextFields(); controlDOVTextField(on: true)
    }
    
    // When a button to determine what type of entrant (in detail is chosen) is selected, it will look at what type of entrant is suggested to change the buttons according to the type. It will also enable/disable the text fields based on what is required.
    
    @IBAction func button1(_ sender: AnyObject) {
        deleteText()
        switch currentEntrantSelection {
        case .some(.guest): secondCurrentEntrantSelection = .classicGuest
        firstButton.setTitle("Classic", for: .normal); disableAllTextFields()
        case .some(.employee): secondCurrentEntrantSelection = .foodEmployee
        firstButton.setTitle("Food Services", for: .normal); disableAllTextFields(); controlFirstNameTextField(on: true); controlLastNameTextField(on: true); controlFullAddressTextFields(on: true)
        case .some(.manager): secondCurrentEntrantSelection = nil; disableAllTextFields(); controlFirstNameTextField(on: true); controlLastNameTextField(on: true); controlFullAddressTextFields(on: true)
        case .some(.vendor): secondCurrentEntrantSelection = nil; disableAllTextFields(); controlCompanyTextField(on: true)
        case .none: break
        }
    }
    @IBAction func button2(_ sender: AnyObject) {
        deleteText()
        switch currentEntrantSelection {
        case .some(.guest): secondCurrentEntrantSelection = .vipGuest
        secondButton.setTitle("VIP", for: .normal); disableAllTextFields()
        case .some(.employee): secondCurrentEntrantSelection = .rideEmployee
        secondButton.setTitle("Ride Services", for: .normal); disableAllTextFields(); controlFirstNameTextField(on: true); controlLastNameTextField(on: true); controlFullAddressTextFields(on: true)
            secondCurrentEntrantSelection = .rideEmployee
        case .some(.manager): secondCurrentEntrantSelection = nil; disableAllTextFields(); controlFirstNameTextField(on: true); controlLastNameTextField(on: true); controlFullAddressTextFields(on: true)
        case .some(.vendor): secondCurrentEntrantSelection = nil; disableAllTextFields(); controlCompanyTextField(on: true)
        case .none: break
        }
        
    }
    @IBAction func button3(_ sender: AnyObject) {
        deleteText()
        switch currentEntrantSelection {
        case .some(.guest): secondCurrentEntrantSelection = .seniorGuest
        thirdButton.setTitle("Senior", for: .normal); disableAllTextFields(); controlFirstNameTextField(on: true); controlLastNameTextField(on: true); controlDOBTextField(on: true)
        case .some(.employee): secondCurrentEntrantSelection = .maintainenceEmployee
        thirdButton.setTitle("Maintainence", for: .normal); disableAllTextFields(); controlFirstNameTextField(on: true); controlLastNameTextField(on: true); controlFullAddressTextFields(on: true)
        case .some(.manager): secondCurrentEntrantSelection = nil; disableAllTextFields(); controlFirstNameTextField(on: true); controlLastNameTextField(on: true); controlFullAddressTextFields(on: true)
        case .some(.vendor): secondCurrentEntrantSelection = nil; disableAllTextFields(); controlCompanyTextField(on: true)
        case .none: break
        }
        
    }
    @IBAction func button4(_ sender: AnyObject) {
        deleteText()
        switch currentEntrantSelection {
        case .some(.guest): secondCurrentEntrantSelection = .freeChildGuest
        fourthButton.setTitle("Child", for: .normal); disableAllTextFields(); controlDOBTextField(on: true)
        case .some(.employee): secondCurrentEntrantSelection = .contract
        fourthButton.setTitle("Contract", for: .normal); disableAllTextFields(); controlFirstNameTextField(on: true); controlLastNameTextField(on: true); controlFullAddressTextFields(on: true); controlProjectIDTextField(on: true)
        case .some(.manager): secondCurrentEntrantSelection = nil; disableAllTextFields(); controlFirstNameTextField(on: true); controlLastNameTextField(on: true); controlFullAddressTextFields(on: true)
        case .some(.vendor): secondCurrentEntrantSelection = nil; disableAllTextFields(); controlCompanyTextField(on: true)
        case .none: break
        }
        
    }
    @IBAction func button5(_ sender: AnyObject) {
        deleteText()
        switch currentEntrantSelection {
        case .some(.guest): secondCurrentEntrantSelection = .seasonPassGuest
        fifthButton.setTitle("Season Pass", for: .normal); disableAllTextFields(); controlFirstNameTextField(on: true); controlLastNameTextField(on: true); controlFullAddressTextFields(on: true)
        case .some(.employee): secondCurrentEntrantSelection = nil
        removeFifthButton()
        case .some(.manager): secondCurrentEntrantSelection = nil; disableAllTextFields(); controlFirstNameTextField(on: true); controlLastNameTextField(on: true); controlFullAddressTextFields(on: true)
        case .some(.vendor): secondCurrentEntrantSelection = nil; disableAllTextFields(); controlCompanyTextField(on: true)
        case .none: break
        }
    }
    
    // The (too long) list of all connections from the UI
    
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
    }
    
    @IBAction func populateData(_ sender: AnyObject) {
        if firstNameTextView.isEnabled {
            firstNameTextView.text = "William"
        }
        if lastNameTextField.isEnabled {
            lastNameTextField.text = "Johnson"
        }
        if dateOfBirthTextField.isEnabled {
            dateOfBirthTextField.text = "1/25/90"
        }
        if dateOfVisitTextLabel.isEnabled {
            dateOfVisitTextLabel.text = "11/2/16"
        }
        if projectIDTextLabel.isEnabled {
            projectIDTextLabel.text = "AAA1"
        }
        if streetAddressTextLabel.isEnabled {
            streetAddressTextLabel.text = "1234 Main Street"
        }
        if companyTextField.isEnabled {
            companyTextField.text = "Fedex"
        }
        if cityTextField.isEnabled {
            cityTextField.text = "Seattle"
        }
        if stateTextField.isEnabled {
            stateTextField.text = "Washington"
        }
        if zipCodeTextField.isEnabled {
            zipCodeTextField.text = "12345"
        }
    }
    
    // This is a crazy initializer for the entrant that will look at the type of entrant and inputs from the text field and calculate the entrant's data. This will also search for errors and show alerts if found.
    
    func initEntrant() {
        switch currentEntrantSelection {
        case .some(.guest): do {
            if secondCurrentEntrantSelection == .classicGuest {
                try entrant = Guest(guestType: .classic, DOB: (dateOfBirthTextField.text!), information: Information(firstName: firstNameTextView.text!, lastName: lastNameTextField.text!, streetAddress: streetAddressTextLabel.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text))
            } else if secondCurrentEntrantSelection == .vipGuest {
                try entrant = Guest(guestType: .vip, DOB: (dateOfBirthTextField.text!), information: Information(firstName: firstNameTextView.text!, lastName: lastNameTextField.text!, streetAddress: streetAddressTextLabel.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text))
            } else if secondCurrentEntrantSelection == .freeChildGuest {
                try entrant = Guest(guestType: .freeChild, DOB: (dateOfBirthTextField.text!), information: Information(firstName: firstNameTextView.text!, lastName: lastNameTextField.text!, streetAddress: streetAddressTextLabel.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text))
            } else if secondCurrentEntrantSelection == .seasonPassGuest {
                try entrant = Guest(guestType: .seasonPassGuest, DOB: (dateOfBirthTextField.text!), information: Information(firstName: firstNameTextView.text!, lastName: lastNameTextField.text!, streetAddress: streetAddressTextLabel.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text))
            } else if secondCurrentEntrantSelection == .seniorGuest {
                try entrant = Guest(guestType: .seniorGuest, DOB: (dateOfBirthTextField.text!), information: Information(firstName: firstNameTextView.text!, lastName: lastNameTextField.text!, streetAddress: streetAddressTextLabel.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text))
            }
        } catch Errors.missingDOB {
            showAlert(title: "Missing Date of Birth", message: "All Free Child entrants must have a date of birth!")
        } catch _ {
            fatalError()
            }
        case .some(.employee): do {
            if secondCurrentEntrantSelection == .foodEmployee {
                try entrant = Employee(employeeType: .foodServices, information: Information(firstName: firstNameTextView.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextLabel.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text), projectID: projectIDTextLabel.text)
            } else if secondCurrentEntrantSelection == .rideEmployee {
                try entrant = Employee(employeeType: .rideServices, information: Information(firstName: firstNameTextView.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextLabel.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text), projectID: projectIDTextLabel.text)
            } else if secondCurrentEntrantSelection == .maintainenceEmployee {
                try entrant = Employee(employeeType: .maintainence, information: Information(firstName: firstNameTextView.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextLabel.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text), projectID: projectIDTextLabel.text)
            } else if secondCurrentEntrantSelection == .contract {
                try entrant = Employee(employeeType: .contract, information: Information(firstName: firstNameTextView.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextLabel.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text), projectID: projectIDTextLabel.text)
            }
        } catch Errors.invalidProjectNumber {
            showAlert(title: "Invalid Project ID", message: "The project ID you entered isn't valid.")
        } catch Errors.missingInformation {
            showAlert(title: "Missing Information", message: "Select an entrant to create a pass for.")
        } catch _ {
            fatalError()
            }
        case .some(.manager): do {
            secondCurrentEntrantSelection = .manager
            try entrant = Manager(information: Information(firstName: firstNameTextView.text!, lastName: lastNameTextField.text!, streetAddress: streetAddressTextLabel.text!, city: cityTextField.text!, state: stateTextField.text!, zipCode: zipCodeTextField.text!))
        } catch Errors.missingInformation {
            showAlert(title: "Missing Information", message: "Not all required fields have information!")
        } catch _ {
            fatalError()
        }
        case .some(.vendor): do {
            try entrant = Vendor(vendor: companyTextField.text!, firstName: firstNameTextView.text!, lastName: lastNameTextField.text!, DOB: dateOfBirthTextField.text!, DOV: dateOfVisitTextLabel.text!)
            secondCurrentEntrantSelection = .vendor
        } catch Errors.missingInformation {
            showAlert(title: "Missing Information", message: "Not all required fields have information!")
        } catch _ {
            fatalError()
            }
        case .none: showAlert(title: "No Entrant Selected", message: "Select an entrant to create a pass for.")
        }
        
        do {
            try checkLengthsOfInput()
        } catch Errors.inputsTooShort {
            showAlert(title: "Inputs Too Short", message: "The inputs for the entrant are too short.")
        } catch _ {
            fatalError()
        }
    }
    
    // This modifies the UI based on what type is selected from the user.
    
    func adaptUIFromCurrentSelection() {
        switch currentEntrantSelection {
        case .some(.guest): firstButton.setTitle("Classic", for: .normal); secondButton.setTitle("VIP", for: .normal); thirdButton.setTitle("Senior", for: .normal); fourthButton.setTitle("Child", for: .normal); fifthButton.setTitle("Season Pass", for: .normal); showFirst4Buttons(); fifthButton.isHidden = false; addFifthButton()
        case .some(.employee): firstButton.setTitle("Food Services", for: .normal); secondButton.setTitle("Ride Services", for: .normal); thirdButton.setTitle("Maintainence", for: .normal); fourthButton.setTitle("Contract", for: .normal); showFirst4Buttons(); removeFifthButton()
        case .some(.manager): firstButton.isHidden = true; secondButton.isHidden = true; thirdButton.isHidden = true; fourthButton.isHidden = true; fifthButton.isHidden = true
        case .some(.vendor): firstButton.isHidden = true; secondButton.isHidden = true; thirdButton.isHidden = true; fourthButton.isHidden = true; fifthButton.isHidden = true
        case .none: break
        }
    }
    
    // This method was for my convenienvce so whenever I wanted to create an alert, I just type my title and message instead of having to repeat the process to create an alert.
    
    func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    // These next few methods should be pretty self-explanatory
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
    
    // These functions will disable and enable each text field in the app (the bottom one just gets rid of the text)
    
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
    
    func deleteText() {
        dateOfBirthTextField.text = ""
        dateOfVisitTextLabel.text = ""
        projectIDTextLabel.text = ""
        firstNameTextView.text = ""
        lastNameTextField.text = ""
        streetAddressTextLabel.text = ""
        cityTextField.text = ""
        stateTextField.text = ""
        zipCodeTextField.text = ""
    }
    
    // And the last function (for the extra credit) checks to see if user inputs seem suspiciously short
    
    func checkLengthsOfInput() throws {
        if (firstNameTextView.text?.characters.count)! <= 1 || (lastNameTextField.text?.characters.count)! <= 1 || (streetAddressTextLabel.text?.characters.count)! <= 5 || (cityTextField.text?.characters.count)! <= 2 || (state.text?.characters.count)! <= 3 || (zipCodeTextField.text?.characters.count)! <= 4 || (dateOfBirthTextField.text?.characters.count)! <= 5 || (dateOfVisitTextLabel.text?.characters.count)! <= 5 || (projectIDTextLabel.text?.characters.count)! <= 3 || (firstNameTextView.text?.characters.count)! >= 14 || (lastNameTextField.text?.characters.count)! >= 15 || (streetAddressTextLabel.text?.characters.count)! >= 30 || (cityTextField.text?.characters.count)! >= 16 || (state.text?.characters.count)! >= 14 || (zipCodeTextField.text?.characters.count)! >= 6 || (dateOfBirthTextField.text?.characters.count)! >= 8 || (dateOfVisitTextLabel.text?.characters.count)! >= 8 || (projectIDTextLabel.text?.characters.count)! >= 5 {
             throw Errors.inputsTooShort
        }
    }
}
