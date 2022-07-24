//
//  CouponModel.swift
//  CouponManager
//
//  Created by hyperbora on 2022/07/07.
//

import Foundation

struct CouponModel : Identifiable {
    let createdDate: Date
    var updatedDate: Date
    var startDate: Date?
    var endDate: Date?
    var couponName: String?
    var used: Bool
    var imageName: String?
    var couponCode: String?
    let id: String
    
    init(createdDate: Date, updatedDate: Date, startDate: Date?,
         endDate: Date?, couponName: String?, used: Bool,
         imageName: String?, couponCode: String?, id: String) {
        self.createdDate = createdDate
        self.updatedDate = updatedDate
        self.startDate = startDate
        self.endDate = endDate
        self.couponName = couponName
        self.used = false
        self.imageName = imageName
        self.couponCode = couponCode
        self.id = id
    }
    
    init?(startDate: Date?, endDate: Date?, couponName: String?,
         imageName: String?, couponCode: String?) {
        if imageName == nil && couponCode == nil {
            return nil
        } else {
            self.init(
                createdDate: Date()
                , updatedDate: Date()
                , startDate: startDate
                , endDate: endDate
                , couponName: couponName
                , used: false
                , imageName: imageName
                , couponCode: couponCode
                , id: UUID().uuidString
            )
        }
    }
}
