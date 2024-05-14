//
//  String+Ext.swift
//  OpeninApp
//
//  Created by Avi Kheni on 05/05/24.
//

import Foundation

extension String {
    func toDateFormatted() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        guard let date = dateFormatter.date(from: self) else {
            return nil
        }

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd MMM yyyy"
        return outputFormatter.string(from: date)
    }
}
