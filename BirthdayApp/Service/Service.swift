//
//  Service.swift
//  BirthdayApp
//
//  Created by Ege Girsen on 19.07.2022.
//

import Foundation

class Service{
    static let shared = Service()
    
    func fetchPeople(completion: @escaping ([Results]?, Error?) -> ()) {
        let urlString = "https://randomuser.me/api/?results=1000&seed=chalkboard&inc=name,dob"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Failed to fetch:", err)
                return
            }
            guard let data = data else { return }
            do {
                let response = try JSONDecoder().decode(RestResponse.self, from: data)
                // fetch results block and leave info block since we don't need that information.
                let results = response.results
                DispatchQueue.main.async {
                    completion(results, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
            }.resume()
    }
}
