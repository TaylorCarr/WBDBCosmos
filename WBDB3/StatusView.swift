//
//  StatusView.swift
//  WBDB3
//
//  Created by Taylor Carr on 12/9/19.
//  Copyright © 2019 Taylor Carr. All rights reserved.
//

import SwiftUI

struct StatusView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Available/Sold/Heldback").font(.headline).frame(alignment: .center)
            Spacer()
            Text("Deal ID: ").font(.headline)
            Text("Dates: ").font(.headline)
            Text("Licensee: ").font(.headline)
            Text("Exclusivity: ").font(.headline)
        }.frame(width: CGFloat(250), height: CGFloat(150), alignment: .center)//.background(Color.blue)
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView()
    }
}
