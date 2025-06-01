import SwiftUI

class ScrollHapticManager {
    static let shared = ScrollHapticManager()
    
    private init() {}
    
    func light() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
    
    func medium() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    
    func heavy() {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
    }
    
    func scroll() {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
    }
} 
