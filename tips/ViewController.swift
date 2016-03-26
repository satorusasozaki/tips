//
//  ViewController.swift
//  tips
//
//  Created by Satoru Sasozaki on 3/22/16.
//  Copyright © 2016 Satoru Sasozaki. All rights reserved.
//
// read me: https://gist.github.com/timothy1ee/9de467c4876fe38ff18c
// Creating the Tip Calculator: https://gist.github.com/timothy1ee/6858b706304a2397a7e2

import Font_Awesome_Swift
//import FontAwesome
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var settingBarButton: UIBarButtonItem!

    @IBOutlet weak var splitBy2Label: UILabel!
    @IBOutlet weak var splitBy3Label: UILabel!
    @IBOutlet weak var splitBy4Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        self.navigationItem.rightBarButtonItem!.FAIcon = FAType.FACog

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        let tipPercentages = [0.18, 0.20, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let billAmount =  (billField.text! as NSString).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        splitBy2Label.text =  String(format: "%.2f", total/2)
        splitBy3Label.text =  String(format: "%.2f", total/3)
        splitBy4Label.text =  String(format: "%.2f", total/4)

        
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}

