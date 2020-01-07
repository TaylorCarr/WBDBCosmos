//
//  CalendarController.swift
//  WBDB3
//
//  Created by Taylor Carr on 11/8/19.
//  Copyright © 2019 Taylor Carr. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class CalendarController2: UIHostingController<AnyView> {
    //@EnvironmentObject var cartInstance: CartClass
    
    required init?(coder aDecoder: NSCoder) {
        
        //super.init(coder: aDecoder, rootView:
        //CalendarView())
        
        super.init(coder: aDecoder, rootView:
           AnyView(Controller().environmentObject(CartClass())))
        
    }
    
    override func viewDidLoad() {
    super.viewDidLoad()
        //let temp = CalendarView()
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        //navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.isNavigationBarHidden = true
        
//        let back = UIBarButtonItem(image: UIImage(named: "filter"), style: .plain, target: self, action: #selector(goToFilters))
//        let sort = UIBarButtonItem(image: UIImage(named: "sort"), style: .plain, target: self, action: #selector(sortList))
//        let cart = UIBarButtonItem(image: UIImage(named: "shoppingCart"), style: .plain, target: self, action: #selector(goToCart))
//
//        navigationItem.hidesBackButton = true
//        navigationItem.leftBarButtonItems = [back, sort]
//        navigationItem.rightBarButtonItems = [cart]
//
//        let headerText = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 15))
//        headerText.text = "WARNER BROS."
//        headerText.font = UIFont(name: "GillSans-Bold", size: CGFloat(25))
//        headerText.textColor = UIColor(named: "wbblue")!
//        navigationItem.titleView = headerText

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        //self.navigationController?.isNavigationBarHidden = true
        //self.navigationController?.navigationItem.backBarButtonItem = nil
    }
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override var shouldAutorotate: Bool {
        return true
    }
    
    @objc func goToCart() {
        performSegue(withIdentifier: "showCartSegue", sender: (Any).self)
        
    }
    
    @objc func goToFilters () {
        self.navigationController?.popToViewController((self.navigationController?.viewControllers[0]) as! FilterController, animated: true)
    }
    
    @objc func sortList(sender: Any) {
        //sortArray()
        
        //temp.sortArray()
        
//        let popoverFrame = CGRect(origin: self.view.frame.origin, size: CGSize(width: 250, height: 50))
//        let popoverVC = UIViewController()
//        let popoverView = UIView(frame: popoverFrame)
//        let label = UILabel(frame: popoverFrame)
//        label.text = "FRENCH COMROM"
//        label.center = popoverView.center
//        label.textAlignment = .center
//        label.numberOfLines = 0
//        popoverView.addSubview(label)
//        popoverVC.view.addSubview(popoverView)
//        popoverVC.modalPresentationStyle = .popover
//        popoverVC.preferredContentSize = CGSize(width: 250, height: 50)
//
//        let options = ["Name", "Avails Date", "Release Year"]
//
//        var optionsTable = UITableView(frame: popoverFrame)
//        for option in options {
//            optionsTable.cellForRow(at: option.in) = option.name
        }
        
        
//        // Specify the anchor point for the popover.
//        popoverVC.popoverPresentationController?.delegate = self as? UIPopoverPresentationControllerDelegate
//        popoverVC.popoverPresentationController?.sourceView = sender as! UIView
//        popoverVC.popoverPresentationController?.sourceRect = (sender as! UIView).bounds
//
//        // Present the view controller (in a popover).
//        self.present(popoverVC, animated: true) // The popover is visible.
//    }
//}
//
//class sortTableViewController: UITableViewController {
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//}




