//
//  SandstormSoftwareTestTaskApp.swift
//  SandstormSoftwareTestTask
//
//  Created by Roman Shestopal on 12.02.2024.
//

import SwiftUI
import SwiftData

@main
struct SandstormSoftwareTestTaskApp: App {
    @StateObject var model = ViewModel()

    var body: some Scene {
        WindowGroup {
            MainScreen(model: model)
        }
    }
}
