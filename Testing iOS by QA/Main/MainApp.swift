//
//  MainApp.swift
//  Testing iOS by QA
//
//  Created by Łukasz Niedźwiedź on 04/03/2021.
//

import SwiftUI

@main
struct MainApp: App {
    private let dependencies = AppDependencies(networkService: NetworkService())
    var body: some Scene {
        WindowGroup {
            LoadingSceneView(viewModel: LoadingSceneViewModel())
        }
    }
}

struct AppDependencies {
    let networkService: NetworkServing
}

protocol NetworkServing {
    
}

struct NetworkService: NetworkServing {
    
}
