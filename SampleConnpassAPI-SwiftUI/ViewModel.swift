//
//  ViewModel.swift
//  SampleConnpassAPI-SwiftUI
//
//  Created by mtanaka on 2022/10/28.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    
    @Published var connpassGeneral: Models?
    @Published var modelData: [Model]?
    
    var disposable = Set<AnyCancellable>()
    
    init() {
        fetchConpassEvents()
    }
    
    func fetchConpassEvents() {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let url = URL(string: "https://connpass.com/api/v1/event/?keyword=Swift&order=3")!
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTaskPublisher(for: request)
            .map({ (data, response) in
                return data
            })
            .decode(type: Models.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("error:" + error.localizedDescription)
                case .finished:
                    print("success!!!!!!!!!!!!!!!!!!!!!!!")
                }
            }, receiveValue: { [weak self] connpassGeneral in
                self?.modelData = connpassGeneral.models
                print(self?.modelData as Any)
            })
            .store(in: &disposable)
    }
}
