//
//  DetailView.swift
//  SampleConnpassAPI-SwiftUI
//
//  Created by mtanaka on 2022/10/28.
//

import SwiftUI
import SafariServices

struct DetailView: UIViewControllerRepresentable {
    
    var modelData: Model
    typealias UIViewControllerType = SFSafariViewController
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
            let url = URL(string: modelData.eventUrl)
            return SFSafariViewController(url: url!)
        }

        func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        }
}

struct DetailView_Previews: PreviewProvider {
    static var modelData = ViewModel().modelData
    static var previews: some View {
        DetailView(modelData: modelData?[0] ?? Model.init(id: 0, title: "hoge", eventUrl: "hoge"))
    }
}
