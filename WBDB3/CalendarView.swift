//
//  CalendarView.swift
//  WBDB3
//
//  Created by Taylor Carr on 11/6/19.
//  Copyright © 2019 Taylor Carr. All rights reserved.
//

import SwiftUI

class SecondViewHostingController: UIHostingController<CalendarView> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: CalendarView())
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

struct movies: Identifiable, Equatable {
    let id: Int
    let poster: UIImage?
    let title: String
    let genre: String
    let trailer: URL?
    let synopsis: String
    let cast: [member]
    let availDates: [dates]
    @State var expanded = false
    
    let recommended: [recommendedMovies]?
    
    static func ==(lhs: movies, rhs: movies) -> Bool {
        return lhs.id == rhs.id
    }
}

struct recommendedMovies: Identifiable {
    let id = UUID()
    let poster: UIImage
}

struct member: Identifiable {
    var id = UUID()
    var name: String
    var role: String
}

struct dates: Identifiable {
    let id = UUID()
    let dateType: type
    let startDateString: String
    let endDateString: String
    lazy var date = Date()
    lazy var calendar = Calendar.current
    lazy var month = calendar.component(.month, from: date)
    
    enum type: String {
        case available = "AVAILABLE"
        case sold = "SOLD"
        case heldback = "HELDBACK"
    }
}

func formatDate(dateString: String) -> Date {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.dateFormat = "MM-yyyy"
    
    let returnDate = formatter.date(from: dateString)!
    
    return returnDate
}

struct filterSettings {
    var genre: String?
    var region: String?
    var distrbution: String?
}

let settings = filterSettings()
let date = Date()

func assignDates() {
    let params: [String: Any] = ["UID": "Account ID", "preference": ["optout" : "false"]]
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = "MM yyyy"
        return formatter
    }
}

//var cart: [movies] = []
//var sortedAsc = true

//class globalCart: ObservableObject {
//    @Published var cart: [movies] = []
//}

struct CalendarView: View {
    
    @State var selectedTerm = 1
    @State var showFilters = false
    @State var date: Date = Date()
    @State var dateTracker = Calendar.current
    @State var sortedAsc = true
    @EnvironmentObject var cartInstance: CartClass
    
    func sortArray() {
        if (sortedAsc == true) {
            movieArray.sort{i,j in
            i.title > j.title
            }
            sortedAsc = false
            print("desc")
        }
        else {
            movieArray.sort{i,j in
                i.title < j.title
            }
            sortedAsc = true
            print("asc")
        }
    }
    
    func formatDate(dateString: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = "MM-yyyy"
        
        let returnDate = formatter.date(from: dateString)!
        
        return returnDate
    }
    
    func currentTerm() -> String {
        let year = dateTracker.component(.year, from: date)
        let month = dateTracker.component(.month, from: date)
        var temp = ""
        //let yearFront = dateTracker.component(.year, from: date)
        
        if(selectedTerm == 0) {
            temp = "\(DateFormatter().monthSymbols![month - 1]) \(year)"
        }
        else if (selectedTerm == 1) {
            var quarter: String = "Q1"
            if (dateTracker.component(.month, from: date) >= 1 && dateTracker.component(.month, from: date) <= 3) {
                quarter = "Q1 \(year)"
            }
            else if (dateTracker.component(.month, from: date) >= 4 && dateTracker.component(.month, from: date) <= 6) {
                quarter = "Q2 \(year)"
            }
            else if (dateTracker.component(.month, from: date) >= 7 && dateTracker.component(.month, from: date) <= 9) {
                quarter = "Q3 \(year)"
            }
            else if (dateTracker.component(.month, from: date) >= 10 && dateTracker.component(.month, from: date) <= 12) {
                quarter = "Q4 \(year)"
            }
            
            temp = quarter
        }
        else {
            temp = String(dateTracker.component(.year, from: date))
            let end = self.dateTracker.date(byAdding: .year, value: 4, to: self.date)!
            let endString = String(dateTracker.component(.year, from: end))
            //self.dateTracker = Calendar.current
            
            temp.append(" - \(endString)")
        }
        
        return temp
    }

