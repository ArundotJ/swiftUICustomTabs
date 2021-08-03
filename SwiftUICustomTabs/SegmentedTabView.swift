//
//  SegmentedTabView.swift
//  SwiftUICustomTabs
//
//  Created by Arun Jayasree Kumar on 03/08/21.
//

import SwiftUI

struct SegmentedTabView<Content: View>: View {
    
    var tabs:[TabItem]
    var content: () -> Content
    @Binding var isSelected: Int
    var backGroundColor: UIColor
    
    init(selectedItem: Binding<Int>, tabs: [TabItem], backgroundColor: UIColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self._isSelected = selectedItem
        self.tabs = tabs
        self.backGroundColor = backgroundColor
    }
    var body: some View {
        ZStack {
            GeometryReader { geo in
                VStack(spacing: 0) {
                    Tabs(backgroundColor: backGroundColor, geoWidth: geo.size.width, fixed: true, tabs: tabs, selectedTab: $isSelected)
                    self.content()
                }
            }
        }
    }
}

struct TabItem {
    var title: String
    var image: Image?
    
    init(title: String, image: Image? = nil) {
        self.title = title
        self.image = image
    }
}

struct Tabs: View {
    var backgroundColor: UIColor
    var geoWidth: CGFloat
    var fixed: Bool = true
    var tabs: [TabItem]
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
                                        HStack(spacing: 5) {
                                            if let image = tabs[index].image {
                                                AnyView(image)
                                                    .foregroundColor(selectedTab == index ? Color.white : Color.gray)
                                            }
                                            Text(tabs[index].title)
                                                .font(selectedTab == index ? .headline: .subheadline)
                                                .foregroundColor(selectedTab == index ? Color.white : Color.gray)
                                        }
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
                        withAnimation {
                            proxy.scrollTo(target)
                        }
                    }
                }
                .frame(maxHeight: .infinity)
            }
        }
        .frame(height: 60)
        .onAppear(perform: {
            UIScrollView.appearance().backgroundColor = backgroundColor
            UIScrollView.appearance().bounces = fixed ? false : true
        })
        .onDisappear(perform: {
            UIScrollView.appearance().bounces = false
        })
    }
}
