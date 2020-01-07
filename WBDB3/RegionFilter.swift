////
////  RegionFilter.swift
////  WBDB3
////
////  Created by Taylor Carr on 12/19/19.
////  Copyright © 2019 Taylor Carr. All rights reserved.
////
//
//import SwiftUI
//
//struct RegionFilter: View {
//    
//    let regions: [String] = ["ASIA", "GSE", "LATAM", "OCEANA", "SPAIN"]
//    @State var height: CGFloat = 100
//    
//    var body: some View {
//        HStack (spacing: 30){
//            ForEach(regions, id: \.self) { value in
//                VStack {
//                    ZStack (alignment: .bottom){
//                        Capsule(style: .circular).frame(width: CGFloat(40), height: CGFloat(200)).foregroundColor(.gray)
//                        Capsule(style: .circular).fill(Color.blue).frame(width: CGFloat(40), height: self.variableHeight()).animation(.easeInOut(duration: 4))
//                        CapsuleBar(value: 20, maxValue: 200, width: 40, valueName: "Val Text")
//                    }.animation(.easeInOut(duration: 1))
//                    Text(value).font(.headline)
//                }.frame(width: CGFloat(80), height: CGFloat(250))
//            }
//        }.padding(.top, CGFloat(20))
//    }
//    
//    func variableHeight() -> CGFloat? {
//        height = CGFloat.random(in: 0...200)
//        
//        for i in 0...Int(height) {
//            return CGFloat(i)
//        }
//        return nil
//    }
//}
//
//struct RegionFilter_Previews: PreviewProvider {
//    static var previews: some View {
//        RegionFilter()
//    }
//}
//
//struct CapsuleBar: View {
//    var value: Int
//    var maxValue: Int
//    var width: CGFloat
//    var valueName: String
//    //var capsuleColor: ColorRGB
//    var body: some View {
//        VStack {
//            
//            Text("\(value)")
//            ZStack(alignment: .bottom) {
//                Capsule()
//                    .fill(Color.gray)
//                    .opacity(0.1)
//                    .frame(width: width, height: 400)
//                Capsule()
//                    .fill(
//                        Color(UIColor(named: "wbblue")!)
//                    )
//                    .frame(width: width, height: CGFloat(value) / CGFloat(maxValue) * 400)
//                    .animation(.easeOut(duration: 0.5))
//            }
//            
//            Text("\(valueName)")
//        }
//    }
//}
