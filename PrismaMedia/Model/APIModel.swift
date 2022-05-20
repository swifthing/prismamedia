//
//  APIModel.swift
//  PrismaMedia
//
//  Created by Anis on 19/05/2022.
//

import Foundation

struct APIModel: Codable {
    var data: [DataAPI]

    struct DataAPI: Codable {
        var id: Int
        var email: String
        var first_name: String
        var last_name: String
        var avatar: String
    }
}

