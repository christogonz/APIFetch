//
//  APIService.swift
//  ApiFetch
//
//  Created by Christopher Gonzalez on 2024-07-21.
//

import Foundation

class APIService {
    // MARK: Fetch function
    func fetchCountries(completion: @escaping ([CountryModel]) -> Void) {
        guard let url = URL(string: "https://freetestapi.com/api/v1/countries") else {
            completion([])
            return
        }
        
    //  URLSession realizar operaciones de red y habra un hilo ("Calle") secundario
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, 
                let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) {
                let decoder = JSONDecoder()
                
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                if let countries = try? decoder.decode([CountryModel].self, from: data) {
                    DispatchQueue.main.async {
                        completion(countries)
                    }
                    return
                }
            }
            // Vuelve al hilo("Calle") principal
            DispatchQueue.main.async {
                completion([])
            }
        }.resume()
    }
}
