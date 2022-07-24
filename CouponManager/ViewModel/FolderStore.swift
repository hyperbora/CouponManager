//
//  FolderStore.swift
//  CouponManager
//
//  Created by hyperbora on 2022/07/03.
//

import Foundation

class FolderStore: ObservableObject {
    @Published var folders = [CouponFolder]() {
        didSet {
            storeInCoreData()
        }
    }
    
    init() {
        restoreFromCoreData()
        if (folders.isEmpty) {
            let recyclebinFolder = CouponFolder(id: CouponFolder.Constants.recyclebinId,
                                                folderType: .recyclebin,
                                                folderName: "recyclebin".localized)
            folders.append(recyclebinFolder)
        }
    }
    
    private func restoreFromCoreData() {
        // TODO : restore folders from CoreData
    }
    
    private func storeInCoreData() {
        // TODO : store folders to CoreData
    }
    
    func addFolder(folderName: String) {
        let folder = CouponFolder(
            id: UUID().uuidString,
            folderType: .folder,
            folderName: folderName
        )
        folders.insert(folder, at: self.folders.count - 1)
    }
}
