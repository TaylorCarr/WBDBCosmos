//
//  BundlesView.swift
//  WBDB3
//
//  Created by Taylor Carr on 12/20/19.
//  Copyright © 2019 Taylor Carr. All rights reserved.
//

import SwiftUI

struct bundle: Identifiable {
    let id = UUID()
    var bundleName: String
    @State var selected: Bool// = false
    var pack: [movies]
    
    func toggleState() {
        selected.toggle()
    }
}

// MARK: Bundle View
struct BundlesView: View {
    @EnvironmentObject var cartInstance: CartClass
    
    func addMovies(pack: [movies], bundle: bundle) {
        for title in pack {
            self.cartInstance.globalCart.append(title)
        }
        bundle.toggleState()
    }
    
    var body: some View {
        Group {
            VStack {
                ScrollView {
                    VStack {
                        ForEach(bundles.indices) { bundle in
                            HStack {
                                VStack (spacing: 20){
                                    Text(self.bundles[bundle].bundleName.uppercased()).font(.headline)
                                        .padding(.leading)
                                        .frame(width: screenWidth, alignment: .leading).foregroundColor(.black)
                            
                                    HStack {
                                        bundleRow(titles: self.bundles[bundle].pack)

                                        Button(action: {
                                            if(self.bundles[bundle].selected == false) {
                                                self.bundles[bundle].selected = true
                                            }
                                            else {
                                                self.bundles[bundle].selected = false
                                            }
//                                            self.bundles[bundle].selected.toggle()
                                            print(self.bundles[bundle].selected)
                                            self.addMovies(pack: self.bundles[bundle].pack, bundle: self.bundles[bundle])
                                        }) {
                                            Image(self.bundles[bundle].selected ? "checked" : "add").resizable().frame(width: screenWidth * 0.05, height: screenWidth * 0.05, alignment: .center).accentColor(wbBlue)
                                        }
                                    }.frame(width: screenWidth, height: screenWidth * 0.15, alignment: .center)
                                    
                                    Text(verbatim: "Price: $-----".uppercased()).font(.subheadline).frame(width: screenWidth * 0.8, alignment: .trailing).foregroundColor(.black)
                                }
                            }.frame(width: screenWidth, height: screenHeight * 0.2, alignment: .leading)
                            Divider()
                        }
                    }
                }.frame(width: screenWidth)
            }
        }
    }
    
