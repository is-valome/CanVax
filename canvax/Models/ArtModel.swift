import Foundation

struct ArtPost: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let artist: String
    let location: String
    let likes: Int
    let comments: Int
    let shares: Int
}

// Sample data
extension ArtPost {
    static let sampleData: [ArtPost] = [
        ArtPost(
            imageName: "Art1",
            title: "My day was not a good day but I can to you true my art",
            artist: "Sarah",
            location: "New York, NY",
            likes: 1243,
            comments: 89,
            shares: 45
        ),
        ArtPost(
            imageName: "Art3",
            title: "Not the Best Day, But I Painted Through It",
            artist: "Marcus",
            location: "Los Angeles, CA",
            likes: 892,
            comments: 67,
            shares: 34
        ),
        ArtPost(
            imageName: "Art2",
            title: "When Words Fail, My Art Remains Honest",
            artist: "Emma",
            location: "Miami, FL",
            likes: 1567,
            comments: 123,
            shares: 78
        )
//        ArtPost(
//            imageName: "Art4",
//            title: "Broken Inside, Bold on Canvas",
//            artist: "David",
//            location: "Chicago, IL",
//            likes: 2341,
//            comments: 156,
//            shares: 92
//        )
    ]
} 
