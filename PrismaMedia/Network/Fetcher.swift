//
//  Fetcher.swift
//  PrismaMedia
//
//  Created by Anis on 19/05/2022.
//

import Foundation
import Alamofire

class Fetcher {
    static func getUsers (url: URL, completion: @escaping (APIModel) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }

            do {
                let users = try JSONDecoder().decode(APIModel.self, from: data)
                completion(users)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }

    static func loadAvatarData (url: URL, completion: @escaping (Data) -> ()) {
        AF.request(url, method: .get).response { data in
            guard let data = data.data else {return}
            completion(data)
        }
    }
}
