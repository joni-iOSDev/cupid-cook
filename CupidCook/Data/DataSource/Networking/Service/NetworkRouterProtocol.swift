//
//  NetworkRouterProtocol.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation

protocol NetworkRouterProtocol: AnyObject {
    associatedtype EndPoint: EndPointType
    func request<GenericObject: Decodable>(expectedData: GenericObject.Type,from route: EndPoint, completion: @escaping NetworkRouterCompletion<GenericObject>)
}
