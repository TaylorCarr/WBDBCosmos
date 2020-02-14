//
//  StatsView.swift
//  WBDB3
//
//  Created by Taylor Carr on 12/20/19.
//  Copyright © 2019 Taylor Carr. All rights reserved.
//

import SwiftUI

struct StatsView: View {
    var data: [[String]] = [
        ["ASIA", "GSE", "LATAM", "OCEANA", "SPAIN"],
        ["0-12", "13-24", "25-49", "50-64", "65+"],
        ["MALE", "FEMALE", "TRANS", "OTHER", "UNKNOWN"]
    ]
    @State var statFilter = 0
    let wbBlue = Color(UIColor(named: "wbblue")!)
    
    var body: some View {
        VStack {
            Text(verbatim: "BOX OFFICE STATISTICS").font(.largeTitle).fontWeight(.heavy).padding(.bottom, CGFloat(20))
            Picker(selection: $statFilter, label: Text("Filter")) {
                Text("TERRITORY").tag(0)
                Text("AGE").tag(1)
                Text("GENDER").tag(2)
            }.pickerStyle(SegmentedPickerStyle())
             .padding(.horizontal, CGFloat(100))
            Group {
                HStack (spacing: 30){
                    VStack {
                        ZStack (alignment: .bottom){
                            Capsule(style: .circular).frame(width: CGFloat(40), height: CGFloat(200)).foregroundColor(Color.gray).opacity(0.1)
                            Capsule(style: .circular).frame(width: CGFloat(40), height: CGFloat.random(in: 0...200))
                                .animation(.easeInOut(duration: 2)).foregroundColor(wbBlue)
                        }
                        Text(data[statFilter][0]).font(.headline)
                    }.frame(width: CGFloat(80))
                    VStack {
                        ZStack (alignment: .bottom){
                            Capsule(style: .circular).frame(width: CGFloat(40), height: CGFloat(200)).opacity(0.1).foregroundColor(Color.gray)
                            Capsule(style: .circular).frame(width: CGFloat(40), height: CGFloat.random(in: 0...200)).animation(.easeInOut(duration: 2)).foregroundColor(wbBlue)
                        }
                        Text(data[statFilter][1]).font(.headline)
                    }.frame(width: CGFloat(80))
                    VStack {
                        ZStack (alignment: .bottom){
                            Capsule(style: .circular).frame(width: CGFloat(40), height: CGFloat(200)).opacity(0.1).foregroundColor(Color.gray)
                            Capsule(style: .circular).frame(width: CGFloat(40), height: CGFloat.random(in: 0...200)).animation(.easeInOut(duration: 2)).foregroundColor(wbBlue)
                        }
                        Text(data[statFilter][2]).font(.headline)
                    }.frame(width: CGFloat(80))
                    VStack {
                        ZStack (alignment: .bottom){
                            Capsule(style: .circular).frame(width: CGFloat(40), height: CGFloat(200)).opacity(0.1).foregroundColor(Color.gray)
                            Capsule(style: .circular).frame(width: CGFloat(40), height: CGFloat.random(in: 0...200)).animation(.easeInOut(duration: 2)).foregroundColor(wbBlue)
                        }
                        Text(data[statFilter][3]).font(.headline)
                    }.frame(width: CGFloat(80))
                    VStack {
                        ZStack (alignment: .bottom){
                            Capsule(style: .circular).frame(width: CGFloat(40), height: CGFloat(200)).opacity(0.1).foregroundColor(Color.gray)
                            Capsule(style: .circular).frame(width: CGFloat(40), height: CGFloat.random(in: 0...200)).animation(.easeInOut(duration: 2)).foregroundColor(wbBlue)
                        }
                        Text(data[statFilter][4]).font(.headline)
                    }.frame(width: CGFloat(100))
                }.frame(width: CGFloat(700), height: CGFloat(300), alignment: .center)
            }
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
