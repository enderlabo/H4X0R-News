//
//  NetworkManagerModel.swift
//  H4x0r News
//
//  Created by Laborit on 28/07/21.
//

import Foundation

class NetworkManager: ObservableObject {
    
   @Published var posts = [Post]()
    
    
    func fetchData(){
       
        if let url = URL(string: K.urlApi) {
            let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error == nil {
                let decoder = JSONDecoder()
                if let safeData = data {
                    do {
                           let results = try decoder.decode(Results.self, from: safeData)
                        DispatchQueue.main.async {
                            self.posts = results.hits
                        }
                    } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}

struct Results: Decodable{
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    //computed property
    var id : String {
        return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url: String
    
}

