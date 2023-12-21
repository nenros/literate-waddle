//
//  SidebarView.swift
//  Ultimate portfolio
//
//  Created by Bartosz Markowski on 11/12/2023.
//

import SwiftUI

struct SidebarView: View {
    @EnvironmentObject var dataController: DataController
    let smartFilters: [Filter] = [.all, .recent]
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var tags: FetchedResults<Tag>
    
    var tagFilters: [Filter] {
        tags.map { tag in
            Filter(id: tag.id ?? UUID(), name: tag.name ?? "No name", icon: "tag", tag: tag)
        }
    }
    
    var body: some View {
        List(selection: $dataController.selectedFilter) {
            Section("Smart Filters") {
                ForEach(smartFilters) { filter in
                    NavigationLink(value: filter) {
                        Label(filter.name, systemImage: filter.icon)
                    }
                }
            }
            
            Section("Tags") {
                ForEach(tagFilters) { filter in
                    NavigationLink(value: filter) {
                        Label(filter.name, systemImage: filter.icon)
                    }
                }
            }
            
        }
        .toolbar(content: {
            Button {
                dataController.deleteAll()
                dataController.createSampleDate()
            } label: {
                Label("Add samples", systemImage: "flame")
            }
        })
    }
        
}

#Preview {
    SidebarView()
        .environmentObject(DataController.preview)
}
