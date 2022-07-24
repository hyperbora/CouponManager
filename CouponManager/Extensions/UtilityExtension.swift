//
//  UtilityExtension.swift
//  CouponManager
//
//  Created by hyperbora on 2022/07/09.
//

import Foundation

extension Date {
    func getFormattedDate(format: String = "yyyy-MM-dd") -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
