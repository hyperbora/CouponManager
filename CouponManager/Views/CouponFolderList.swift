//
//  CouponFolderList.swift
//  CouponManager
//
//  Created by hyperbora on 2022/06/25.
//

import SwiftUI

struct CouponFolderList: View {
    @ObservedObject var store: FolderStore
    @State var showAlert = false
    @State var folderName: String = ""
    @State private var editMode: EditMode = .inactive
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.folders) { folder in
                    NavigationLink(destination: Text("detail")) {
                        CouponFolderRow(name: folder.folderName, folderImageName: folder.folderType.description, count: String(folder.count))
                            .gesture(editMode == .active ? tap : nil)
                    }
                    .moveDisabled(folder.folderType == .recyclebin)
                    .deleteDisabled(folder.folderType == .recyclebin)
                }
                .onDelete { indexSet in
                    store.folders.remove(atOffsets: indexSet)
                }
                .onMove { indexSet, newOffset in
                    if newOffset < store.folders.count - 1 {
                        store.folders.move(fromOffsets: indexSet, toOffset: newOffset)
                    }
                }
            }.navigationTitle("Coupon Folder")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            showAlert.toggle()
                        } label: {
                            Image(systemName: "folder.badge.plus")
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                }
                .environment(\.editMode, $editMode)
        }.textFieldAlert(
            isPresented: $showAlert,
            title: "New Folder".localized,
            text: $folderName,
            placeholder: "Name".localized) { text in
                store.addFolder(folderName: text)
            }
    }
    
    var tap: some Gesture {
        TapGesture().onEnded {}
    }
}

struct CouponView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 13", "iPhone SE (3rd generation)"], id: \.self) { deviceName in
            CouponFolderList(store: FolderStore())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }.environment(\.locale, .init(identifier: "ko"))
    }
}
