//
//  DashboardModel.swift
//  Promo
//
//  Created by Avi Kheni on 05/05/24.
//

import Foundation

struct DashboardDataModel: Codable {
    var status: Bool? = nil
    var statusCode: Int? = nil
    var message: String? = nil
    var supportWhatsappNumber: String? = nil
    var extraIncome: Double? = nil
    var totalLinks: Int? = nil
    var totalClicks: Int? = nil
    var todayClicks: Int? = nil
    var topSource: String? = nil
    var topLocation: String? = nil
    var startTime: String? = nil
    var linksCreatedToday: Int? = nil
    var appliedCampaign: Int? = nil
    var data: DashboardData? = DashboardData()

    enum CodingKeys: String, CodingKey {
        case status
        case statusCode
        case message
        case supportWhatsappNumber = "support_whatsapp_number"
        case extraIncome = "extra_income"
        case totalLinks = "total_links"
        case totalClicks = "total_clicks"
        case todayClicks = "today_clicks"
        case topSource = "top_source"
        case topLocation = "top_location"
        case startTime
        case linksCreatedToday = "links_created_today"
        case appliedCampaign = "applied_campaign"
        case data
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        statusCode = try values.decodeIfPresent(Int.self, forKey: .statusCode)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        supportWhatsappNumber = try values.decodeIfPresent(String.self, forKey: .supportWhatsappNumber)
        extraIncome = try values.decodeIfPresent(Double.self, forKey: .extraIncome)
        totalLinks = try values.decodeIfPresent(Int.self, forKey: .totalLinks)
        totalClicks = try values.decodeIfPresent(Int.self, forKey: .totalClicks)
        todayClicks = try values.decodeIfPresent(Int.self, forKey: .todayClicks)
        topSource = try values.decodeIfPresent(String.self, forKey: .topSource)
        topLocation = try values.decodeIfPresent(String.self, forKey: .topLocation)
        startTime = try values.decodeIfPresent(String.self, forKey: .startTime)
        linksCreatedToday = try values.decodeIfPresent(Int.self, forKey: .linksCreatedToday)
        appliedCampaign = try values.decodeIfPresent(Int.self, forKey: .appliedCampaign)
        data = try values.decodeIfPresent(DashboardData.self, forKey: .data)
    }

    init() {}
}

struct DashboardData: Codable {
    var recentLinks: [RecentLinks]? = []
    var topLinks: [TopLinks]? = []
    var favouriteLinks: [String]? = []
    var overallUrlChart: OverallUrlChart? = OverallUrlChart()

    enum CodingKeys: String, CodingKey {
        case recentLinks = "recent_links"
        case topLinks = "top_links"
        case favouriteLinks = "favourite_links"
        case overallUrlChart = "overall_url_chart"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        recentLinks = try values.decodeIfPresent([RecentLinks].self, forKey: .recentLinks)
        topLinks = try values.decodeIfPresent([TopLinks].self, forKey: .topLinks)
        favouriteLinks = try values.decodeIfPresent([String].self, forKey: .favouriteLinks)
        overallUrlChart = try values.decodeIfPresent(OverallUrlChart.self, forKey: .overallUrlChart)
    }

    init() {}
}

struct RecentLinks: Codable , Identifiable{
    var id = UUID()
    var urlId: Int? = nil
    var webLink: String? = nil
    var smartLink: String? = nil
    var title: String? = nil
    var totalClicks: Int? = nil
    var originalImage: String? = nil
    var thumbnail: String? = nil
    var timesAgo: String? = nil
    var createdAt: String? = nil
    var domainId: String? = nil
    var urlPrefix: String? = nil
    var urlSuffix: String? = nil
    var app: String? = nil
    var isFavourite: Bool? = nil

    enum CodingKeys: String, CodingKey {
        case urlId = "url_id"
        case webLink = "web_link"
        case smartLink = "smart_link"
        case title
        case totalClicks = "total_clicks"
        case originalImage = "original_image"
        case thumbnail
        case timesAgo = "times_ago"
        case createdAt = "created_at"
        case domainId = "domain_id"
        case urlPrefix = "url_prefix"
        case urlSuffix = "url_suffix"
        case app
        case isFavourite = "is_favourite"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        urlId = try values.decodeIfPresent(Int.self, forKey: .urlId)
        webLink = try values.decodeIfPresent(String.self, forKey: .webLink)
        smartLink = try values.decodeIfPresent(String.self, forKey: .smartLink)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        totalClicks = try values.decodeIfPresent(Int.self, forKey: .totalClicks)
        originalImage = try values.decodeIfPresent(String.self, forKey: .originalImage)
        thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
        timesAgo = try values.decodeIfPresent(String.self, forKey: .timesAgo)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        domainId = try values.decodeIfPresent(String.self, forKey: .domainId)
        urlPrefix = try values.decodeIfPresent(String.self, forKey: .urlPrefix)
        urlSuffix = try values.decodeIfPresent(String.self, forKey: .urlSuffix)
        app = try values.decodeIfPresent(String.self, forKey: .app)
        isFavourite = try values.decodeIfPresent(Bool.self, forKey: .isFavourite)
    }

    init() {}
}

