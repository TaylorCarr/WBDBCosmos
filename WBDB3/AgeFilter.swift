////
////  AgeFilter.swift
////  WBDB3
////
////  Created by Taylor Carr on 12/19/19.
////  Copyright © 2019 Taylor Carr. All rights reserved.
////
//
//import SwiftUI
//
//struct AgeFilter: View {
//    
//    let ageRanges: [String] = ["0-12", "13-24", "25-49", "50+"]
//    
//    var body: some View {
//        HStack (spacing: 30){
//            ForEach(ageRanges, id: \.self) { value in
//                VStack {
//                    ZStack (alignment: .bottom){
//                        Capsule(style: .continuous).frame(width: CGFloat(40), height: CGFloat(200)).foregroundColor(.gray)
//                        Capsule(style: .circular).frame(width: CGFloat(40), height: CGFloat.random(in: 10...200)).foregroundColor(.blue)
//                    }
//                    Text(value)
//                }
//            }
//            
//        }.padding(.top, CGFloat(20))
//    }
//}
//
//struct AgeFilter_Previews: PreviewProvider {
//    static var previews: some View {
//        AgeFilter()
//    }
//}
