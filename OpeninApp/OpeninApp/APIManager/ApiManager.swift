//
//  ApiManager.swift
//  OpeninApp
//
//  Created by Avi Kheni on 05/05/24.
//

import Foundation

class ApiManager {
    static func fetchData(onCompletion : @escaping ( _ isSuccess : Bool , _ responseData : Data ,_ message : String) -> Void) {
        // 1. Construct the URL for the API endpoint
        let urlString = ConstantValue.apiURL
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            onCompletion(false,Data(),"Check your URL!")
            return
        }

        // 2. Create a URLRequest with the constructed URL
        var request = URLRequest(url: url)

        // 3. Set the "Authorization" header with the bearer token
        let bearerToken =  ConstantValue.token
        request.setValue("Bearer \(bearerToken)", forHTTPHeaderField: "Authorization")

        // 4. Use URLSession to send the request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // 5. Handle the response and any errors
            if let error = error {
                print("Error: \(error)")
                onCompletion(false,Data(),error.localizedDescription)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response")
                onCompletion(false,Data(),error?.localizedDescription ?? "Something went Wrong")
                return
            }

            if let data = data {
                onCompletion(true,data,"Success")
            }
        }

        task.resume()
    }



}
