//
//  DialPicker.swift
//  WBDB3
//
//  Created by Taylor Carr on 11/6/19.
//  Copyright © 2019 Taylor Carr. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct Dial {
    var id = UUID()
    var radius: Double = 100
    var i: Double
    // var x: CGPoint?

    func getPoint() -> CGPoint {
        return CGPoint(x: cos(i) * radius, y: sin(i) * radius)
    }
}

struct DialPicker: View {
    var i: Double = 10
    var radius: Double = 100
    var x: CGPoint?

    // x = cos(i) * radius

    var body: some View {
        VStack {
            Group {
                HStack {
                    Circle()
                }
            }.frame(alignment: .top)
            Divider()

            Group {
                Circle()
                    .stroke(Color.red, lineWidth: CGFloat(4))
                    .frame(width: CGFloat(150), height: CGFloat(150), alignment: .center)
//                ForEach(genres) { index in
//                    Circle()
//                    .offset(Dial(i: index).getPoint())
//                }
                // generateCircles()
            }
        }
    }
}

// func generateCircles() {
//    let min = -1
//    let max = 1
//
//    let step = ((max - min) / genres.count)
//
//    for i in stride(from: min, to: max, by: step) {
//
//    }
//    //ZStack {
////        ForEach(genres) { index in
////            var temp: Dial
////                temp = Dial(i: Double(index*step))
////            Circle()
////            .offset(temp.getPoint())
////        //Text("test")
////
////    }
//    //}
// }

struct DialPicker_Previews: PreviewProvider {
    static var previews: some View {
        DialPicker()
    }
}
