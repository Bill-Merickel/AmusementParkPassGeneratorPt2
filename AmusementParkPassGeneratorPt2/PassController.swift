//
//  PassController.swift
//  AmusementParkPassGeneratorPt2
//
//  Created by Bill Merickel on 10/23/16.
//  Copyright © 2016 Bill Merickel. All rights reserved.
//

import UIKit

class PassController: UIViewController {
    
    var entrant: Entrant? = nil

    @IBAction func testAreaAccess(_ sender: AnyObject) {
    }
    @IBAction func testRideAccess(_ sender: AnyObject) {
    }
    @IBAction func testDiscountAccess(_ sender: AnyObject) {
    }
    

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var entrantTypeLabel: UILabel!
    @IBOutlet weak var rideLabel: UILabel!
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var merchLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameLabel.text = entrant!.information!.firstName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createNewPass(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainController" {
            if let destinationVC = segue.destination as? ViewController {
                 self.entrant = destinationVC.entrant
            }
        }
    }
    

}
