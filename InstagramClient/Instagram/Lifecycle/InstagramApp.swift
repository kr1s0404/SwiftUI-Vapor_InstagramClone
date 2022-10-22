//
//  InstagramApp.swift
//  Instagram
//
//  Created by Kris on 10/22/22.
//

import SwiftUI

@main
struct InstagramApp: App
{
    @StateObject var vm = StoreData()
    
    var body: some Scene
    {
        WindowGroup
        {
            ContentView()
                .environmentObject(vm)
        }
    }
}

class StoreData: ObservableObject
{
    @Published var following = [User]()
    
    init() {
        following = ApiService.userApi.getFollowing()
    }
}
