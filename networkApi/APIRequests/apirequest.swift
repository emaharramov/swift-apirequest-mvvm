//
//  apirequest.swift
//  networkApi
//
//  Created by Emil Maharramov on 10.10.24.
//

import Foundation

struct APIRequest {
    let urlString = "https://jsonplaceholder.typicode.com/posts"
    
    func fetchPosts(completion: @escaping ([PostStruct]?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let posts = try? JSONDecoder().decode([PostStruct].self, from: data)
            completion(posts)
        }.resume()
    }
}
