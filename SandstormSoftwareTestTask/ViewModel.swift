//
//  ViewModel.swift
//  SandstormSoftwareTestTask
//
//  Created by Roman Shestopal on 14.02.2024.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var isLockButton = false
    @Published var isVisibleImage = false
    
    func changeButtonState() {
        isLockButton.toggle()
    }
    
    func changeImageState() {
        isVisibleImage.toggle()
    }
}
