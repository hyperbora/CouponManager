//
//  CouponFolderRow.swift
//  CouponManager
//
//  Created by hyperbora on 2022/06/30.
//

import SwiftUI


struct CouponFolderRow: View {
    @ObservedObject var folder: Folder
    
    var body: some View {
        HStack {
            Image(systemName: folder.folderImageName).frame(width: 20, height: 20)
            Text(folder.name ?? "")
            Spacer()
            Text(folder.count)
        }
    }
}

//struct CouponFolderRow_Previews: PreviewProvider {
//    static var store = getStore()
//    static func getStore() -> FolderStore {
//        let store = FolderStore()
//        store.addFolder(folderName: "Amazon")
//        store.addFolder(folderName: "Ebay")
//        return store
//    }
//
//    static var previews: some View {
//
//        Group {
//            if let name = store.folders.first?.folderName, let imageName = store.folders.first?.folderType.description, let count =
//                store.folders.first?.count {
//                CouponFolderRow(name: name, folderImageName: imageName, count: String(count))
//            }
//            if let name = store.folders.last?.folderName, let imageName = store.folders.last?.folderType.description, let count = store.folders.last?.count {
//                CouponFolderRow(name: name, folderImageName: imageName, count: String(count))
//            }
//        }.previewLayout(.fixed(width: 300, height: 70))
//    }
//}
