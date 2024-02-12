//
//  Item.swift
//  SandstormSoftwareTestTask
//
//  Created by Roman Shestopal on 12.02.2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
