//
//  NetworkManager.swift
//  hW2.12
//
//  Created by Алексей Трофимов on 18.12.2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from urlString: String, with comlition: @escaping ([UserModel]) -> Void){
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
            do {
                let characters = try JSONDecoder().decode([UserModel].self, from: data)
                comlition(characters)
                
            } catch let jsonError {
                print(jsonError.localizedDescription)
            }
        }.resume()
    }
}
