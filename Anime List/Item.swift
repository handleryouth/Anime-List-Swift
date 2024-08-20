//
//  Item.swift
//  Anime List
//
//  Created by Tony Gultom on 20/08/24.
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
