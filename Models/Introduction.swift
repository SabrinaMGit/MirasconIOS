/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The model for an individual landmark.
*/

import SwiftUI
import CoreLocation

struct Introduction: Hashable, Codable, Identifiable {
    
    var id: Int
    var image: String
    var titel: String
    var explain: String
    var isFeatured: Bool
}
