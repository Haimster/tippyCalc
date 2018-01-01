//
//  SettingsViewController.swift
//  tippy
//
//  Created by Haimei Yang on 12/31/17.
//  Copyright © 2017 Haimei Yang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    @IBOutlet weak var defaultColorTheme: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        defaultTipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultIndex")
        defaultColorTheme.selectedSegmentIndex = defaults.integer(forKey: "defaultColorIndex")
        
        setDefaultColor(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setDefaultTip(_ sender: Any) {
        let tipPercentages = [0.18, 0.20, 0.25]
        let defaults = UserDefaults.standard
        
        let defaultTipIndex = defaultTipControl.selectedSegmentIndex
        let defaultTip = tipPercentages[defaultTipIndex]
        defaults.set(defaultTip, forKey: "defaultTip")
        defaults.set(defaultTipIndex, forKey: "defaultIndex")
        
        defaults.synchronize()
        
    }
    
    @IBAction func setDefaultColor(_ sender: Any) {
        let defaults = UserDefaults.standard
        let defaultColorIndex = defaultColorTheme.selectedSegmentIndex
        
        defaults.set(defaultColorIndex, forKey: "defaultColorIndex")
        defaults.synchronize()
        
        if defaultColorIndex == 0 {
            self.view.backgroundColor = UIColor(displayP3Red: 225/255, green: 244/255, blue: 236/255, alpha: 1)
            tipLabel.textColor = UIColor.black
            colorLabel.textColor = UIColor.black
            defaultTipControl.tintColor = UIColor(displayP3Red: 53/255, green: 140/255, blue: 108/255, alpha: 1)
            defaultColorTheme.tintColor = UIColor(displayP3Red: 53/255, green: 140/255, blue: 108/255, alpha: 1)
            
        } else {
            self.view.backgroundColor = UIColor(displayP3Red: 82/255, green: 103/255, blue: 79/255, alpha: 0.71)
            tipLabel.textColor = UIColor.white
            colorLabel.textColor = UIColor.white
            defaultTipControl.tintColor = UIColor(displayP3Red: 169/255, green: 227/255, blue: 204/255, alpha: 0.88)
            defaultColorTheme.tintColor = UIColor(displayP3Red: 169/255, green: 227/255, blue: 204/255, alpha: 0.88)
        }
        
    }
    
 
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
