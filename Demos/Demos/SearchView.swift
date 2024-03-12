//
//  SearchView.swift
//  Demos
//
//  Created by Suraj Bhujbal on 23/02/24.
//

import SwiftUI

struct SearchView: View {
    @Binding var text: String

    var body: some View {
            HStack {
                TextField("Search", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
            }
            .padding(.top)
            .background(Color.white)
            .ignoresSafeArea()
        }
    }

extension SearchView {
    private func textDidChange(_ searchText: String) {
        self.text = searchText
    }
}
