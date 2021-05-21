//
//  LoadingSceneView.swift
//  Testing iOS by QA
//
//  Created by Łukasz Niedźwiedź on 04/03/2021.
//

import SwiftUI

struct LoadingSceneView: View {
    @ObservedObject var viewModel: LoadingSceneViewModel
    var body: some View {
        NavigationView {
            VStack(spacing: 20.0) {
                Text("Tap \(viewModel.count) times to see what happens")
                Button("Tap Me") {
                    self.viewModel.didTapButton()
                }
            }.navigationTitle("Exercise One")
        }
        .sheet(isPresented: $viewModel.conditionsFullfied, content: {
            MinusView()
        })
    }
}

struct MinusView: View {
    var body: some View {
        Text("checkout to branch: feature/exercise-two")
    }
}

import Combine
final class LoadingSceneViewModel: ObservableObject {
    @Published var count: Int = 1
    @Published var conditionsFullfied: Bool = false
    init() {
    }
    
    func didTapButton() {
        count -= 1
        if count == 0 {
            conditionsFullfied = true
        }
    }
}

struct LoadingSceneView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingSceneView(
            viewModel: LoadingSceneViewModel()
        )
    }
}
