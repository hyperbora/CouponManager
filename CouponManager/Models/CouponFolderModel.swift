//
//  CouponFolderModel.swift
//  CouponManager
//
//  Created by hyperbora on 2022/07/02.
//

import Foundation

struct CouponFolder: Identifiable {
    enum FolderType : CustomStringConvertible {
        case folder
        case recyclebin
        
        var description: String {
            switch self {
            case .folder:
                return "folder"
            case .recyclebin:
                return "trash"
            }
        }
    }
    var id: String
    var folderType: FolderType
    var folderName: String
    var count: UInt = 0
    struct Constants {
        static let recyclebinId = "0"
    }
}
