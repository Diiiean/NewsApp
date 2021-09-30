import UIKit

class NewsTableViewCellViewModel {
    let title: String
    let subtitle: String
    let publishedAt: String
    let imageURL: URL?
    var imageData: Data? = nil
    
    init(
        title: String,
        subtitle: String,
        imageURL: URL?, publishedAt: String
    ) {
        self.title = title
        self.subtitle = subtitle
        self.imageURL = imageURL
        self.publishedAt = publishedAt
    }
}
