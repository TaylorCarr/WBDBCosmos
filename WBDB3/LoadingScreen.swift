//
//  LoadingScreen.swift
//  WBDB3
//
//  Created by Taylor Carr on 12/3/19.
//  Copyright © 2019 Taylor Carr. All rights reserved.
//

import SwiftUI

struct LoadingScreen: View {
    @State var half = false
    @State var doneLoading = false
    
    var repeatingAnimation: Animation {
        Animation
            .easeInOut(duration: 1)
            .repeatCount(8)
    }
    
    func changeView () {
        //loading = false
    }
    
    var body: some View {
        NavigationView{
            Button(action: {
                print("worked")
            }) {
                Text(verbatim: "Button")
                }.frame(width: 200, height: 200, alignment: .center)
        .navigationBarTitle("")
//            ZStack {
//                if (doneLoading == false) {
//                    Color(UIColor(named: "wbblue")!)
//                        .edgesIgnoringSafeArea(.all)
//                    Image(uiImage: UIImage(named: "wblogo")!)
//                        .resizable()
//                        .scaleEffect(half ? 1.5 : 1.0)
//                        .frame(width: 250, height: 250, alignment: .center)
//
//                        .onAppear(perform: {
//                            withAnimation(self.repeatingAnimation) {
//                                self.half.toggle()
//                                self.doneLoading = false
//                                print("added")
//                            }
//                        })
//
//                }
//                else if (doneLoading == true){
//                   // DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//                    test()
//                       //CalendarView()
//                   // }
//
//
//                }
        }
    }
}

struct test: View {
    
    var body: some View {
        HStack {
            Text(verbatim: "no")
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
    }
}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreen()
    }
}
