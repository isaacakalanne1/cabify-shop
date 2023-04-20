// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.
//
//  Package.swift
//
//
//  Created by iakalann on 19/04/2023.
//

import PackageDescription

let package = Package(
    name: "ProductsService",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "ProductsService",
            targets: ["ProductsService", "ProductsServiceMocks"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ProductsService",
            dependencies: []),
        .target(
            name: "ProductsServiceMocks",
            dependencies: [
                "ProductsService"
            ],
            path: "Mocks"
        ),
        .testTarget(
            name: "ProductsServiceTests",
            dependencies: [
                "ProductsService",
                "ProductsServiceMocks"
            ]),
    ]
)
