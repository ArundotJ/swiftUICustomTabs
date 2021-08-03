//
//  Tabs.swift
//  SwiftUICustomTabs
//
//  Created by Arun Jayasree Kumar on 03/08/21.
//

import Foundation
import SwiftUI

struct Tab {
    let title: String
}

struct Tabs: View {
    var geoWidth: CGFloat
    var fixed: Bool = true
    var tabs: [Tab]
    @Binding var selectedTab: Int
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        ForEach(0..<tabs.count, id: \.self) { index in
                            VStack(spacing: 0) {
                                Button(action: {
                                    withAnimation {
                                        selectedTab = index
                                    }
                                }, label: {
                                    VStack() {
                                        Text(tabs[index].title)
                                            .font(selectedTab == index ? .headline: .subheadline)
                                            .foregroundColor(selectedTab == index ? Color.white : Color.gray)
                                    }
                                    .frame(width: fixed ? (geoWidth / CGFloat(tabs.count)) : .none, height: 57)
                                })
                                Capsule()
                                    .fill(selectedTab == index ? Color.white : Color.clear)
                                    .frame(height: 3)
                            }
                            .fixedSize()
                        }
                    }
                    .onChange(of: selectedTab) { target in
                        proxy.scrollTo(target)
                    }
                }
                .frame(maxHeight: .infinity)
            }
        }
        .frame(height: 60)
        .onAppear(perform: {
            UIScrollView.appearance().backgroundColor = UIColor(#colorLiteral(red: 0.6196078431, green: 0.1098039216, blue: 0.2509803922, alpha: 1))
            UIScrollView.appearance().bounces = fixed ? false : true
        })
        .onDisappear(perform: {
            UIScrollView.appearance().bounces = false
        })
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs(
            geoWidth: 300, fixed: true,
            tabs: [
                Tab(title: "Section1"),
                Tab(title: "Section2"),
                Tab(title: "Section3"),
                Tab(title: "Section1"),
                Tab(title: "Section2"),
                Tab(title: "Section3"),
            ],
            selectedTab: Binding.constant(0))
            .previewLayout(.sizeThatFits)
    }
}
