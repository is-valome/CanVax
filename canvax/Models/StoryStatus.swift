import Foundation
import SwiftUI

struct StoryStatus: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    var isViewed: Bool = false
    var strokeStyle: StrokeStyle
    
    init(name: String, imageName: String, isViewed: Bool = false, strokeStyle: StrokeStyle = .solid) {
        self.name = name
        self.imageName = imageName
        self.isViewed = isViewed
        self.strokeStyle = strokeStyle
    }
}

enum StrokeStyle {
    case solid
    case dashed(dashLength: CGFloat)
    
    var style: SwiftUI.StrokeStyle {
        switch self {
        case .solid:
            return SwiftUI.StrokeStyle(lineWidth: 4, lineCap: .round)
        case .dashed(let dashLength):
            return SwiftUI.StrokeStyle(
                lineWidth: 7,
                lineCap: .round,
                lineJoin: .round,
                dash: [dashLength, dashLength]
            )
        }
    }
}

// Sample data
extension StoryStatus {
    static let sampleData: [StoryStatus] = [
        StoryStatus(name: "leo", imageName: "Art • Profile 2", isViewed: false, strokeStyle: .dashed(dashLength: 8)),
        StoryStatus(name: "kova", imageName: "Art • Profile 3", isViewed: false, strokeStyle: .dashed(dashLength: 30)),
        StoryStatus(name: "Flyo", imageName: "Art • Profile 1", isViewed: false, strokeStyle: .dashed(dashLength: 19)),
        StoryStatus(name: "Zyn", imageName: "Art • Profile 2", isViewed: false, strokeStyle: .dashed(dashLength: 28)),
        StoryStatus(name: "mik", imageName: "Art • Profile 3", isViewed: false, strokeStyle: .dashed(dashLength: 8)),
        StoryStatus(name: "rom", imageName: "Art • Profile 1", isViewed: false, strokeStyle: .solid),
        StoryStatus(name: "lisa", imageName: "Art • Profile 1", isViewed: false, strokeStyle: .dashed(dashLength: 19)),
        StoryStatus(name: "neo", imageName: "Art • Profile 2", isViewed: false, strokeStyle: .dashed(dashLength: 8))
    ]
} 
