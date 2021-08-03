//
//  NavigationBarAppearence.swift
//  SwiftUICustomTabs
//
//  Created by Arun Jayasree Kumar on 03/08/21.
//

import Foundation
import SwiftUI

struct NavigationBarAppearance: ViewModifier {
    
    init(backgroundColor: UIColor, foregroundColor: UIColor, hideShadow: Bool, tintColor: UIColor?) {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: foregroundColor]
        navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: foregroundColor]
        navigationBarAppearance.backgroundColor = backgroundColor
        if hideShadow {
            navigationBarAppearance.shadowColor = .clear
        }
        
        
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        if let tintColor = tintColor {
            UINavigationBar.appearance().tintColor = tintColor
        }
    }
    
    func body(content: Content) -> some View {
        content
    }
}

extension View {
    func navigationBarColor(
        backgroundColor: UIColor,
        foregroundColor: UIColor,
        hideShadow: Bool = false,
        tintColor: UIColor? = nil) -> some View {
        self.modifier(NavigationBarAppearance(
                        backgroundColor: backgroundColor,
                        foregroundColor: foregroundColor,
                        hideShadow: hideShadow,
                        tintColor: tintColor))
    }
}