//struct CalendarView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalendarView()
//    }
//}
//
//struct movies: Identifiable {
//    let id: Int
//    let poster: UIImage?
//    let title: String
//    let genre: String
//    let trailer: URL? = URL(string: "https://youtube.com/watch?v=fis-9Zqu2Ro")
//    var startDate: Date = Date(timeIntervalSince1970: 1538377200000)
//    var endDate: Date = Date(timeIntervalSince1970: 1609487999000)
//
//}
//
//struct filterSettings {
//    var genre: String?
//    var region: String?
//    var distrbution: String?
//}
//
//let settings = filterSettings()
//
//let genres: [circles] = [circles(title: "All"), circles(title: "Action"), circles(title: "Children & Family"), circles(title:"Comedy"), circles(title: "Documentary"), circles(title: "Drama"), circles(title: "Horror"), circles(title: "Romance"), circles(title: "Sci-fi"), circles(title:"Thriller")]
//
////let genres = ["All", "Action", "Children & Family", "Comedy", "Documentary", "Drama", "Horror", "Romance", "Sci-fi", "Thriller"]
//
//var selectedGenre = "All"
//
//func assignDates() {
//    //var movieArray = movieArray
//    // @Binding var movieArray: [movies]
//
//    let params: [String: Any] = ["UID": "Account ID", "preference": ["optout" : "false"]]
//
//    var dateFormatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .short
//        formatter.dateFormat = "MM yyyy"
//        return formatter
//    }
////
////    print(movieArray[0].title)
////
////    movieArray[0].startDate = dateFormatter.date(from: "10 2019")
////    movieArray[0].startDate = dateFormatter.date(from: "10 2020")
////    movieArray[2].startDate = dateFormatter.date(from: "12 2018")
////    movieArray[2].startDate = dateFormatter.date(from: "12 2019")
////    movieArray[3].startDate = dateFormatter.date(from: "10 2017")
////    movieArray[3].startDate = dateFormatter.date(from: "10 2019")
//}
//
//struct CalendarView: View {
//
//
//    @State var showFilters = false
//    @State var selectedTerm = 0
//
//    var dateFormatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .short
//        formatter.dateFormat = "MM yyyy"
//        return formatter
//    }
//
//    @State var movieArray: [movies] = [
//        movies(id: 0, poster: UIImage(named: "theaccountant"), title: "Accountant, The", genre: "Action"),
//        movies(id: 1, poster: UIImage(named: "aquaman"), title: "Aquaman", genre: "Action"),
//        movies(id: 2, poster: UIImage(named: "bvs"), title: "Batman v Superman", genre: "Action"),
//        movies(id: 3, poster: UIImage(named: "entourage"), title: "Entourage", genre: "Comedy"),
//        movies(id: 4, poster: UIImage(named: "justiceleague"), title: "Justice League", genre: "Action"),
//        movies(id: 5, poster: UIImage(named: "mos"), title: "Man of Steel", genre: "Action"),
//        movies(id: 6, poster: UIImage(named: "oceans8"), title: "Ocean's 8", genre: "Thriller"),
//        movies(id: 7, poster: UIImage(named: "suicidesquad"), title: "Suicide Squad", genre: "Action"),
//        movies(id: 8, poster: UIImage(named: "wonderwoman"), title: "Wonder Woman", genre: "Action")]
//
//
//    var body: some View {
//
//        VStack {
//            Button(action: {
//                self.showFilters.toggle()
//            }){
//                Text("FILTERS")
//                .padding()
//                .foregroundColor(.black)
//            }.sheet(isPresented: $showFilters, content: {filtersView()})
//
//            Divider()
//
//            Text("October").frame(width: UIScreen.main.bounds.width, height: 25, alignment: .center)
//
//            Divider()
//
//            ScrollView(.vertical, showsIndicators: false) {
//                VStack {
//                    ForEach(movieArray) { movie in
//                        movieView(movie: movie)
//                        Divider()
//
//                    }
//
//                }
//            }
//
//            Divider()
//
//            Picker (selection: $selectedTerm, label: Text("Term")) {
//                Text("Month").tag(0)
//                Text("Quarter").tag(1)
//                Text("Year").tag(2)
//            }.pickerStyle(SegmentedPickerStyle())
//             .padding(.horizontal, 100)
//        }
//    }
//}
//
//struct movieView : View {
//    let movie: movies
//
//    var body: some View {
//     Group {
//        HStack {
//            Image(uiImage: movie.poster!).resizable().frame(width: 66, height: CGFloat(exactly: 100), alignment: .leading).padding()
//
//            VStack {
//                Text(movie.title).frame(width: UIScreen.main.bounds.width * 0.75, alignment: .leading)
//                Button(action: {
//                    print("")}) {
//                    Text("Unavailable")
//                }
//                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, idealHeight: 50, maxHeight: 50, alignment: .center)
//
//                .background(Color.red)
//                .foregroundColor(Color.black)
//                .padding()
//
//            }
//        }.onTapGesture {
//            print("Movie Selected")
//        }
//    }
//    }
//}
//
//func calcDate (movie: movies)-> Bool {
//    if (movie.startDate < Date() && movie.endDate > Date()) {
//        return true
//    }
//    else {
//        return false
//    }
//}

//    struct filtersView : View {
//        @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//        @State var showPicker = false
//        @State var startDate = Date()
//        @State var showDials = false
//
//        var body: some View {
//            VStack {
//                HStack {
//                    Button(action: {
//                        //self.showPicker.toggle()
//                        self.showDials.toggle()
//                    }) {
//                        Text("Genre")
//                    }.sheet(isPresented: $showDials, content: {DialPicker()})
//
//                    //Text(selectedGenre)
//
//                }
//
//                Divider()
//
//                HStack {
//                    Button(action: {
//                        print("Select Region")
//                    }) {
//                        Text("Region")
//                    }
//                }
//
//                Divider()
//
//                Button(action: {
//
//                }) {
//                    Text("Distribution")
//                }
//
//                Divider()
//
//                Button(action: {
//                    print("Settings Applied")
//                    self.presentationMode.wrappedValue.dismiss()
//
//                }) {
//                    Text("APPLY")
//                }
//            }
//        }
//    }

//    struct pickerView: View {
//
//        @State private var offset = CGSize.zero
//
//
//        var body: some View {
//
//            let drag = DragGesture()
//                .onChanged { value in
//                    self.offset = CGSize(width: (self.offset.width + value.translation.width), height: (self.offset.height + value.translation.height))
//
//            }
//                .onEnded { value in
//                    print(UIScreen.main.coordinateSpace)
//                }
//
//            return ZStack {
//            ForEach(genres, id: \.id) {genre in
//                Button (action: {
//                    selectedGenre = genre.title
//                }) {
//                    Text("\(genre.title)")
//                }.frame(width: 100, height: 100, alignment: .center)
//                 .background(Color("wbblue"))
//                 .foregroundColor(.white)
//                 .cornerRadius(50)
//                 .offset(self.offset)
//                 .animation(Animation.spring())
//                 .gesture(drag)
//
//            }
//            }
//        }
//    }
//
//
//    struct circles: Identifiable {
//        var id = UUID()
//        let title: String
//    }


}
    

