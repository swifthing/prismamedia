//
//  ApiRouter+Addition.swift
//  PrismaMedia
//
//  Created by Anis on 30/05/2022.
//

import Foundation
import ApiRouter
import Alamofire

extension ApiRouter {

    enum Users: Route, RouteDelegate {
        case list

        var baseUrl: URL {
            URL(string: "https://reqres.in")!
        }

        var method: HTTPMethod {
            return .get
        }

        var path: String {
            switch self {
                case .list: return "/api/users"
            }
        }

        var parameters: [String : Any] {
            return [:]
        }
        var encoding: ParameterEncoding {
            return URLEncoding.default
        }
        var headers: HTTPHeaders? {
            return nil
        }

        func dataWillSerialized(data: Data) {

        }
    }
}
