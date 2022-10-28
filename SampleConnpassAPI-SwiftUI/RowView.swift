//
//  RowView.swift
//  SampleConnpassAPI-SwiftUI
//
//  Created by mtanaka on 2022/10/28.
//

import SwiftUI

struct RowView: View {
    
    var modelData: Model
    
    var body: some View {
        Text(modelData.title)
    }
}

struct RowView_Previews: PreviewProvider {
    static var modelData = ViewModel().modelData
    static var previews: some View {
        RowView(modelData: (modelData?[0])!)
    }
}