    @State var movieArray: [movies] = [
        movies(id: 0,
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
                dates(dateType: dates.type.heldback, startDateString: "01-2019", endDateString: "11-2019")
                ],
               recommended: nil
            ),
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
        movies(id: 15,
           poster: UIImage(named: "centralIntelligence"),
           title: "Central Intelligence",
           genre: "Comedy",
           trailer: URL(string: "https://www.youtube.com/embed/BjnIYsYv5Gw"),
           synopsis: "After he reconnects with an awkward pal from high school through Facebook, a mild-mannered accountant is lured into the world of international espionage.",
           cast: [
            member(name: "Rawson Marshall Thurber", role: "Director"),
            member(name: "Dwayne Johnson", role: "Bob Stone"),
            member(name: "Kevin Hart", role: "Calvin Joyner")
           ],
           availDates: [
           dates(dateType: dates.type.available, startDateString: "01-2019", endDateString: "11-2019")
           ],
           recommended: [recommendedMovies(poster: UIImage(named: "shaft")!),
           recommendedMovies(poster: UIImage(named: "theaccountant")!),
           recommendedMovies(poster: UIImage(named: "oceans8")!)]
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
        movies(id: 3,
               poster: UIImage(named: "entourage"),
               title: "Entourage",
               genre: "Comedy",
               trailer: URL(string: "https://www.youtube.com/embed/SGSE_XPF4_g"),
               synopsis: "Movie star Vincent Chase, together with his boys Eric, Turtle, and Johnny, are back - and back in business with super agent-turned-studio head Ari Gold on a risky project that will serve as Vince's directorial debut.",
               cast: [
                member(name: "Doug Ellin", role: "Director"),
                member(name: "Kevin Connolly", role: "Eric"),
                member(name: "Jeremy Piven", role: "Ari Gold")
                ],
               availDates: [
               dates(dateType: dates.type.available, startDateString: "01-2019", endDateString: "11-2019")
               ],
               recommended: nil
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
        movies(id: 6,
               poster: UIImage(named: "oceans8"),
               title: "Ocean's 8",
               genre: "Thriller",
               trailer: URL(string: "https://www.youtube.com/embed/n5LoVcVsiSQ"),
               synopsis: "Debbie Ocean gathers an all-female crew to attempt an impossible heist at New York City's yearly Met Gala.",
               cast: [
                member(name: "Gary Ross", role: "Director"),
                member(name: "Sandra Bullock", role: "Debbie Ocean"),
                member(name: "Rihanna", role: "Nine Ball")
               ],
               availDates: [
               dates(dateType: dates.type.heldback, startDateString: "01-2019", endDateString: "11-2019")
               ],
               recommended: nil
            ),
        movies(id: 10,
           poster: UIImage(named: "shaft"),
           title: "Shaft",
           genre: "Action",
           trailer: URL(string: "https://www.youtube.com/embed/lD41XdWcmbY"),
           synopsis: "JJ Shaft, a cyber security expert with a degree from MIT, enlists his family's help to uncover the truth behind his best friend's untimely death.",
           cast: [
            member(name: "Tim Story", role: "Director"),
            member(name: "Samuel L. Jackson", role: "John Shaft"),
            member(name: "Jessie T. Usher", role: "JJ Shaft"),
            member(name: "Regina Hall", role: "Maya Babanikos")
           ],
           availDates: [
           dates(dateType: dates.type.available, startDateString: "01-2019", endDateString: "11-2019")
           ],
           recommended: [recommendedMovies(poster: UIImage(named: "suicidesquad")!),
           recommendedMovies(poster: UIImage(named: "oceans8")!)]
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
               recommendedMovies(poster: UIImage(named: "suicidesquad")!)]
            )
        
    ]
    
