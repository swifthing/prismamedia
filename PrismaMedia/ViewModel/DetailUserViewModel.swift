//
//  DetailUserViewModel.swift
//  PrismaMedia
//
//  Created by Anis on 19/05/2022.
//

import Foundation
import Alamofire

class DetailUserViewModel {
    var user: APIModel.DataAPI

    init(user: APIModel.DataAPI) {
        self.user = user
    }

    func loadUserAvatar (completion: @escaping (Data) -> ()) {
        guard let url = URL(string: user.avatar) else {return}
        Fetcher.loadAvatarData(url: url) { data in
            completion(data)
        }
    }
}
