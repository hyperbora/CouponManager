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
        if self.type == .recyclebin {
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
    var type: FolderType {
        get {
            switch self.type_ {
            case "recyclebin":
                return .recyclebin
            default:
                return .folder
            }
        }
        set {
            if newValue == .recyclebin {
                self.type_ = "recyclebin"
            } else {
                self.type_ = "folder"
            }
        }
    }
}

extension FetchedResults where Result: Folder {
    func remove(atOffsets: IndexSet, context: NSManagedObjectContext) {
        atOffsets.map { self[$0] }.forEach(context.delete)
        try? context.save()
    }
    func move(fromOffsets: IndexSet, toOffset: Int, context: NSManagedObjectContext) {
        var copyArray = self.map{ $0 }
        copyArray.move(fromOffsets: fromOffsets, toOffset: toOffset)
        let sortedArray = copyArray.enumerated().sorted {
            if $0.element.type == .recyclebin {
                return false
            }
            if $1.element.type == .recyclebin {
                return true
            }
            return $0.offset < $1.offset
        }.map { $0.element }
        for i in 0..<sortedArray.count {
            sortedArray[i].seq = NSDecimalNumber(value: i)
        }
        try? context.save()
    }
    func addRecyclebin(context: NSManagedObjectContext) {
        let folder = Folder(context: context)
        folder.id = UUID()
        folder.name = "recyclebin".localized
        folder.seq = 0
        folder.type = .recyclebin
        folder.count_ = 0
        try? context.save()
    }
    func addFolder(folderName: String, context: NSManagedObjectContext) {
        if let lastFolder = self.last {
            let folder = Folder(context: context)
            folder.id = UUID()
            folder.name = folderName
            folder.seq = lastFolder.seq
            folder.type = .folder
            folder.count_ = 0
            lastFolder.seq = lastFolder.seq?.adding(1)
            try? context.save()
        }
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
