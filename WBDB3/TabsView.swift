//
//  TabsView.swift
//  WBDB3
//
//  Created by Taylor Carr on 12/20/19.
//  Copyright © 2019 Taylor Carr. All rights reserved.
//

import SwiftUI
// import UIKit

let wbBlue = Color(UIColor(named: "wbblue")!)
var tester = false

class CartClass: ObservableObject {
    @Published var globalCart: [movies] = []
}

struct Controller: View {
    @State var temp = tester
    @EnvironmentObject var cartInstance: CartClass
    @State var showHelp = false
    @State var showFilters = false
    @State var pickerSelection: String = ""

    var body: some View {
        VStack {
            if temp {
                DoubleWrapper().transition(AnyTransition.opacity.combined(with: .slide))
            } else {
                VStack {
                    ZStack {
                        HStack {
                            Button(action: {
                                self.temp.toggle()
                            }) {
                                Image("back").resizable().frame(width: screenWidth * 0.035, height: screenWidth * 0.035, alignment: .center)
                                    .foregroundColor(.white)
                            }
                            Button(action: {
                                self.showFilters.toggle()
                                print(self.showFilters)
                            }
                            ) {
                                Image("filter")
                                    .resizable()
                                    .frame(width: screenWidth * 0.035, height: screenWidth * 0.035, alignment: .center)
                                    .foregroundColor(.white)
                            }.sheet(isPresented: self.$showFilters, content: {
                                filterModal(pickerSelection: 0)

                            })
                            Button(action: {}) {
                                Image("searchIcon")
                                    .resizable()
                                    .frame(width: screenWidth * 0.035, height: screenWidth * 0.035, alignment: .center)
                                    .foregroundColor(.white)
                            }
                            Text("WARNER BROS.")
                                .font(Font.custom("GillSans-Bold", size: CGFloat(25)))
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                .frame(width: screenWidth * 0.7, height: screenHeight * 0.07, alignment: .center)
                            Button(action: {
                                self.showHelp.toggle()
                            }) {
                                Image("help")
                                    .resizable()
                                    .frame(width: screenWidth * 0.04, height: screenWidth * 0.04, alignment: .center)
                                    .foregroundColor(.white)
                            }.popover(isPresented: self.$showHelp, arrowEdge: .top) {
                                VStack {
                                    Text(verbatim: "FEATURES:").frame(width: screenWidth / 3, height: screenHeight * 0.05, alignment: .leading)

                                    Text(verbatim: "- Pinch to zoom to change the scope of the calendar").frame(width: screenWidth / 3, height: screenHeight * 0.05, alignment: .leading)

                                    Text(verbatim: "- Swipe the timeline to navigate forward or backward").frame(width: screenWidth / 3, height: screenHeight * 0.05, alignment: .leading)

                                    Text(verbatim: "LEGEND:").frame(width: screenWidth / 3, height: screenHeight * 0.05, alignment: .leading)

                                    HStack {
                                        Group {
                                            Text("").frame(width: screenHeight * 0.025, height: screenHeight * 0.025).background(Color(UIColor.systemGreen))
                                            Text(verbatim: "Available").font(.subheadline).frame(width: screenWidth / 6, height: screenHeight * 0.05, alignment: .leading)
                                        }
                                    }.frame(width: screenWidth / 3, height: screenHeight * 0.05, alignment: .leading)
                                    HStack {
                                        Group {
                                            Text("").frame(width: screenHeight * 0.025, height: screenHeight * 0.025, alignment: .center).background(Color(UIColor.systemYellow))
                                            Text(verbatim: "Heldback").font(.subheadline).frame(width: screenWidth / 6, height: screenHeight * 0.05, alignment: .leading) // .padding(.trailing, CGFloat(35))
                                        }
                                    }.frame(width: screenWidth / 3, height: screenHeight * 0.05, alignment: .leading)
                                    HStack {
                                        Group {
                                            Text("").frame(width: screenHeight * 0.025, height: screenHeight * 0.025)
                                                .background(Color(UIColor.systemRed)) // .padding(.leading, CGFloat(35))
                                            Text(verbatim: "Sold")
                                                .font(.subheadline)
                                                .frame(width: screenWidth / 6, height: screenHeight * 0.05, alignment: .leading)
                                        }
                                    }.frame(width: screenWidth / 3, height: screenHeight * 0.05, alignment: .leading)
                                }.frame(maxWidth: .infinity, alignment: .leading).padding()
                            }
                            Button(action: {}) {
                                Image("share")
                                    .resizable()
                                    .frame(width: screenWidth * 0.04, height: screenWidth * 0.04, alignment: .center)
                                    .foregroundColor(.white)
                            }
                        }.padding(0)
                    }.padding(0).frame(width: screenWidth * 0.95, height: screenHeight * 0.1, alignment: .bottomLeading)
                }.padding(0).frame(width: screenWidth, height: screenHeight * 0.1, alignment: .bottom)
                    .background(wbBlue)
                    // .padding(0)
                    .shadow(radius: CGFloat(20))

                TabsView().environmentObject(cartInstance).edgesIgnoringSafeArea(.top).padding(.top, 0)
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
            TabView {
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
        } // .frame(width: screenWidth, alignment: .center)//.edgesIgnoringSafeArea(.top)
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        Controller().environmentObject(CartClass())
            .environment(\.colorScheme, .light)
        // filterModal(pickerSelection: 0, rating: 0)
    }
}

struct filterModal: View {
    @State var pickerSelection: Int
    @State private var rating = 1
    @State var selection = 0
    @State var sorting = 0

    // Sort: by Popularity, Rating, Year, Cost, Alphabetical
    // Filters: language, subtitles, cost, rating, release year,

    var body: some View {
        VStack {
            // Text(verbatim: "Filters").font(.headline).frame(width: screenWidth * 0.7, height: screenHeight * 0.05, alignment: .center)
            NavigationView {
                Form {
                    Section(header: Text("")) {
                        Picker(selection: $sorting, label: Text("Sorting"), content: {
                            Text("Alphabetically (A-Z)").tag(0)
                            Text("Alphabetically (Z-A)").tag(1)
                            Text("Release Year (ASC)").tag(2)
                            Text("Release Year (DESC)").tag(3)
                            Text("IMDB Rating").tag(4)
                            Text("Cost (ASC)").tag(5)
                            Text("Cost (DESC)").tag(6)
                            Text("Popularity").tag(7)
                        })
                    }
                    Section(header: Text("Filters")) {
                        Picker("Language", selection: self.$pickerSelection, content: {
                            Text("English").tag(0)
                            Text("Spanish").tag(1)
                            Text("French").tag(2)
                        })
                        Picker(selection: $selection, label: Text("Subtitles"), content: {
                            Text("English").tag(0)
                            Text("Spanish").tag(1)
                            Text("French").tag(2)
                        })
                        Stepper("IMDB Rating: \(rating)+", value: self.$rating, in: 1 ... 9)
                    }
//                Section() {
//                    Button(action: {
//
//                    }) {
//                        Text(verbatim: "CANCEL")
//                    }
//                    Button(action: {
//
//                    }) {
//                        Text(verbatim: "APPLY")
//                    }
//                }
                }.navigationBarTitle(Text("Filter Options"))
//            Button(action: {
//
//            }) {
//                Text(verbatim: "SUBMIT 2")
//            }
            }
            // .frame(height: screenHeight * 0.7)
//            Button(action: {
//
//            }) {
//                Text(verbatim: "SUBMIT 1")
//                    .frame(width: screenWidth * 0.7, height: screenHeight * 0.05, alignment: .center)
//                    .cornerRadius(screenWidth)
//            }
        }
    }
}

struct FilterWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = FilterController

    func makeUIViewController(context _: UIViewControllerRepresentableContext<FilterWrapper>) -> FilterWrapper.UIViewControllerType {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController: FilterController = mainStoryboard.instantiateViewController(withIdentifier: "FilterController") as! FilterController
        return mainViewController
    }

    func updateUIViewController(_: FilterWrapper.UIViewControllerType, context _: UIViewControllerRepresentableContext<FilterWrapper>) {
        //
    }
}
