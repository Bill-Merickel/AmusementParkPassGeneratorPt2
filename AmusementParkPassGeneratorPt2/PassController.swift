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
    }
    @IBAction func testRideAccess(_ sender: AnyObject) {
    }
    @IBAction func testDiscountAccess(_ sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
            if let destination == segue.destination as? ViewController {
                
            }
        }
    }
    

}
