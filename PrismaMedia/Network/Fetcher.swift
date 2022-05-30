//
//  Fetcher.swift
//  PrismaMedia
//
//  Created by Anis on 19/05/2022.
//

import Foundation
import ApiRouter
import Alamofire

class Fetcher {
    static func getUsers (url: URL, completion: @escaping (APIModel) -> ()) {

        ApiRouter.Users.list.call { (result: Result<APIModel, Error>) in
            switch result {
                case .success(let success):
                    completion(success)
                case .failure(let failure):
                    print("case failure", failure.localizedDescription)
            }
        }
    }

    static func loadAvatarData (url: URL, completion: @escaping (Data) -> ()) {
        AF.request(url, method: .get).response { data in
            guard let data = data.data else {return}
            completion(data)
        }
    }
}
