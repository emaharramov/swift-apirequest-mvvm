//
//  Service.swift
//  networkApi
//
//  Created by Emil Maharramov on 10.10.24.
//

import Foundation

struct Service {
    let urlString = "https://jsonplaceholder.typicode.com/posts"
    
    func fetch<T: Decodable>(completion: @escaping ([T]?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let decodedData = try? JSONDecoder().decode([T].self, from: data)
            completion(decodedData)
        }.resume()
    }
}