    // MARK: BUNDLE ARRAY
    @State var bundles: [bundle] = [bundle(bundleName: "DC Universe", selected: false, pack: [
        movies(id: 1,
           poster: UIImage(named: "aquaman"),
           title: "Aquaman",
           genre: "Action",
           trailer: URL(string: "https://www.youtube.com/embed/WDkg3h8PCVU"),
           synopsis: "Arthur Curry, the human-born heir to the underwater kingdom of Atlantis, goes on a quest to prevent a war between the worlds of ocean and land.",
           cast: [
            member(name: "James Wan", role: "Director"),
            member(name: "Jason Momoa", role: "Arthur"),
            member(name: "Amber Heard", role: "Mera")],
           availDates: [
            dates(dateType: dates.type.sold, startDateString: "01-2019", endDateString: "11-2019")
           ],
           recommended: [recommendedMovies(poster: UIImage(named: "bvs")!),
                recommendedMovies(poster: UIImage(named: "mos")!),
                recommendedMovies(poster: UIImage(named: "wonderwoman")!)]
        ),
        movies(id: 2,
               poster: UIImage(named: "bvs"),
               title: "Batman v Superman",
               genre: "Action",
               trailer: URL(string: "https://www.youtube.com/embed/fis-9Zqu2Ro"),
               synopsis: "Fearing that the actions of Superman are left unchecked, Batman takes on the Man of Steel, while the world wrestles with what kind of a hero it really needs.",
               cast: [
                member(name: "Zack Snyder", role: "Director"),
                member(name: "Ben Affleck", role: "Bruce Wayne"),
                member(name: "Henry Cavill", role: "Clark Kent")],
               availDates: [
               dates(dateType: dates.type.available, startDateString: "01-2019", endDateString: "11-2019")
               ],
               recommended: [recommendedMovies(poster: UIImage(named: "aquaman")!),
               recommendedMovies(poster: UIImage(named: "justiceleague")!),
               recommendedMovies(poster: UIImage(named: "wonderwoman")!)]
            ),
        movies(id: 4,
               poster: UIImage(named: "justiceleague"),
               title: "Justice League",
               genre: "Action",
               trailer: URL(string: "https://www.youtube.com/embed/3cxixDgHUYw"),
               synopsis: "Fueled by his restored faith in humanity and inspired by Superman's selfless act, Bruce Wayne enlists the help of his new-found ally, Diana Prince, to face an even greater enemy.",
               cast: [
                member(name: "Zack Snyder", role: "Director"),
                member(name: "Ben Affleck", role: "Bruce Wayne"),
                member(name: "Henry Cavill", role: "Clark Kent")
               ],
               availDates: [
               dates(dateType: dates.type.sold, startDateString: "01-2019", endDateString: "11-2019")
               ],
               recommended: [recommendedMovies(poster: UIImage(named: "aquaman")!),
               recommendedMovies(poster: UIImage(named: "bvs")!),
               recommendedMovies(poster: UIImage(named: "wonderwoman")!)]
            ),
        movies(id: 5,
               poster: UIImage(named: "mos"),
               title: "Man of Steel",
               genre: "Action",
               trailer: URL(string: "https://youtube.com/embed/T6DJcgm3wNY"),
               synopsis: "Clark Kent is an alien who as a child was evacuated from his dying world and came to Earth, living as a normal human. But when survivors of his alien home invade Earth, he must reveal himself to the world.",
               cast: [
                member(name: "Zack Snyder", role: "Director"),
                member(name: "Amy Adams", role: "Lois Lane"),
                member(name: "Henry Cavill", role: "Clark Kent")
               ],
               availDates: [
               dates(dateType: dates.type.heldback, startDateString: "01-2019", endDateString: "11-2019")
               ],
               recommended: [recommendedMovies(poster: UIImage(named: "aquaman")!),
                             recommendedMovies(poster: UIImage(named: "justiceleague")!),
                             recommendedMovies(poster: UIImage(named: "wonderwoman")!)]
            ),
        movies(id: 7,
               poster: UIImage(named: "suicidesquad"),
               title: "Suicide Squad",
               genre: "Action",
               trailer: URL(string: "https://www.youtube.com/embed/CmRih_VtVAs"),
               synopsis: "A secret government agency recruits some of the most dangerous incarcerated super-villains to form a defensive task force. Their first mission: save the world from the apocalypse.",
               cast: [
                member(name: "David Ayer", role: "Director"),
                member(name: "Will Smith", role: "Deadshot"),
                member(name: "Margot Robbie", role: "Harley Quinn")
               ],
               availDates: [
               dates(dateType: dates.type.sold, startDateString: "01-2019", endDateString: "11-2019")
               ],
               recommended: [recommendedMovies(poster: UIImage(named: "aquaman")!),
               recommendedMovies(poster: UIImage(named: "justiceleague")!),
               recommendedMovies(poster: UIImage(named: "wonderwoman")!)]
            ),
        movies(id: 8,
               poster: UIImage(named: "wonderwoman"),
               title: "Wonder Woman",
               genre: "Action",
               trailer: URL(string: "https://www.youtube.com/embed/1Q8fG0TtVAY"),
               synopsis: "When a pilot crashes and tells of conflict in the outside world, Diana, an Amazonian warrior in training, leaves home to fight a war, discovering her full powers and true destiny.",
               cast: [
                member(name: "Patty Jenkins", role: "Director"),
                member(name: "Gal Gadot", role: "Diana"),
                member(name: "Chris Pine", role: "Steve Trevor")
               ],
               availDates: [
               dates(dateType: dates.type.available, startDateString: "01-2019", endDateString: "11-2019")
               ],
               recommended: [recommendedMovies(poster: UIImage(named: "aquaman")!),
               recommendedMovies(poster: UIImage(named: "justiceleague")!),
               recommendedMovies(poster: UIImage(named: "suicidesquad")!)])
        ]),
                                    bundle(bundleName: "Horror", selected: false, pack: [
            movies(id: 14,
                   poster: UIImage(named: "annabelleComesHome"),
                   title: "Annabelle Comes Home",
                   genre: "Horror",
                   trailer: URL(string: "https://www.youtube.com/embed/bCxm7cTpBAs"),
                   synopsis: "While babysitting the daughter of Ed and Lorraine Warren, a teenager and her friend unknowingly awaken an evil spirit trapped in a doll.",
                   cast: [
                    member(name: "Gary Dauberman", role: "Director"),
                    member(name: "Vera Farmiga", role: "Lorraine Warren"),
                    member(name: "Patrick Wilson", role: "Ed Warren"),
                    member(name: "Mckenna Grace", role: "Judy Warren")
                   ],
                   availDates: [
                   dates(dateType: dates.type.available, startDateString: "01-2019", endDateString: "11-2019")
                   ],
                   recommended: [recommendedMovies(poster: UIImage(named: "doctorSleep")!),
                   recommendedMovies(poster: UIImage(named: "it")!),
                   recommendedMovies(poster: UIImage(named: "it2")!)]
                ),
            movies(id: 13,
               poster: UIImage(named: "doctorSleep"),
               title: "Doctor Sleep",
               genre: "Horror",
               trailer: URL(string: "https://www.youtube.com/embed/BOzFZxB-8cw"),
               synopsis: "Years following the events of \"The Shining,\" a now-adult Dan Torrance must protect a young girl with similar powers from a cult known as The True Knot, who prey on children with powers to remain immortal.",
               cast: [
                member(name: "Mike Flanagan", role: "Director"),
                member(name: "Ewan McGregor", role: "Dan Torrance"),
                member(name: "Kyliegh Curran", role: "Abra Stone")
               ],
               availDates: [
               dates(dateType: dates.type.available, startDateString: "01-2019", endDateString: "11-2019")
               ],
               recommended: [recommendedMovies(poster: UIImage(named: "theShining")!),
               recommendedMovies(poster: UIImage(named: "annabelleComesHome")!),
               recommendedMovies(poster: UIImage(named: "it")!)]
            ),
            movies(id: 12,
               poster: UIImage(named: "it"),
               title: "It",
               genre: "Horror",
               trailer: URL(string: "https://www.youtube.com/embed/xKJmEC5ieOk"),
               synopsis: "In the summer of 1989, a group of bullied kids band together to destroy a shape-shifting monster, which disguises itself as a clown and preys on the children of Derry, their small Maine town.",
               cast: [
                member(name: "Andy Muschietti", role: "Director"),
                member(name: "Bill Skarsgård", role: "Pennywise"),
                member(name: "Finn Wolfhard", role: "Richie Tozier")
               ],
               availDates: [
               dates(dateType: dates.type.available, startDateString: "01-2019", endDateString: "11-2019")
               ],
               recommended: [recommendedMovies(poster: UIImage(named: "it2")!),
               recommendedMovies(poster: UIImage(named: "annabelleComesHome")!),
               recommendedMovies(poster: UIImage(named: "doctorSleep")!)]
            ),
            movies(id: 11,
               poster: UIImage(named: "it2"),
               title: "It Chapter 2",
               genre: "Horror",
               trailer: URL(string: "https://www.youtube.com/embed/xhJ5P7Up3jA"),
               synopsis: "Twenty-seven years after their first encounter with the terrifying Pennywise, the Losers Club have grown up and moved away, until a devastating phone call brings them back.",
               cast: [
                member(name: "Andy Muschietti", role: "Director"),
                member(name: "Bill Hader", role: "Richie Tozier"),
                member(name: "Jessica Chastain", role: "Beverly Marsh")
               ],
               availDates: [
               dates(dateType: dates.type.available, startDateString: "01-2019", endDateString: "11-2019")
               ],
               recommended: [recommendedMovies(poster: UIImage(named: "it")!),
               recommendedMovies(poster: UIImage(named: "doctorSleep")!),
               recommendedMovies(poster: UIImage(named: "annabelleComesHome")!)]
            ),
            movies(id: 9,
               poster: UIImage(named: "theShining"),
               title: "The Shining",
               genre: "Horror",
               trailer: URL(string: "https://www.youtube.com/embed/S014oGZiSdI"),
               synopsis: "A family heads to an isolated hotel for the winter where a sinister presence influences the father into violence, while his psychic son sees horrific forebodings from both past and future.",
               cast: [
                member(name: "Stanley Kubrick", role: "Director"),
                member(name: "Jack Nicholson", role: "Jack Torrance"),
                member(name: "Shelley Duvall", role: "Wendy Torrance"),
                member(name: "Danny Lloyd", role: "Danny")
               ],
               availDates: [
               dates(dateType: dates.type.available, startDateString: "01-2019", endDateString: "11-2019")
               ],
               recommended: [recommendedMovies(poster: UIImage(named: "doctorSleep")!),
               recommendedMovies(poster: UIImage(named: "it")!),
               recommendedMovies(poster: UIImage(named: "it2")!)]
            )
        ])]
        
}

