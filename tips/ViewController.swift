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
    
    var ud: NSUserDefaults?
    var percentageKey: String?
    
    var tipPercentages: [Double]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        splitBy2Label.text = "$0.00"
        splitBy3Label.text = "$0.00"
        splitBy4Label.text = "$0.00"
        
        self.navigationItem.rightBarButtonItem!.FAIcon = FAType.FACog
        
        ud = NSUserDefaults.standardUserDefaults()
        percentageKey = "percentage"
        tipPercentages = ud?.objectForKey(percentageKey!) as? [Double]
        tipControl.setTitle(String(format:"%.0f", tipPercentages![0]*100) + "%", forSegmentAtIndex: 0)
        tipControl.setTitle(String(format:"%.0f", tipPercentages![1]*100) + "%", forSegmentAtIndex: 1)
        tipControl.setTitle(String(format:"%.0f", tipPercentages![2]*100) + "%", forSegmentAtIndex: 2)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        //let tipPercentages = ud?.objectForKey(percentageKey!) as? [Double]
        let tipPercentage = tipPercentages![tipControl.selectedSegmentIndex]
        let billAmount =  (billField.text! as NSString).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        splitBy2Label.text =  String(format: "$%.2f", total/2)
        splitBy3Label.text =  String(format: "$%.2f", total/3)
        splitBy4Label.text =  String(format: "$%.2f", total/4)

        
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}

