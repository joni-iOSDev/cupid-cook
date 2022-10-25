//
//  EndPointType.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Alamofire

protocol EndPointType {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var task: HTTPTask? { get }
    var parameters: Parameters? { get }
}

extension EndPointType {
    var endpointURL: URLConvertible {
        return self.baseURL.appending(path)
    }
}

enum HTTPTask {
    case request
}
