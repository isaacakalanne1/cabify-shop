//
//  ServiceProtocol.swift
//  
//
//  Created by iakalann on 19/04/2023.
//

import Foundation

public protocol ServiceProtocol {
    func getProducts() async -> [Product]?
}
