//
//  ContentView.swift
//  ApiFetch
//
//  Created by Christopher Gonzalez on 2024-07-21.
//

import SwiftUI

struct ContentView: View {
    @State var countries: [CountryModel] = []
    private var apiService = APIService()
    
    func formatPopulation(_ population: Int) -> String {
        let populationInMillions = Double(population) / 1_000_000
        return String(format: "%.1fm", populationInMillions)
    }
    
    var body: some View {
        VStack {
            List(countries, id: \.id){ country in
                HStack {
                        RemoteImage(url: country.flag)
                            .frame(width: 50)
                            .clipShape(Circle())

                        VStack(alignment: .leading) {
                            Text(country.name)
                            Text(country.capital)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Population")
                            Text(formatPopulation(country.population))
                                .foregroundStyle(.secondary)
                        }
                        
//
                        
                    }
                }
        }
        .onAppear {
            apiService.fetchCountries { fetchedCountries in
                    countries = fetchedCountries
            }
        }
    }
}

#Preview {
    ContentView()
}
