////
////  GenderFilter.swift
////  WBDB3
////
////  Created by Taylor Carr on 12/19/19.
////  Copyright © 2019 Taylor Carr. All rights reserved.
////
//
// import SwiftUI
//
// struct GenderFilter: View {
//
//    let genders: [String] = ["MALE", "FEMALE", "OTHER", "UNKNOWN"]
//
//    var body: some View {
//        HStack (spacing: 30){
//            ForEach(genders, id: \.self) { value in
//                VStack {
//                    ZStack (alignment: .bottom){
//                        Capsule(style: .continuous).frame(width: CGFloat(40), height: CGFloat(200)).foregroundColor(.gray)
//                        Capsule(style: .circular).frame(width: CGFloat(40), height: CGFloat.random(in: 10...200)).foregroundColor(.blue).animation(.easeIn(duration: 3))
//                    }
//                    Text(value)
//                }
//            }
//        }.padding(.top, CGFloat(20))
//    }
// }
//
// struct GenderFilter_Previews: PreviewProvider {
//    static var previews: some View {
//        GenderFilter()
//    }
// }