struct TopLinks: Codable , Identifiable{
    var id = UUID()
    var urlId: Int? = nil
    var webLink: String? = nil
    var smartLink: String? = nil
    var title: String? = nil
    var totalClicks: Int? = nil
    var originalImage: String? = nil
    var thumbnail: String? = nil
    var timesAgo: String? = nil
    var createdAt: String? = nil
    var domainId: String? = nil
    var urlPrefix: String? = nil
    var urlSuffix: String? = nil
    var app: String? = nil
    var isFavourite: Bool? = nil

    enum CodingKeys: String, CodingKey {
        case urlId = "url_id"
        case webLink = "web_link"
        case smartLink = "smart_link"
        case title
        case totalClicks = "total_clicks"
        case originalImage = "original_image"
        case thumbnail
        case timesAgo = "times_ago"
        case createdAt = "created_at"
        case domainId = "domain_id"
        case urlPrefix = "url_prefix"
        case urlSuffix = "url_suffix"
        case app
        case isFavourite = "is_favourite"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        urlId = try values.decodeIfPresent(Int.self, forKey: .urlId)
        webLink = try values.decodeIfPresent(String.self, forKey: .webLink)
        smartLink = try values.decodeIfPresent(String.self, forKey: .smartLink)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        totalClicks = try values.decodeIfPresent(Int.self, forKey: .totalClicks)
        originalImage = try values.decodeIfPresent(String.self, forKey: .originalImage)
        thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
        timesAgo = try values.decodeIfPresent(String.self, forKey: .timesAgo)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        domainId = try values.decodeIfPresent(String.self, forKey: .domainId)
        urlPrefix = try values.decodeIfPresent(String.self, forKey: .urlPrefix)
        urlSuffix = try values.decodeIfPresent(String.self, forKey: .urlSuffix)
        app = try values.decodeIfPresent(String.self, forKey: .app)
        isFavourite = try values.decodeIfPresent(Bool.self, forKey: .isFavourite)
    }

    init() {}
}

struct OverallUrlChart: Codable, Identifiable {
    var id = UUID()
    
    var zero: Int? = nil
    var one: Int? = nil
    var two: Int? = nil
    var three: Int? = nil
    var four: Int? = nil
    var five: Int? = nil
    var six: Int? = nil
    var seven: Int? = nil
    var eight: Int? = nil
    var nine: Int? = nil
    var ten: Int? = nil
    var eleven: Int? = nil
    var twelve: Int? = nil
    var thirteen: Int? = nil
    var fourteen: Int? = nil
    var fifteen: Int? = nil
    var sixteen: Int? = nil
    var seventeen: Int? = nil
    var eighteen: Int? = nil
    var nineteen: Int? = nil
    var twenty: Int? = nil
    var twentyOne: Int? = nil
    var twentyTwo: Int? = nil
    var twentyThree: Int? = nil

    

   



    enum CodingKeys: String, CodingKey {
        case zero = "00:00"
        case one = "01:00"
        case two = "02:00"
        case three = "03:00"
        case four = "04:00"
        case five = "05:00"
        case six = "06:00"
        case seven = "07:00"
        case eight = "08:00"
        case nine = "09:00"
        case ten = "10:00"
        case eleven = "11:00"
        case twelve = "12:00"
        case thirteen = "13:00"
        case fourteen = "14:00"
        case fifteen = "15:00"
        case sixteen = "16:00"
        case seventeen = "17:00"
        case eighteen = "18:00"
        case nineteen = "19:00"
        case twenty = "20:00"
        case twentyOne = "21:00"
        case twentyTwo = "22:00"
        case twentyThree = "23:00"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        zero = try values.decodeIfPresent(Int.self, forKey: .zero)
        one = try values.decodeIfPresent(Int.self, forKey: .one)
        two = try values.decodeIfPresent(Int.self, forKey: .two)
        three = try values.decodeIfPresent(Int.self, forKey: .three)
        four = try values.decodeIfPresent(Int.self, forKey: .four)
        five = try values.decodeIfPresent(Int.self, forKey: .five)
        six = try values.decodeIfPresent(Int.self, forKey: .six)
        seven = try values.decodeIfPresent(Int.self, forKey: .seven)
        eight = try values.decodeIfPresent(Int.self, forKey: .eight)
        nine = try values.decodeIfPresent(Int.self, forKey: .nine)
        ten = try values.decodeIfPresent(Int.self, forKey: .ten)
        eleven = try values.decodeIfPresent(Int.self, forKey: .eleven)
        twelve = try values.decodeIfPresent(Int.self, forKey: .twelve)
        thirteen = try values.decodeIfPresent(Int.self, forKey: .thirteen)
        fourteen = try values.decodeIfPresent(Int.self, forKey: .fourteen)
        fifteen = try values.decodeIfPresent(Int.self, forKey: .fifteen)
        sixteen = try values.decodeIfPresent(Int.self, forKey: .sixteen)
        seventeen = try values.decodeIfPresent(Int.self, forKey: .seventeen)
        eighteen = try values.decodeIfPresent(Int.self, forKey: .eighteen)
        nineteen = try values.decodeIfPresent(Int.self, forKey: .nineteen)
        twenty = try values.decodeIfPresent(Int.self, forKey: .twenty)
        twentyOne = try values.decodeIfPresent(Int.self, forKey: .twentyOne)
        twentyTwo = try values.decodeIfPresent(Int.self, forKey: .twentyTwo)
        twentyThree = try values.decodeIfPresent(Int.self, forKey: .twentyThree)
    }

    init() {}
}


struct ChartData: Codable , Identifiable{
    var id = UUID()
       var hour: String
       var value: Int
   }
   
