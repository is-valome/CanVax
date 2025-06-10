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
    let bio: String
    let profileImage: String
    let followers: Int
    let artsCount: Int
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
            shares: 45,
            bio: "Journaling is my passion, but I've found that my art speaks louder than words. Somewhere within each piece lies a hidden journal.",
            profileImage: "friend1",
            followers: 212,
            artsCount: 22
        ),
        ArtPost(
            imageName: "Art3",
            title: "Not the Best Day, But I Painted Through It and Found My Inner Peace Through Colors",
            artist: "Marcus",
            location: "Los Angeles, CA",
            likes: 892,
            comments: 67,
            shares: 34,
            bio: "Colors are my therapy, each stroke a step towards healing. My art is a journey through emotions, painted in vibrant hues.",
            profileImage: "friend2",
            followers: 156,
            artsCount: 18
        ),
        ArtPost(
            imageName: "Art2",
            title: "When Words Fail, My Art Remains Honest and Speaks Volumes About My Journey",
            artist: "Emma",
            location: "Miami, FL",
            likes: 1567,
            comments: 123,
            shares: 78,
            bio: "Art is my voice when words fall short. Every canvas tells a story of resilience and hope.",
            profileImage: "friend3",
            followers: 289,
            artsCount: 31
        ),
        ArtPost(
            imageName: "Art4",
            title: "Broken Inside, Bold on Canvas, Every Stroke Tells a Story of Resilience",
            artist: "David",
            location: "Chicago, IL",
            likes: 2341,
            comments: 156,
            shares: 92,
            bio: "Transforming pain into power through bold strokes and vibrant colors. My art is my armor.",
            profileImage: "friend1",
            followers: 445,
            artsCount: 27
        ),
        ArtPost(
            imageName: "Art5",
            title: "Colors of My Soul Dancing on Canvas, Each Hue a Memory of Yesterday",
            artist: "Sophia",
            location: "Seattle, WA",
            likes: 1892,
            comments: 145,
            shares: 67,
            bio: "Dancing between dreams and reality, my art captures the whispers of the soul in every brushstroke.",
            profileImage: "friend2",
            followers: 178,
            artsCount: 15
        ),
        ArtPost(
            imageName: "Art6",
            title: "Abstract Emotions Flow Through My Brush, Creating a World of Wonder",
            artist: "Lucas",
            location: "Austin, TX",
            likes: 2156,
            comments: 178,
            shares: 89,
            bio: "Abstract art is my language of emotions, where chaos meets harmony in a dance of colors.",
            profileImage: "friend3",
            followers: 334,
            artsCount: 24
        ),
        ArtPost(
            imageName: "Art7",
            title: "Dreams in Watercolor Come Alive, Painting Stories of Hope and Dreams",
            artist: "Isabella",
            location: "Portland, OR",
            likes: 1678,
            comments: 134,
            shares: 56,
            bio: "Watercolors flow like dreams, each painting a window into a world of endless possibilities.",
            profileImage: "friend1",
            followers: 267,
            artsCount: 19
        ),
        ArtPost(
            imageName: "Art8",
            title: "Urban Reflections in My Mind, Captured Through Colors and Light",
            artist: "Noah",
            location: "Boston, MA",
            likes: 1987,
            comments: 167,
            shares: 78,
            bio: "City life inspires my art, where urban chaos meets artistic harmony in every piece.",
            profileImage: "friend2",
            followers: 198,
            artsCount: 16
        ),
        ArtPost(
            imageName: "Art9",
            title: "Nature's Whisper in Every Stroke, Bringing the Outdoors to Life",
            artist: "Olivia",
            location: "Denver, CO",
            likes: 2456,
            comments: 189,
            shares: 94,
            bio: "Nature's beauty flows through my brush, bringing the outdoors to life on canvas.",
            profileImage: "friend3",
            followers: 389,
            artsCount: 28
        ),
        ArtPost(
            imageName: "Art10",
            title: "Digital Dreams Come to Life, Blending Reality with Imagination",
            artist: "Ethan",
            location: "San Francisco, CA",
            likes: 2789,
            comments: 234,
            shares: 112,
            bio: "Where technology meets creativity, I blend digital and traditional art to create new worlds.",
            profileImage: "friend1",
            followers: 512,
            artsCount: 35
        ),
        ArtPost(
            imageName: "Art11",
            title: "Melancholy in Motion, Dancing Through the Canvas with Grace",
            artist: "Ava",
            location: "Nashville, TN",
            likes: 1678,
            comments: 145,
            shares: 67,
            bio: "Emotions dance across my canvas, telling stories of life's beautiful complexities.",
            profileImage: "friend2",
            followers: 223,
            artsCount: 21
        )
    ]
} 
