//
//  TabsView.swift
//  WBDB3
//
//  Created by Taylor Carr on 12/20/19.
//  Copyright © 2019 Taylor Carr. All rights reserved.
//

import SwiftUI
//import UIKit

let wbBlue = Color(UIColor(named: "wbblue")!)
var tester = false

class CartClass: ObservableObject {
    @Published var globalCart: [movies] = []
}

struct Controller: View {
    @State var temp = tester
    @EnvironmentObject var cartInstance: CartClass
    
    var body: some View {
        VStack {
            if (temp) {
                DoubleWrapper()
            }
            else {
                VStack {
                    HStack (spacing: 30) {
                        Button(action: {
                            self.temp.toggle()
                        }
                        ) {
                            Image("filter").foregroundColor(.white)
                        }
                        Button(action: {
                            
                        }) {
                            Image("sort").foregroundColor(.white)
                        }
                        Text("WARNER BROS.").font(Font.custom("GillSans-Bold", size: CGFloat(25))).fontWeight(.heavy).foregroundColor(.white).frame(width: CGFloat(750),height: CGFloat(70), alignment: .center)
                    }.edgesIgnoringSafeArea(.top)
                     .padding(0)
                     .padding(.leading, 30)
                     //.padding(.bottom, 0)
                     .frame(width: UIScreen.main.bounds.width, height: CGFloat(120), alignment: .bottomLeading).background(wbBlue).shadow(radius: CGFloat(20))
                    
                    TabsView().environmentObject(cartInstance)
                }
            }
        }.edgesIgnoringSafeArea(.top)
    }
}

struct DoubleWrapper: View {
    @EnvironmentObject var cartInstance: CartClass
    
    var body: some View {
        FilterWrapper().environmentObject(cartInstance)
    }
}

struct TabsView: View {
    @EnvironmentObject var cartInstance: CartClass
    
    var body: some View {
        VStack {
            TabView{
                CalendarView()
                    .tabItem {
                        VStack {
                            Image("calendar")
                            Text("Calendar")
                        }
                    }
                    .environmentObject(cartInstance)
                BundlesView()
                    .tabItem {
                        VStack {
                            Image("package")
                            Text("Bundles")
                        }
                    }
                    .environmentObject(cartInstance)
                CartView()
                    .tabItem {
                        VStack {
                            Image("shoppingCart")
                            Text("Cart")
                        }
                    }
                    .environmentObject(cartInstance)
            }
        }
    }
}
struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        Controller().environmentObject(CartClass())
    }
}

struct FilterWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = FilterController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<FilterWrapper>) -> FilterWrapper.UIViewControllerType {

    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let mainViewController: FilterController = mainStoryboard.instantiateViewController(withIdentifier: "FilterController") as! FilterController
      return mainViewController

    }

    func updateUIViewController(_ uiViewController: FilterWrapper.UIViewControllerType, context: UIViewControllerRepresentableContext<FilterWrapper>) {
        //
    }
    
    
}
