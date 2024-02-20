import Foundation

// MARK: - Welcome
struct NewsResponse: Codable {
    let status, copyright: String
    let numResults: Int
    let results: [NewsResult]

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}

// MARK: - NewsResult
struct NewsResult: Codable {
    let uri: String
    let url: String
    let id, assetID: Int
    let publishedDate, updated, section, subsection: String
    let nytdsection, adxKeywords: String
    let byline: String
    let title, abstract: String
    let desFacet, orgFacet, perFacet, geoFacet: [String]
    let media: [NewMedia]
    let etaID: Int

    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetID = "asset_id"
        case publishedDate = "published_date"
        case updated, section, subsection, nytdsection
        case adxKeywords = "adx_keywords"
        case byline, title, abstract
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
        case etaID = "eta_id"
    }
}

// MARK: - Media
struct NewMedia: Codable {
    let caption, copyright: String
    let approvedForSyndication: Int
    let mediaMetadata: [NewsMediaMetadata]

    enum CodingKeys: String, CodingKey {
        case caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct NewsMediaMetadata: Codable {
    let url: String
}
struct NewsModel{
    let id:Int
    let category: String
    let title: String
    let byline: String
    let abstract: String
    let date: String
    let imageURL: String?
    let webURL: String?

    init(id: Int, category: String, title: String, byline: String, abstract: String, date: String, imageURL: String?, webURL: String?) {
        self.id = id
        self.category = category
        self.title = title
        self.byline = byline
        self.abstract = abstract
        self.date = date
        self.imageURL = imageURL
        self.webURL = webURL
    }
    
    init(newsData : NewsData){
        self.id = Int(newsData.id)
        self.category = newsData.category ?? ""
        self.title = newsData.title ?? ""
        self.byline = newsData.byline ?? ""
        self.abstract = newsData.abstract ?? ""
        self.date = newsData.date ?? ""
        self.imageURL = nil
        self.webURL = nil
    }
    
    init(newsResult : NewsResult){
        self.id = newsResult.id
        self.category = newsResult.section
        self.title = newsResult.title
        self.byline = newsResult.byline
        self.abstract = newsResult.abstract
        self.date = newsResult.publishedDate
        self.imageURL = newsResult.media.first?.mediaMetadata[1].url
        self.webURL = newsResult.url
    }
    
}
