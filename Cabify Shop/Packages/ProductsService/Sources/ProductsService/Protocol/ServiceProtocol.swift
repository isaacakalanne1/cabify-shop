//
//  ServiceProtocol.swift
//  
//
//  Created by iakalann on 19/04/2023.
//

public protocol ServiceProtocol {
    func getProducts() async -> [Product]?
}
