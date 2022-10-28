//
//  ContentView.swift
//  SampleConnpassAPI-SwiftUI
//
//  Created by mtanaka on 2022/10/28.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.modelData ?? [Model.init(id: 0, title: "hoge", eventUrl: "hoge")]) { event in
                NavigationLink(destination: DetailView(modelData: event)) {
                    RowView(modelData: event)
                }
            }
            .navigationTitle("Connpassイベント")
        }
        .onAppear(perform: {
            self.viewModel.fetchConpassEvents()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