    var body: some View {
        VStack {
            Picker (selection: $selectedTerm, label: Text("Term")) {
                    Text("Month").tag(0)
                    Text("Quarter").tag(1)
                    Text("5 - Year").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                 .padding(.horizontal, CGFloat(100))
                .padding(.vertical, CGFloat(10))
            
            Divider()
            HStack {
               Button(action: {
                    if(self.selectedTerm == 0) {
                        self.date = self.dateTracker.date(byAdding: .month, value: -1, to: self.date)!
                        self.dateTracker = Calendar.current
                    }
                    else if (self.selectedTerm == 1) {
                        self.date = self.dateTracker.date(byAdding: .month, value: -3, to: self.date)!
                        self.dateTracker = Calendar.current
                    }
                    else if (self.selectedTerm == 2) {
                        self.date = self.dateTracker.date(byAdding: .year, value: -5, to: self.date)!
                        self.dateTracker = Calendar.current
                    }
               }) {
                    Image("leftArrow").resizable().frame(width: 30, height: 30, alignment: .leading).foregroundColor(Color.black)
                }
                Text(currentTerm()).frame(width: UIScreen.main.bounds.width - 200, height: 20, alignment: .center).animation(.spring())
                
                Button(action: {
                    if(self.selectedTerm == 0) {
                        self.date = self.dateTracker.date(byAdding: .month, value: 1, to: self.date)!
                        self.dateTracker = Calendar.current
                    }
                    else if (self.selectedTerm == 1) {
                        self.date = self.dateTracker.date(byAdding: .month, value: 3, to: self.date)!
                        self.dateTracker = Calendar.current
                        
                    }
                    else if (self.selectedTerm == 2) {
                        self.date = self.dateTracker.date(byAdding: .year, value: 5, to: self.date)!
                        self.dateTracker = Calendar.current
                    }
                }) {
                    Image("rightArrow").resizable().frame(width: CGFloat(30), height: CGFloat(30), alignment: .trailing).foregroundColor(Color.black)
                }
            }.padding(10)
                .gesture(DragGesture()
                    .onEnded { value in
                        if (value.translation.width > 0) {
                            print("previous term")
                            if(self.selectedTerm == 0) {
                                self.date = self.dateTracker.date(byAdding: .month, value: -1, to: self.date)!
                                self.dateTracker = Calendar.current
                            }
                            else if (self.selectedTerm == 1) {
                                self.date = self.dateTracker.date(byAdding: .month, value: -3, to: self.date)!
                                self.dateTracker = Calendar.current
                            }
                            else if (self.selectedTerm == 2) {
                                self.date = self.dateTracker.date(byAdding: .year, value: -5, to: self.date)!
                                self.dateTracker = Calendar.current
                            }
                            
                        }
                        else if (value.translation.width < 0) {
                            print("next term")
                            if(self.selectedTerm == 0) {
                                
                                self.date = self.dateTracker.date(byAdding: .month, value: 1, to: self.date)!
                                self.dateTracker = Calendar.current
                            }
                            else if (self.selectedTerm == 1) {
                                self.date = self.dateTracker.date(byAdding: .month, value: 3, to: self.date)!
                                self.dateTracker = Calendar.current
                                
                            }
                            else if (self.selectedTerm == 2) {
                                self.date = self.dateTracker.date(byAdding: .year, value: 5, to: self.date)!
                                self.dateTracker = Calendar.current
                            }
                        }
                    }
            ).padding(0)
            Divider()
            
            HStack (spacing: 40){
                Group {
                    Text("").frame(width: CGFloat(30), height: CGFloat(30)).background(Color(UIColor(named: "wbblue")!))
                    Text(verbatim: "Available").font(.headline).frame(width: UIScreen.main.bounds.width/8, height: CGFloat(50), alignment: .leading)
                }
                Group {
                    Text("").frame(width: CGFloat(30), height: CGFloat(30), alignment: .center).background(Color.yellow)
                    Text(verbatim: "Heldback").font(.headline).frame(width: UIScreen.main.bounds.width/8, height: CGFloat(50), alignment: .leading)//.padding(.trailing, CGFloat(35))
                }
                Group {
                    Text("")
                        .frame(width: CGFloat(30), height: CGFloat(30), alignment: .center)
                        .background(Color.black)//.padding(.leading, CGFloat(35))
                    Text(verbatim: "Sold")
                        .font(.headline)
                        .frame(width: UIScreen.main.bounds.width/8, height: CGFloat(50), alignment: .leading)
                }
            }.padding(.horizontal, 100).padding(.vertical, 0)
            //.frame(width: CGFloat(900), height: CGFloat(50), alignment: .center)
            if (self.selectedTerm == 0) {
                Divider()
                HStack {
                    ForEach(0...3, id: \.self) { x in
                        Group {
                            Divider()
                            Text(verbatim: "WEEK \(x + 1)".uppercased()).frame(width: CGFloat(185), height: CGFloat(30), alignment: .center)
                        }
                    }
                }.frame(width: UIScreen.main.bounds.width-100, height: CGFloat(30), alignment: .trailing)
            }
            else if (self.selectedTerm == 1) {
                Divider()
                HStack {
                    ForEach(0...2, id: \.self) { x in
                        Group {
                            Divider()
                            Text(DateFormatter().monthSymbols![self.dateTracker.component(.month, from: self.dateTracker.date(byAdding: .month, value: x, to: self.date)!) - 1].uppercased()).frame(width: CGFloat(255), height: CGFloat(30), alignment: .center)
                        }
                    }
                }.frame(width: UIScreen.main.bounds.width-100, height: CGFloat(30), alignment: .trailing)
            }
            else if (self.selectedTerm == 2) {
                Divider()
                HStack {
                    ForEach(0...4, id: \.self) { x in
                        Group {
                            Divider()
                            Text(String(self.dateTracker.component(.year, from: self.dateTracker.date(byAdding: .year, value: x, to: self.date)!)).uppercased()).frame(width: CGFloat(150), height: CGFloat(30), alignment: .center)
                            
                            
                        }
                    }
                }.frame(width: UIScreen.main.bounds.width-80, height: CGFloat(30), alignment: .trailing)
            }
            Divider()
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(movieArray) { movie in
                        if (movie.expanded == false) {
                            movieRow(movie: movie, blocks: self.selectedTerm).gesture(TapGesture()
                                .onEnded({
                                    movie.expanded.toggle()
                                    print("expansion selected in if")
                                })
                            )
                        }
                        else {
                            expandedMovieRow(movie: movie, blocks: self.selectedTerm).gesture(TapGesture()
                            .onEnded({
                                movie.expanded.toggle()
                                print("expansion selected in else")
                            }))
                        }
                        Divider()
                    }
                }.background(Color.clear)
            }
        }
    }
}


