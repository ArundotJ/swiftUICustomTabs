//
//  CustomTabView.swift
//  SwiftUICustomTabs
//
//  Created by Arun Jayasree Kumar on 03/08/21.
//

import SwiftUI

struct CustomTabView<Content: View>: View {
    
    var content: () -> Content
    @Binding var isSelected: Int
    
    init(selectedItem: Binding<Int> , @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self._isSelected = selectedItem
    }
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1))
                .ignoresSafeArea()
            GeometryReader { geo in
                VStack(spacing: 0) {
                    Tabs(geoWidth: geo.size.width, fixed: true, tabs: [
                        Tab(title: "Hello"),
                        Tab(title: "Dear"),
                        Tab(title: "Mathon"),
                    ], selectedTab: $isSelected)
                    self.content()
                }
            }
        }
    }
}

struct SampleView: View {
    var title: String
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
                .ignoresSafeArea()
            Text(title)
                .font(.headline)
        }
    }
}

//struct CustomTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTabView()
//    }
//}
