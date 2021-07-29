//
//  ContentView.swift
//  H4x0r News
//
//  Created by Laborit on 12/07/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)){
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }//Hstack
                    .padding()
                }//NavigationLink
            }//List
            .navigationBarTitle(K.appTitle)
        }//NavigationView
        .onAppear {
            //when this display appear, trigger the func fetchData.
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

