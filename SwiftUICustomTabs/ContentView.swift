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
            TabView {
                SampleView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                            .bold()
                    }
                SampleView()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                            .bold()
                    }
                SegmentedView()
                    .tabItem {
                        Image(systemName: "folder.fill.badge.gear")
                        Text("Menu")
                            .bold()
                    }
                
            }
            .navigationBarTitle("Hello", displayMode: .inline)
            .navigationBarColor(backgroundColor: #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1), foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SampleView: View {
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1))
            Text("Hello World")
        }
    }
}

struct SegmentedView: View {
    @State var selectedSegment: Int = 0
    var body: some View {
        ZStack {
            SegmentedTabView(selectedItem: $selectedSegment, tabs: [
                TabItem(title: "Today", image: Image(systemName: "person.fill")),
                TabItem(title: "Weekly", image: Image(systemName: "person.fill")),
                TabItem(title: "Monthly", image: Image(systemName: "person.fill")),
                TabItem(title: "Daily", image: Image(systemName: "person.fill")),
            ]) {
                TabView(selection: $selectedSegment,
                        content:  {
                            SampleView()
                                .tag(0)
                            SampleView()
                                .tag(1)
                            SampleView()
                                .tag(2)
                            SampleView()
                                .tag(3)
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
