//
//  ContentView.swift
//  SwiftUICustomTabs
//
//  Created by Arun Jayasree Kumar on 03/08/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
//            CustomTabView(
            
            TabView {
                SampleView(title: "Welcome")
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                SegmentedView()
                    .tabItem {
                        Image(systemName: "pencil.circle.fill")
                        Text("Tabs")
                    }
                SampleView(title: "Settings")
                    .tabItem {
                        Image(systemName: "trash")
                        Text("Trash")
                    }
            }
            .navigationBarTitle("Hello")
            .navigationBarColor(backgroundColor: #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1), foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SegmentedView: View {
    @State var selectedSegment: Int = 0
    var body: some View {
        ZStack {
            CustomTabView(selectedItem: $selectedSegment) {
                TabView(selection: $selectedSegment,
                        content:  {
                            SampleView(title: "Home")
                                .tag(0)
                            SampleView(title: "Pensile")
                                .tag(1)
                            SampleView(title: "Home")
                                .tag(2)
                        })
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
