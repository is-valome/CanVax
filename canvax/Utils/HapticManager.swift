import SwiftUI

enum HapticManager {
    static func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    static func selection() {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
    }
}

// Convenience methods
extension HapticManager {
    static func light() {
        impact(style: .light)
    }
    
    static func medium() {
        impact(style: .medium)
    }
    
    static func heavy() {
        impact(style: .heavy)
    }
    
    static func success() {
        notification(type: .success)
    }
    
    static func warning() {
        notification(type: .warning)
    }
    
    static func error() {
        notification(type: .error)
    }
} 