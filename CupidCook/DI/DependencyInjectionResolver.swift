//
//  DependencyInjectionResolver.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation
import Swinject

class DependencyInjectionResolver {
    
    static let shared = DependencyInjectionResolver()
    
    private var container = buildContainer()
    
    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }
    
    func setDependencyContainer(_ container: Container) {
        self.container = container
    }
}
