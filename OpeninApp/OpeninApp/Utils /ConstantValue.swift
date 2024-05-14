//
//  ConstantValue.swift
//  OpeninApp
//
//  Created by Avi Kheni on 06/05/24.
//

import Foundation
final class ConstantValue {
    
    static let apiURL = "https://api.inopenapp.com/api/v1/dashboardNew"
   static let  token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"
    
   static func getGreetingForTimeOfDay() -> String {
        let now = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: now)
        
        switch hour {
        case 6..<12:
            return "Good morning!"
        case 12..<18:
            return "Good afternoon!"
        case 18..<22:
            return "Good evening!"
        default:
            return "Good night!"
        }
    }
}
enum TitleText :String {
    case topLinks  = "Top Links"
    case recentLinks  = "Recent Links"
    case clicks = "Clicks"
    case overView = "Overview"
    case dashBoard = "Dashboard"
    case hey = "Hey 👋"
}
