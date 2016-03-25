//
//  SettingViewController.swift
//  tips
//
//  Created by Satoru Sasozaki on 3/24/16.
//  Copyright © 2016 Satoru Sasozaki. All rights reserved.
//
import Font_Awesome_Swift
import UIKit

class SettingViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let tipAmounts = [
        ("Max", "22"), ("Mid", "20"), ("Min", "18")
    ]
    let colors = ["Switch Color"]
    let locations = ["Location"]
    
    override func viewDidLoad() {
        tableView.dataSource = self
        self.navigationItem.leftBarButtonItem?.FAIcon = FAType.FAArrowLeft
    }

    // MARK: UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return tipAmounts.count
        case 1:
            return colors.count
        case 2:
            return locations.count
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        switch indexPath.section {
        case 0:
            let (tipLabel, tipValue) = tipAmounts[indexPath.row]
            var tipField = UITextField(frame: CGRectMake(275,5,50,35))
            tipField.text = tipValue
            cell.contentView.addSubview(tipField)
            
            cell.textLabel?.text = tipLabel
        case 1:
            cell.textLabel?.text = colors[indexPath.row]
            
            let colorSwitch = UISwitch()
            colorSwitch.addTarget(self, action: #selector(switchValueDidChange), forControlEvents: .ValueChanged)
            cell.accessoryView = colorSwitch
            
        case 2:
            cell.textLabel?.text = locations[indexPath.row]
        default:
            print("error in cellForRowAtIndexPath")
        }
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Tip Amounts"
        case 1:
            return "Theme"
        case 2:
            return "Currency"
        default:
            break
        }
        return ""
    }
    
    // MARK: Button Actions
    @IBAction func onCancelButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    
    // MARK: Theme Switch
    func switchValueDidChange(sender: AnyObject) {
        print("switch changed")
    }
}
