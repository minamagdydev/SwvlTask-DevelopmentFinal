struct AllPhotos: Codable {
    let photos: Photos?
    let stat: String?
}

// MARK: - Photos
struct Photos: Codable {
    let page, pages, perpage: Int?
    let total: String?
    let photo: [Photo]?
}

// MARK: - Photo
struct Photo: Codable {
    let id, owner, secret, server: String?
    let farm: Int?
    let title: String?
    let ispublic, isfriend, isfamily: Int?
    var url: String {
       return "https://farm\(farm!).staticflickr.com/\(server!)/\(id!)_\(secret!).jpg"
    }
}
