//
//  ViewController.swift
//  tippy
//
//  Created by Haimei Yang on 12/17/17.
//  Copyright © 2017 Haimei Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billLab: UILabel!
    @IBOutlet weak var tipLab: UILabel!
    @IBOutlet weak var totalLab: UILabel!
    @IBOutlet weak var divisor: UIView!
    @IBOutlet weak var dollarSign: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //keyboard is always visible and the bill amount is
        //always the first responder
        self.billField.becomeFirstResponder()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        changeBackGroundColor()
        let defaults = UserDefaults.standard
        
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultIndex")
        
        let defaultTip = defaults.double(forKey: "defaultTip")
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * defaultTip
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        
        
    }
    
    func changeBackGroundColor() {
        let defaults = UserDefaults.standard
        let defaultColorIndex = defaults.integer(forKey: "defaultColorIndex")
        
        if defaultColorIndex == 0 {
            self.view.backgroundColor = UIColor(displayP3Red: 225/255, green: 244/255, blue: 236/255, alpha: 1)
            tipLabel.textColor = UIColor.black
            billLab.textColor = UIColor.black
            tipLab.textColor = UIColor.black
            tipLabel.textColor = UIColor.black
            totalLab.textColor = UIColor.black
            totalLabel.textColor = UIColor.black
            dollarSign.textColor = UIColor.black
            divisor.backgroundColor = UIColor(displayP3Red: 53/255, green: 140/255, blue: 108/255, alpha: 1)
            tipControl.tintColor = UIColor(displayP3Red: 53/255, green: 140/255, blue: 108/255, alpha: 1)
            
        } else {
            self.view.backgroundColor = UIColor(displayP3Red: 82/255, green: 103/255, blue: 79/255, alpha: 0.71)
            tipLabel.textColor = UIColor.white
            billLab.textColor = UIColor.white
            tipLab.textColor = UIColor.white
            tipLabel.textColor = UIColor.white
            totalLab.textColor = UIColor.white
            totalLabel.textColor = UIColor.white
            dollarSign.textColor = UIColor.white
            divisor.backgroundColor = UIColor(displayP3Red: 169/255, green: 227/255, blue: 204/255, alpha: 0.88)
            tipControl.tintColor = UIColor(displayP3Red: 169/255, green: 227/255, blue: 204/255, alpha: 0.88)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [0.18, 0.20, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
}

