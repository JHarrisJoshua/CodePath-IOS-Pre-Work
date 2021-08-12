//
//  ViewController.swift
//  Prework
//
//  Created by Joshua Harris on 8/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitBillSwitch: UISwitch!
    @IBOutlet weak var groupSizeTextField: UITextField!
    @IBOutlet weak var perPersonTotalLabel: UILabel!
    @IBOutlet weak var groupSizeLabel: UILabel!
    @IBOutlet weak var perPersonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get Total tip by multiplying tip * tip percent
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
    
        // Calculate sub total per person if splitting bill
        let groupSize = Int(groupSizeTextField.text!) ?? 1
        let totalPerPerson = total / Double(groupSize)
        
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
        // Update Per Person Total
        perPersonTotalLabel.text = String(format: "$%.2f", totalPerPerson)
    }
    
    
    @IBAction func toggleSplitBill(_ sender: UISwitch) {
        // Unhide or hide additonal features
        // based on split bill switch
        if splitBillSwitch.isOn {
            groupSizeLabel.isHidden = false
            perPersonLabel.isHidden = false
            groupSizeTextField.isHidden = false
            perPersonTotalLabel.isHidden = false
        
        } else {
            groupSizeLabel.isHidden = true
            perPersonLabel.isHidden = true
            groupSizeTextField.isHidden = true
            perPersonTotalLabel.isHidden = true
        }
    }
}