//func appendBundle(cartInstance: EnvironmentObject<CartClass>, pack: [movies]) {
//    //@EnvironmentObject var cartInstance: CartClass
//
////    ForEach(pack) { title in
////        cartInstance.globalCart.append(title)
////    }
//}

//MARK: Bundle Row
struct bundleRow: View {
    let titles: [movies]
    @State var showDetails = false
    @EnvironmentObject var cartInstance: CartClass
    
    var body: some View {
        ScrollView (.horizontal){
            HStack (spacing: 10){
                ForEach(titles, id: \.id) { title in
                        posterView(title: title)
                    }
                Button(action: {
                    
                }) {
                    Image("emptyPoster").resizable().frame(width: screenWidth * 0.1, height: screenWidth * 0.15, alignment: .center)
                }.buttonStyle(PlainButtonStyle())
                //posterView(title: movies(poster: UIImage(named: "emptyPoster")))
            }
        }
        .frame(width: screenWidth * 0.8, height: screenHeight * 0.15, alignment: .center)
        //.padding(.trailing, CGFloat(30))
        //.padding(.leading, CGFloat(30))
    }
}

struct posterView: View {
    var title: movies
    @State var showDetails = false
    @EnvironmentObject var cartInstance: CartClass
    
    var body: some View {
        HStack {
            Image(uiImage: title.poster!)
                .resizable()
                .frame(width: screenWidth * 0.1, height: screenWidth * 0.15, alignment: .center)
                .gesture(TapGesture()
                    .onEnded({
                        self.showDetails.toggle()
                    })
                )
                .sheet(isPresented: self.$showDetails, content: {
                expandTitle(showModal: self.$showDetails, title: self.title).environmentObject(self.cartInstance)
                })
        }
    }
}

struct BundlesView_Previews: PreviewProvider {
    static var previews: some View {
        BundlesView()
    }
}