struct movieRow : View {
    let movie: movies
    var blocks: Int
    @State var showExpandedTitle = false
    @State var showTitleStats = false
    var tempCalendar: Calendar = Calendar.current
    @State var tempDate = Date()
    @State var statFilter = 0
    let arr = [1, 2, 3]
    var color: [Color] = [Color(UIColor(named: "wbblue")!), Color.black, Color.yellow]
    var label: String = "Available"
    @State var showPopover = false
    @EnvironmentObject var cartInstance: CartClass
    
    
    func calcBlocks(blocks: Int) -> Int {
        if (blocks == 0) {
            return 1
        }
        else if (blocks == 1) {
            return 3
        }
        else {
            return 5
        }
    }

    var body: some View {
        return Group {
            HStack {
                Image(uiImage: movie.poster!)
                    .resizable()
                    .frame(width: CGFloat(80), height: CGFloat(exactly: 120), alignment: .leading)
                    .padding()
                    .gesture(TapGesture()
                        .onEnded({
                            self.showExpandedTitle.toggle()
                        })).sheet(isPresented: self.$showExpandedTitle, content: {
                            expandTitle(showModal: self.$showExpandedTitle, title: self.movie).environmentObject(self.cartInstance)
                        })
            //When looking at the view we know where we are and what months we're looking at
            // We need to see if the movie.availDates[] has a sold or heldback rights hold for that time
            // ForEach (movie.availDates) {
            //    if (currentDate >= availDates.start && currentDate <= availDates.end) {
            //  currentBlock needs that value and color
            //  break
            // else {
            // currentblock is green and available
            
                VStack {
                    HStack {
                        Text(movie.title.uppercased()).frame(width: UIScreen.main.bounds.width * CGFloat(0.65), alignment: .leading).font(.headline).padding()
                        Button(action: {
                            withAnimation(.easeInOut(duration: 4)){
                                self.showTitleStats.toggle()
                            }
                            
                        }) {
                            Image(uiImage: UIImage(named: "stats")!).resizable().frame(width: CGFloat(25), height: CGFloat(25), alignment: .center).foregroundColor(Color(UIColor(named: "wbblue")!))
                        }.sheet(isPresented: self.$showTitleStats, content: {
                            StatsView()
                        })
                        
                    }.frame(width: UIScreen.main.bounds.width * CGFloat(0.80), alignment: .leading)
                    
                    Group {
                        HStack (spacing: 3){
                            ForEach(0..<calcBlocks(blocks: blocks), id: \.self) {_ in
                                Text(verbatim: "").frame(width: CGFloat(800/self.calcBlocks(blocks: self.blocks)), height: CGFloat(40), alignment: .center)
                                    .background(self.color.randomElement())
                                    .padding(CGFloat(0))
                                    .gesture(TapGesture()
                                        .onEnded({
                                            self.showPopover.toggle()
                                    })).alert(isPresented: self.$showPopover) {
                                            //StatusView()
                                            Alert(
                                                title: Text("Available/Sold/Heldback"),
                                                message: Text("Deal ID: \nLicense: \nExclusivity: "),
                                                dismissButton: Alert.Button.default(Text("Dismiss")))
                                    }
                                    //.popover(isPresented: self.$showPopover, arrowEdge: .top){
//                                        ScrollView {
//                                            StatusView().padding(.top, 50).frame(minWidth: CGFloat(250), idealWidth: CGFloat(50), maxWidth: .infinity, minHeight: CGFloat(100), idealHeight: CGFloat(100), maxHeight: .infinity, alignment: .topLeading)
//                                        }
//                                            VStack {
//                                                StatusView().padding(.top, 50).frame(minWidth: CGFloat(250), idealWidth: CGFloat(50), maxWidth: .infinity, minHeight: CGFloat(100), idealHeight: CGFloat(100), maxHeight: .infinity, alignment: .topLeading)
//                                            }
                                        //}
                                        
                            }
                        }//.frame(self.expanded ? width: CGFloat(800), height: CGFloat(40), alignment: .center : width: CGFloat(800, height(80), alignment: .center))
                    }}}.gesture(TapGesture()
                        .onEnded({_ in
                            self.movie.expanded.toggle()
                            print("expansion selected in movieRow")
                            //self.frame(width: UIScreen.main.bounds.width, height: CGFloat(80))
                    }))}}}

