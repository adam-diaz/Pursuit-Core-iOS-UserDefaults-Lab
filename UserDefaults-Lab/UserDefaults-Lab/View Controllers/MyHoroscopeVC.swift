//
//  MyHoroscopeVC.swift
//  UserDefaults-Lab
//
//  Created by Adam Diaz on 1/14/20.
//  Copyright © 2020 Adán Diaz. All rights reserved.
//

import UIKit

class MyHoroscopeVC: UIViewController {
    
    var horoscope: Horoscope?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sunLabel: UILabel!
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var intensityLabel: UILabel!
    @IBOutlet weak var horoscopeTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
    sunLabel.text = horoscope?.sunsign
    moodLabel.text = horoscope?.meta.mood
    intensityLabel.text = horoscope?.meta.intensity
    horoscopeTextView.text = horoscope?.horoscope
    }
    
}
