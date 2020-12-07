//
//  ViewController.swift
//  411-Homework-2
//
//  Created by Jake Hamo Work on 12/6/20.
//  Copyright © 2020 Jake Hamo Work. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var claimTitleTextFIeld: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    let claimService = ClaimService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addButton(_ sender: Any) {
        let addClaim: Claim = Claim(title: claimTitleTextFIeld.text ?? "", date: dateTextField.text ?? "")
        claimService.addPerson(pObj: addClaim, success: { (claim) in
            DispatchQueue.main.async {
                self.statusLabel.text = "SUCCESS"
            }
        }, failure: {
            DispatchQueue.main.async {
                self.statusLabel.text = "FAILURE"
            }
        })
    }
}
