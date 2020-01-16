//
//  HoroscopeTableViewCell.swift
//  UserDefaults-Lab
//
//  Created by Adam Diaz on 1/14/20.
//  Copyright © 2020 Adán Diaz. All rights reserved.
//

import UIKit

class HoroscopeTableViewCell: UITableViewCell {

    @IBOutlet weak var sunLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var moodLabel: UILabel!
    
    var horoscope: Horoscope?

    func configureCell(for horoscope: Horoscope) {
        sunLabel.text = horoscope.sunsign
        dateLabel.text = horoscope.date
        moodLabel.text = horoscope.meta.mood
    }
    
}
