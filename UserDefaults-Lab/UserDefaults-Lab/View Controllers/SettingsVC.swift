//
//  SettingsVC.swift
//  UserDefaults-Lab
//
//  Created by Adam Diaz on 1/16/20.
//  Copyright © 2020 Adán Diaz. All rights reserved.
//

import Foundation
import UIKit

protocol SettingDelegate {
    func didChangeSign(sign: String)
    func didChangeName(name: String)
}

class SettingsVC: UIViewController {
    

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var monthPicker: UIPickerView!
    @IBOutlet weak var dayPicker: UIPickerView!
    
//    var pickerMonthData: [String] = [String]()
//    var pickerDayData: [String] = [String]()
    var settingsDelegate: SettingDelegate?
    var pickerDayData = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]
    var pickerMonthData = ["January","February","March","April","May","June","July","August","September","October","November","December"]
    
    var monthA = String()
    var dayA = Int()
    
    var sign = "Astrology" {
        didSet {
            UserPreference.shared.updateSign(sign: sign)
            settingsDelegate?.didChangeSign(sign: sign)
        }
    }
//    var month = ""
//    var day = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        monthPicker.dataSource = self
        monthPicker.delegate = self
        dayPicker.dataSource = self
        dayPicker.delegate = self
        textField.delegate = self
    }
    
    func signConvert(month: String, day: Int) ->  String {
        var sign = ""
        if month == "March" && (21...31).contains(day) || month == "April" && (1...19).contains(day) {
            sign = "Aries"
        }
        if month == "April" && (20...30).contains(day) || month == "May" && (1...20).contains(day) {
            sign = "Taurus"
        }
        if month == "May" && (21...31).contains(day) || month == "June" && (1...20).contains(day) {
            sign = "Gemini"
        }
        if month == "June" && (21...31).contains(day) || month == "July" && (1...22).contains(day) {
            sign = "Cancer"
        }
        if month == "July" && (22...31).contains(day) || month == "August" && (1...22).contains(day) {
            sign = "Leo"
        }
        if month == "August" && (23...31).contains(day) || month == "September" && (1...22).contains(day) {
            sign = "Virgo"
        }
        if month == "September" && (23...31).contains(day) || month == "October" && (1...19).contains(day) {
            sign = "Libra"
        }
        if month == "October" && (21...31).contains(day) || month == "November" && (1...22).contains(day) {
            sign = "Scorpio"
        }
        if month == "November" && (22...31).contains(day) || month == "December" && (1...21).contains(day) {
            sign = "Sagittarius"
        }
        if month == "December" && (22...31).contains(day) || month == "January" && (1...19).contains(day) {
            sign = "Capricorn"
        }
        if month == "January" && (20...31).contains(day) || month == "February" && (1...18).contains(day) {
            sign = "Aquarius"
        }
        if month == "Febraury" && (19...31).contains(day) || month == "March" && (1...20).contains(day) {
            sign = "Pisces"
        }
        return sign
    }
    
    
    
    @IBAction func userInfoSubmitted(_ sender: UIButton) {
        sign = signConvert(month: monthA, day: dayA)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.destination is MyHoroscopeVC else {
            return
        }
    }
    
}

extension SettingsVC: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == monthPicker {
            return pickerMonthData.count
          } else {
            print(pickerDayData.count)
            return pickerDayData.count
            
          }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == monthPicker {
          return pickerMonthData[row]
        } else {
          return "\(pickerDayData[row])"
        }
        
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        if pickerView == monthPicker {
            monthA = pickerMonthData[row]
          //  let month = pickerMonthData[row]
         //   let day = pickerDayData[row]
            //sign = signConvert(month: month, day: day)
        } else {
            dayA = pickerDayData[row]
            //let month = pickerMonthData[row]
            //let day = pickerDayData[row]
            //sign = signConvert(month: month, day: day)
        }
        
        print(sign)
    }
 
  

    
}


extension SettingsVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
