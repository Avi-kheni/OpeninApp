//
//  HomeViewModel.swift
//  OpeninApp
//
//  Created by Avi Kheni on 05/05/24.
//

import Foundation
import SwiftUI

final class HomeViewModel : ObservableObject {
    @Published var homeModel : DashboardDataModel?
    @Published var chartJsonString : String = ""
    
    
}

extension HomeViewModel {
    
    func  homeAPICall(onCompletion : @escaping (_ isSuccess : Bool,_ message :String) -> Void) {
        ApiManager.fetchData { isSuccess, responseData, message in
            if isSuccess {
                do {
                    let responseModel = try? JSONDecoder().decode(DashboardDataModel.self, from: responseData)
                    self.homeModel = responseModel
                    
                    
                    do {
                        let encoder = JSONEncoder()
                        encoder.keyEncodingStrategy = .convertToSnakeCase // Optional: Convert keys to snake_case
                        let jsonData = try encoder.encode(self.homeModel?.data?.overallUrlChart ?? OverallUrlChart())
                        if let jsonString = String(data: jsonData, encoding: .utf8) {
                            self.chartJsonString = jsonString == "{}" ? "" : jsonString
                            
                            print("self.chartJsonString \(self.chartJsonString) :: \(jsonString == "{}")")
                        } else {
                            print("Error converting to JSON string")
                        }
                    } catch {
                        
                    }
                    onCompletion(true, self.homeModel?.message ?? "")
                }
            } else {
                onCompletion(false, message)
            }
        }
    }

}
