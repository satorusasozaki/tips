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
//    let tipAmounts = [
//        ("Max", "22"), ("Mid", "20"), ("Min", "18")
//    ]
    
    
    //var tipAmounts: [Dictionary<String, Double>]?
    
    let percentageLabels = [
        "Max", "Mid", "Min"
    ]
    var percentageValues: [Double]?
    var percentageKey: String?
    var ud: NSUserDefaults?
    
    
    let colors = ["Switch Color"]
    let locations = ["Location"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        self.navigationItem.leftBarButtonItem?.FAIcon = FAType.FAArrowLeft
        
        percentageKey = "percentage"
        ud = NSUserDefaults.standardUserDefaults()
        percentageValues = ud?.objectForKey(percentageKey!) as? [Double]
        
    }

    // MARK: UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return percentageLabels.count
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
        //    let (tipLabel, tipValue) = tipAmounts[indexPath.row]
            
            let tipField = UITextField(frame: CGRectMake(275,5,50,35))
            tipField.text = String(format: "%.0f", percentageValues![indexPath.row]*100)
            
            switch indexPath.row {
            case 0:
                tipField.addTarget(self, action: #selector(maxInTipFieldDidChange), forControlEvents: .EditingDidEnd)
            case 1:
                tipField.addTarget(self, action: #selector(midInTipFieldDidChange), forControlEvents: .EditingDidEnd)
            case 2:
                tipField.addTarget(self, action: #selector(minInTipFieldDidChange), forControlEvents: .EditingDidEnd)
            default:
                break
            }
            
            
            
            cell.contentView.addSubview(tipField)
            cell.textLabel?.text = percentageLabels[indexPath.row]
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
    
    
    func maxInTipFieldDidChange(max: UITextField?) {
//        var max = max?.text
//        percentageValues?[0] = Double(max!)!
        percentageValues?[0] = Double((max?.text)!)!/100
        print(percentageValues![0])
        
    }
    
    func midInTipFieldDidChange(mid: UITextField?) {
        percentageValues?[1] = Double((mid?.text)!)!/100
        print(percentageValues![1])
    }

    func minInTipFieldDidChange(min: UITextField?) {
        percentageValues?[2] = Double((min?.text)!)!/100
        print(percentageValues![2])
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

    @IBAction func onBackButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
        ud?.setObject(percentageValues, forKey: percentageKey!)
        ud?.synchronize()
        let vControllers = self.navigationController?.viewControllers
        let VCindex = vControllers?.count
        let prevVC = vControllers![VCindex!-1]
        
        prevVC.loadView()
        prevVC.viewDidLoad()
    }
    
    // MARK: Theme Switch
    func switchValueDidChange(sender: AnyObject) {
        print("switch changed")
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}
