//
//  ViewController.swift
//  PickerTableTutorial
//
//  Created by YOUNGSIC KIM on 2018-09-23.
//  Copyright © 2018 YOUNGSIC KIM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // PickerTable Data
    var pickerData:[[String]] = [["Apple","Grape","Orange","Tomato","Peach","Stawberry"],
                                 ["Chocolate","Pie","Pancake","Dounut","Cookie","Iceream","Jelly"]]
    @IBOutlet weak var mainPickerTable: UIPickerView! {
        didSet {
            mainPickerTable.selectRow(2, inComponent: 0, animated: false) // set first row value
            mainPickerTable.selectRow(2, inComponent: 1, animated: false) // set second row value
            firstString = pickerData[0][2] // set firstString from first row picker Data
            secondString = pickerData[1][2] // set secondString from second row picker Data
        }
    }
    var firstString:String!
    var secondString:String!
    @IBOutlet weak var resultLabel: UILabel! {
        didSet {
            resultLabel.text = "Your first String: "+firstString+"\nYour second String: "+secondString
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension ViewController: UIPickerViewDataSource,UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 { // if user choise first picker data
            firstString = pickerData[0][row] // first row and choose data from picker data
        }else if component == 1 { // if user choise second picker data
            secondString = pickerData[1][row] // second row and choose data from picker data
        }
        resultLabel.text = "Your first String: "+firstString+"\nYour second String: "+secondString
    }
}
