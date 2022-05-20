//
//  UsersViewModel.swift
//  PrismaMedia
//
//  Created by Anis on 19/05/2022.
//

import Foundation

class UsersViewModel {
    var userList: [APIModel.DataAPI]

    init () {
        userList = []
    }

    var endpoint: URLComponents {
        var url = URLComponents()
        url.scheme = "https"
        url.host = "reqres.in"
        url.path = "/api/users"
        url.queryItems = [
            URLQueryItem(name: "per_page", value: "20")
        ]
        return url
    }

    func refreshList (completion: @escaping () -> ()) {
        guard let url = endpoint.url else { return }
        Fetcher.getUsers(url: url) { [weak self] users in
            guard let self = self else { return }
            self.userList = users.data
            completion()
        }
    }    
}
