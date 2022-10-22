//
//  ContentView.swift
//  Instagram
//
//  Created by Kris on 10/22/22.
//

import SwiftUI

struct ContentView: View
{
    @EnvironmentObject var vm: StoreData
    
    @State private var selectedTab: Tab = .Home
    
    init() {
        UITabBar.appearance().backgroundColor = .systemBackground
    }
    
    var body: some View
    {
        GeometryReader { proxy in
            let width = proxy.size.width / 2.4
            
            NavigationView
            {
                TabView(selection: $selectedTab)
                {
                    VStack
                    {
                        NavigationBar(width: width)
                        ScrollView(showsIndicators: false)
                        {
                            NewsView()
                                .environmentObject(vm)
                            StoryView()
                                .environmentObject(vm)
                            PostView(width: width)
                                .environmentObject(vm)
                        }
                    }
                    .tag(Tab.Home)
                    .tabItem { Label(Tab.Home.label, systemImage: Tab.Home.tabIcon) }
                    .navigationBarHidden(true)
                    
                    VStack
                    {
                        
                    }
                    .tag(Tab.Search)
                    .tabItem { Label(Tab.Search.label, systemImage: Tab.Search.tabIcon) }
                    
                    VStack
                    {
                        
                    }
                    .tag(Tab.Camera)
                    .tabItem { Label(Tab.Camera.label, systemImage: Tab.Camera.tabIcon) }
                    
                    VStack
                    {
                        
                    }
                    .tag(Tab.Notification)
                    .tabItem { Label(Tab.Notification.label, systemImage: Tab.Notification.tabIcon) }
                    
                    VStack
                    {
                        
                    }
                    .tag(Tab.Profile)
                    .tabItem { Label(Tab.Profile.label, systemImage: Tab.Profile.tabIcon) }
                }
            }
        }
    }
}

// MARK: - Tab
enum Tab: Hashable {
    case Home
    case Search
    case Camera
    case Notification
    case Profile
    
    var tabIcon: String {
        switch self {
        case .Home:
            return "house"
        case .Search:
            return "magnifyingglass"
        case .Camera:
            return "camera"
        case .Notification:
            return "bell"
        case .Profile:
            return "person"
        }
    }
    
    var label: LocalizedStringKey {
        switch self {
        case .Home:
            return LocalizedStringKey("Home")
        case .Search:
            return LocalizedStringKey("Search")
        case .Camera:
            return LocalizedStringKey("Post")
        case .Notification:
            return LocalizedStringKey("Notification")
        case .Profile:
            return LocalizedStringKey("Profile")
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider
{
    static let vm = StoreData()
    
    static var previews: some View
    {
        ContentView()
            .environmentObject(vm)
    }
}
