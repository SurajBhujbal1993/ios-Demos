//
//  ImageScrollable.swift
//  Demos
//
//  Created by Suraj Bhujbal on 23/02/24.
//

import SwiftUI

struct ImageScrollable: View {
    let images: [String]
      @Binding var selectedIndex: Int

      var body: some View {
          VStack{
              TabView(selection: $selectedIndex) {
                  if images.count > 0{
                      ForEach(0..<images.count, id: \.self) { index in
                          Image(systemName: images[index])
                              .resizable()
                              .scaledToFit()
                      }
                  }else{
                      Image(systemName: "photo.circle.fill")
                          .resizable()
                          .scaledToFit()
                  }
              }
          }
          .tabViewStyle(PageTabViewStyle())
          .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
      }
}

