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
//    static var previews: some View {
//        Group {
//            CouponFolderRow(folder: Folder())
//        }.previewLayout(.fixed(width: 300, height: 70))
//    }
//}
