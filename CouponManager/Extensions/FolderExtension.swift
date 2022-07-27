//
//  FolderExtension.swift
//  CouponManager
//
//  Created by hyperbora on 2022/07/25.
//

import Foundation
import SwiftUI
import CoreData

extension Folder {
    var folderImageName: String {
        if self.folderType == .recyclebin {
            return "trash"
        } else {
            return "folder"
        }
    }
    var count: String {
        get {
            self.count_?.description ?? "0"
        }
    }
    var folderType: FolderType {
        switch self.type_ {
        case "recyclebin":
            return FolderType.recyclebin
        default:
            return FolderType.folder
        }
    }
}

extension FetchedResults where Result: Folder {
    func remove(atOffsets: IndexSet, context: NSManagedObjectContext) {
        
    }
    func move(fromOffsets: IndexSet, toOffset: Int, context: NSManagedObjectContext) {
        
    }
    func addRecyclebin(context: NSManagedObjectContext) {
        
    }
}

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