func blockBuilder(dates: [dates], movie: movies, date: Date, calendar: Calendar, color: Color, label: String) -> AnyView {

    var tempColor: Color = color
    var tempLabel: String = label
    let date = Date()

    for index in dates {
        if (calendar.component(.month, from: date) >= calendar.component(.month, from: formatDate(dateString: index.startDateString)) && calendar.component(.month, from: date) <= calendar.component(.month, from: formatDate(dateString: index.endDateString))) {
                tempColor = Color.red
                tempLabel = index.dateType.rawValue
            }
            else {
                tempColor = Color.green
                tempLabel = index.dateType.rawValue
            }
            print(calendar.component(.month, from: date))
            print(calendar.component(.month, from: formatDate(dateString: index.startDateString)))
        }

    return Text(verbatim: tempLabel).frame(width: 15, height: 15, alignment: .center).background(tempColor) as! AnyView
}

extension Date {
    func getNextMonth() -> Date? {
        return Calendar.current.date(byAdding: .month, value: 1, to: self)
    }

    func getPreviousMonth() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -1, to: self)
    }
    
    func getNextYear() -> Date? {
        return Calendar.current.date(byAdding: .year, value: -1, to: self)
    }
    
    func getPreviousYear() -> Date? {
        return Calendar.current.date(byAdding: .year, value: -1, to: self)
    }
    
    func getNextQuarter() -> [Date?] {
        return [nil]
    }
    
    func getPreviousQuarter() -> [Date?] {
        return [nil]
    }
}

struct expandedMovieRow: View {
    let movie: movies
    let blocks: Int
    
    var body: some View {
        HStack {
            Text(verbatim: "Package A:")
            Text(verbatim: "Package B:")
            Text(verbatim: "Package C:")
        }.frame(width: UIScreen.main.bounds.width, height: CGFloat(80))
    }
}
