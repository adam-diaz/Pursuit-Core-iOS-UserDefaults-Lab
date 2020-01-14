//
//  HoroscopeApi.swift
//  UserDefaults-Lab
//
//  Created by Adam Diaz on 1/13/20.
//  Copyright © 2020 Adán Diaz. All rights reserved.
//

import Foundation

struct HoroscopeAPICient {
    
    static func getHoroscopes(completion: @escaping (Result<[Horoscope], AppError>) -> () )  {
        
        let horoscopeEndpointURLString = "http://sandipbgt.com/theastrologer/api/horoscope/all/today"
        
        guard let url = URL(string: horoscopeEndpointURLString) else {
            completion(.failure(.badURL(horoscopeEndpointURLString)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let horoscope = try JSONDecoder().decode([Horoscope].self, from: data)
                    completion(.success(horoscope))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
        
    }
}
