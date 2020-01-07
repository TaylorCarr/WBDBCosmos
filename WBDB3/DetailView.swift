//
//  DetailView.swift
//  WBDB3
//
//  Created by Taylor Carr on 11/23/19.
//  Copyright © 2019 Taylor Carr. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit

struct expandTitle: View {
    @Binding var showModal: Bool
    @EnvironmentObject var cartInstance: CartClass
    var title: movies
    
    //@ViewBuilder
    var body: some View {
        ScrollView {
            VStack {
                Group{
                    HStack {
                        Image(uiImage: (title.poster)!)
                            .resizable()
                            .frame(width: CGFloat(140), height: CGFloat(210))
                            .padding(30)
                        VStack {
                            Text(verbatim: title.title).bold().font(.title).padding()
                            Text(verbatim: title.synopsis)
                        }
                    }.frame(width: CGFloat(500), height: CGFloat(300), alignment: .top)//.padding(.top, CGFloat(50))
                }.frame(width: CGFloat(500), height: CGFloat(300), alignment: .top).padding(.top, CGFloat(50))
                trailerView(url: title.trailer!.absoluteString, request: URLRequest(url: title.trailer!)).frame(width: CGFloat(400), height: CGFloat(225), alignment: .leading).padding()
                Group {
                    Section(header: Text(verbatim: "Cast & Crew").font(.title).frame(alignment: .center), content: {
                        List(title.cast) { member in
                            HStack {
                                Text(member.name).font(.title)
                                Text(verbatim: " - ")
                                Text(member.role).font(.title)
                            }.frame(width: CGFloat(500), height: CGFloat(30), alignment: .leading).padding()
                        }.frame(width: CGFloat(500), height: CGFloat(70 * title.cast.count), alignment: .center)
                    })
                }
                Group {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                if (cartInstance.globalCart.contains(title)) {
                    Button(action: {
                        let index = self.cartInstance.globalCart.firstIndex(of: self.title)
                        self.cartInstance.globalCart.remove(at: index!);
                        self.showModal.toggle()
                    }) {
                        Text(verbatim: "REMOVE FROM CART")
                            .foregroundColor(Color(UIColor(named: "wbblue")!))
                    }.frame(alignment: .bottomTrailing)
                }
                else {
                    Button(action: {
                        self.cartInstance.globalCart.append(self.title)
                        self.showModal.toggle()
                    }) {
                        Text(verbatim: "ADD TO CART")
                            .foregroundColor(Color(UIColor(named: "wbblue")!))
                    }.frame(alignment: .bottomTrailing)
                }
                
                Divider()
                
                if (title.recommended != nil) {
                    Group {
                        VStack {
                            Text(verbatim: "Recommendations")
                            HStack (spacing: 50){
                                ForEach(title.recommended ?? []) { rec in
                                    recPoster(poster: rec.poster)
                                }
                            }
                        }.frame(width: CGFloat(500), height: CGFloat(250), alignment: .center)
                    }
                }
            }
        }
    }
}

struct recPoster: View {
    let poster: UIImage
    @State var upSelected = false
    @State var downSelected = false
    
    
    var body: some View {
        VStack {
            Image(uiImage: poster)
                .resizable()
                .frame(width: CGFloat(100), height: CGFloat(150))
            HStack (spacing: 15){
                Button(action: {
                    if (self.downSelected == true) {
                        self.downSelected = false
                        self.upSelected = true
                    }
                    else if (self.upSelected == true) {
                        self.upSelected = false
                    }
                    else {
                        self.upSelected = true
                    }
                    
                }) {
                    Image(uiImage: UIImage(named: "thumbsUp")!).resizable().frame(width: CGFloat(25), height: CGFloat(25), alignment: .leading).foregroundColor(upSelected ? Color(UIColor(named: "wbblue")!) : Color(UIColor.lightGray))
                }
                Button(action: {
                    if (self.upSelected == true) {
                        self.upSelected = false
                        self.downSelected = true
                    }
                    else if (self.downSelected == true) {
                        self.downSelected = false
                    }
                    else {
                        self.downSelected = true
                    }
                    
                }) {
                    Image(uiImage: UIImage(named: "thumbsDown")!).resizable().frame(width: CGFloat(25), height: CGFloat(25), alignment: .trailing).foregroundColor(downSelected ? Color(UIColor(named: "wbblue")!) :Color(UIColor.lightGray))
                }
            }.frame(width: CGFloat(100))
        }
    }
}

struct trailerView: UIViewRepresentable {
    
    typealias UIViewType = WKWebView
    var url: String
    let request: URLRequest
    
    func makeUIView(context: UIViewRepresentableContext<trailerView>) -> WKWebView {
        let webViewConfiguration = WKWebViewConfiguration()
        webViewConfiguration.allowsInlineMediaPlayback = false
        let wkwebview = WKWebView(frame: .zero, configuration: webViewConfiguration)
        wkwebview.autoresizingMask = .flexibleWidth
        wkwebview.autoresizingMask = .flexibleHeight
        
        return wkwebview
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<trailerView>) {
        uiView.load(request)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        expandTitle(showModal: .constant(true), title: movies(id: 0,
                                     poster: UIImage(named: "theaccountant"),
                                     title: "The Accountant",
                                     genre: "Action",
                                     trailer: URL(string: "https://www.youtube.com/embed/0KHOVlEpMyY"),
                                     synopsis: "As a math savant uncooks the books for a new client, the Treasury Department closes in on his activities, and the body count starts to rise.",
                                     cast: [
                                        member(name: "Gavin O'Connor", role: "Director"),
                                        member(name: "Ben Affleck", role: "Christian Wolff"),
                                        member(name: "Anna Kendrick", role: "Dana Cummings")
                                    ],
                                     availDates: [
                                        dates(dateType: dates.type.available, startDateString: "01-2019", endDateString: "11-2019")
                                        ],
                                     recommended: [recommendedMovies(poster: UIImage(named: "aquaman")!),
                                     recommendedMovies(poster: UIImage(named: "bvs")!),
                                     recommendedMovies(poster: UIImage(named: "wonderwoman")!)]))
    }
}
