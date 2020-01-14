//
//  ViewController.swift
//  UserDefaults-Lab
//
//  Created by Adam Diaz on 1/13/20.
//  Copyright © 2020 Adán Diaz. All rights reserved.
//

import UIKit

class HoroscopeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var horoscopes = [Horoscope]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadData()
    }
    
    private func loadData() {
        HoroscopeAPICient.getHoroscopes() { [weak self] (result) in
            switch result {
            case .failure(let appError):
                DispatchQueue.main.async {
                    self?.showAlert(title: "App Error", message: "\(appError)")
                }
            case .success(let horoscopes):
                DispatchQueue.main.async {
                    self?.horoscopes = horoscopes
                }
            }
        }
    }


}

extension HoroscopeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

extension HoroscopeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horoscopes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "horoscopeCell", for: indexPath) as? HoroscopeTableViewCell else {
            fatalError("issue with connection")
        }
        
        let horoscope = horoscopes[indexPath.row]
        
        cell.configureCell(for: horoscope)
        
        return cell
    }
    
    
}
