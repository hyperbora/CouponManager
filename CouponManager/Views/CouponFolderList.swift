//
//  CouponFolderList.swift
//  CouponManager
//
//  Created by hyperbora on 2022/06/25.
//

import SwiftUI
import CoreData

struct CouponFolderList: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var showAlert = false
    @State var folderName: String = ""
    @State private var editMode: EditMode = .inactive
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Folder.seq, ascending: true)],
        animation: .default)
    private var folders: FetchedResults<Folder>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(folders) { folder in
                    NavigationLink(destination: Text("detail")) {
                        CouponFolderRow(folder: folder, edited: editMode == .active)
                            .gesture(editMode == .active ? tap : nil)
                    }
                    .moveDisabled(folder.type == .recyclebin)
                    .deleteDisabled(folder.type == .recyclebin)
                }
                .onDelete { indexSet in
                    withAnimation {
                        folders.remove(atOffsets: indexSet, context: viewContext)
                    }
                }
                .onMove { indexSet, newOffset in
                    withAnimation {
                        folders.move(fromOffsets: indexSet, toOffset: newOffset, context: viewContext)
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
                .onAppear {
                    if (folders.isEmpty) {
                        folders.addRecyclebin(context: viewContext)
                    }
                }
                .environment(\.editMode, $editMode)
        }.textFieldAlert(
            isPresented: $showAlert,
            title: "New Folder".localized,
            text: $folderName,
            placeholder: "Name".localized) { text in
                folders.addFolder(folderName: text, context: viewContext)
            }
    }
    
    var tap: some Gesture {
        TapGesture().onEnded {}
    }
}

struct CouponView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 13", "iPhone SE (3rd generation)"], id: \.self) { deviceName in
            CouponFolderList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }.environment(\.locale, .init(identifier: "ko"))
    }
}
