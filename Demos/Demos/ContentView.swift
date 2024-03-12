//
//  ContentView.swift
//  Demos
//
//  Created by Suraj Bhujbal on 23/02/24.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var selectedImageIndex = 0
    @State private var listOffset: CGFloat = 0
    
    let images: [String] = ["books.vertical.circle.fill", "trash.slash", "externaldrive.fill.badge.minus"]
    let listItems: [String] = ["Item 1", "Item 2", "Item 3","Item 4", "Item 5", "Item 6"]
    var body: some View {
        VStack{
            
            ImageScrollable(images: images, selectedIndex: $selectedImageIndex)
                .frame(height: 203)               
            SearchView(text: $searchText)
            
            List(listItems.filter {
                searchText.isEmpty ? true : $0.localizedCaseInsensitiveContains(searchText)
            }, id: \.self) { listItem in
                HStack{
                    if let index = listItems.firstIndex(of: listItem){
                        if !images.isEmpty{
                            if index < images.count{
                                Image(systemName: images[index])
                            }else{
                                Image(systemName: "photo.circle.fill")
                            }
                        }else{
                            Image(systemName: "photo.circle.fill")
                        }
                    }
                    Text(listItem)
                }
                
            }
            .offset(y: -listOffset)
        }
        .onAppear {
                  UITableView.appearance().showsVerticalScrollIndicator = false
              }
              .onDisappear {
                  UITableView.appearance().showsVerticalScrollIndicator = true
              }
              .gesture(DragGesture().onChanged { value in
                  self.listOffset = max(value.translation.height, 0)
              })
        
    }
    
    
}





#Preview {
    ContentView()
}
