//
//  ViewController.swift
//  411-Homework-2
//
//  Created by Jake Hamo Work on 12/6/20.
//  Copyright © 2020 Jake Hamo Work. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let statusLabel2: UILabel = UILabel()
    let claimTitleTextField2: UITextField = UITextField()
    let dateTextField2: UITextField = UITextField()
    let claimService = ClaimService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //START MANUAL SECTION
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Please Enter Claim Information"
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        label.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        //END MANUAL SECTION
        
        let claimTitleLabel = UILabel()
        claimTitleLabel.textAlignment = .right
        claimTitleLabel.text = "Claim Title"
        claimTitleLabel.sizeToFit()
        claimTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(claimTitleLabel)
        claimTitleLabel.widthAnchor.constraint(equalToConstant: 146).isActive = true
        claimTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
        let titleLabel = UILabel()
        titleLabel.textAlignment = .right
        titleLabel.text = "Date"
        titleLabel.sizeToFit()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(titleLabel)
        titleLabel.widthAnchor.constraint(equalToConstant: 146).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
        claimTitleTextField2.borderStyle = .roundedRect
        view.addSubview(claimTitleTextField2)
        claimTitleTextField2.translatesAutoresizingMaskIntoConstraints = false
        claimTitleTextField2.heightAnchor.constraint(equalToConstant: 34).isActive = true
        claimTitleTextField2.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 15).isActive = true
        claimTitleTextField2.leadingAnchor.constraint(equalTo: claimTitleLabel.trailingAnchor, constant: 20).isActive = true
        claimTitleTextField2.trailingAnchor.constraint(greaterThanOrEqualTo: view.trailingAnchor, constant: -20).isActive = true
        claimTitleLabel.centerYAnchor.constraint(equalTo: claimTitleTextField2.centerYAnchor, constant: 0).isActive = true
        
        dateTextField2.borderStyle = .roundedRect
        view.addSubview(dateTextField2)
        dateTextField2.translatesAutoresizingMaskIntoConstraints = false
        dateTextField2.heightAnchor.constraint(equalToConstant: 34).isActive = true
        dateTextField2.topAnchor.constraint(equalTo: claimTitleTextField2.bottomAnchor, constant: 10).isActive = true
        dateTextField2.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 20).isActive = true
        dateTextField2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: dateTextField2.centerYAnchor, constant: 0).isActive = true
        
        let addButton2 = UIButton(type: .system)
        addButton2.setTitle("Add", for: .normal)
        addButton2.translatesAutoresizingMaskIntoConstraints = false
        addButton2.addTarget(self, action: #selector(ViewController.addButtonManual(_:)), for: .touchUpInside)
        view.addSubview(addButton2)
        addButton2.widthAnchor.constraint(equalToConstant: 50).isActive = true
        addButton2.topAnchor.constraint(equalTo: dateTextField2.bottomAnchor, constant: 10).isActive = true
        addButton2.trailingAnchor.constraint(equalTo: dateTextField2.trailingAnchor, constant: 0).isActive = true
        
        let statusTitleLabel = UILabel()
        statusTitleLabel.textAlignment = .right
        statusTitleLabel.text = "Status:"
        statusTitleLabel.sizeToFit()
        statusTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(statusTitleLabel)
        statusTitleLabel.widthAnchor.constraint(equalToConstant: 146).isActive = true
        statusTitleLabel.topAnchor.constraint(equalTo: addButton2.bottomAnchor, constant: 30).isActive = true
        statusTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
        statusLabel2.textAlignment = .left
        statusLabel2.text = ""
        statusLabel2.sizeToFit()
        statusLabel2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(statusLabel2)
        statusLabel2.widthAnchor.constraint(equalToConstant: 146).isActive = true
        statusLabel2.centerYAnchor.constraint(equalTo: statusTitleLabel.centerYAnchor, constant: 0).isActive = true
        statusLabel2.leadingAnchor.constraint(equalTo: statusTitleLabel.trailingAnchor, constant: 20).isActive = true
        statusLabel2.trailingAnchor.constraint(equalTo: dateTextField2.trailingAnchor, constant: 0).isActive = true
    }
    
    @IBAction func addButtonManual(_ sender: Any) {
        addClaim(title: claimTitleTextField2.text ?? "", date: dateTextField2.text ?? "")
    }
    
    func addClaim(title: String, date: String) {
        let addClaim: Claim = Claim(title: title, date: date)
        claimService.addPerson(pObj: addClaim, success: { (claim) in
            let text = "Claim \(title) created"
            DispatchQueue.main.async {
                self.statusLabel2.text = text
                self.claimTitleTextField2.text = ""
                self.dateTextField2.text = "";
                self.dateTextField2.resignFirstResponder()
                self.claimTitleTextField2.resignFirstResponder()
            }
        }, failure: {
            let text = "Claim \(title) failed"
            DispatchQueue.main.async {
                self.statusLabel2.text = text
                self.claimTitleTextField2.text = ""
                self.dateTextField2.text = "";
                self.dateTextField2.resignFirstResponder()
                self.claimTitleTextField2.resignFirstResponder()
            }
        })
    }
}
