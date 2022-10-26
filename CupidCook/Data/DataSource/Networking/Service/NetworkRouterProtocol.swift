//
//  NetworkRouterProtocol.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation
import Alamofire

protocol NetworkRouterProtocol: AnyObject {
    associatedtype EndPoint: EndPointType
    func request<GenericObject: Decodable>(expectedData: GenericObject.Type,from route: EndPoint, completion: @escaping NetworkRouterCompletion<GenericObject>)
    func request<GenericObject: Decodable>(expectedData: GenericObject.Type, from route: EndPoint) async -> Result<GenericObject, AFError>
}
