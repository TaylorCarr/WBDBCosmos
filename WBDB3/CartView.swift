//
//  CartView.swift
//  WBDB3
//
//  Created by Taylor Carr on 12/10/19.
//  Copyright © 2019 Taylor Carr. All rights reserved.
//

import SwiftUI

struct CartView: View {
    //@EnvironmentObject var cart: globalCart
    //@State var cart: [movies]
    @EnvironmentObject var cartInstance: CartClass
    @State var fromDate: Date = Date()
    @State var toDate: Date = Date()
    @State var showFromPicker = false
    @State var showToPicker = false
    @State var licensee: String = ""
    @State var dealID: String = String(Int.random(in: 100000..<999999))
    @State var exclusivity = 0
    
    var body: some View {
        Group {
            VStack {
                Form {
                    Text("AVAILS LIST ID: \(dealID)")
                    TextField("LICENSEE", text: self.$licensee)
                    DatePicker(selection: self.$fromDate, in: ...Date().addingTimeInterval(1577847600), displayedComponents: .date, label: {
                        Text("FROM")
                    })
                    DatePicker(selection: self.$toDate, in: fromDate...Date().addingTimeInterval(1577847600), displayedComponents: .date, label: {
                        Text("TO")
                    })
                    Picker(selection: $exclusivity, label: Text("EXCLUSIVITY")) {
                        Text("EXCLUSIVE").tag(0)
                        Text("NON-EXCLUSIVE").tag(1)
                    }.pickerStyle(SegmentedPickerStyle())
                    }.frame(width: UIScreen.main.bounds.width, height: CGFloat(290), alignment: .top)
            ScrollView {
                VStack {
                    List {
                        ForEach(self.cartInstance.globalCart, id: \.id) { title in
                            movieRowCart(title: title)
                        }.onDelete{
                            self.cartInstance.globalCart.remove(atOffsets: $0)
                        }
                    }.frame(width: UIScreen.main.bounds.width, height: CGFloat(120 * self.cartInstance.globalCart.count), alignment: .center).background(Color(UIColor.systemGray))
                }.background(Color(UIColor.systemGray2))
            }
         Button(action: {
            print("finalized")
         }) {
            Text("FINALIZE".uppercased()).font(.headline).frame(width: screenWidth * 0.8, height: screenHeight * 0.05, alignment: .center).foregroundColor(wbBlue).overlay(RoundedRectangle(cornerRadius: screenHeight * 0.05).stroke(wbBlue, lineWidth: 5))
                }.padding()
        }
    }
    }}

struct movieRowCart: View {
    
    let title: movies
    @State var fromDate: Date = Date()
    @State var toDate: Date = Date()
    @State var showFromPicker = false
    @State var showToPicker = false
    
    func formatDate(dateString: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = "MM-yyyy"
        
        let returnDate = formatter.date(from: dateString)!
        
        return returnDate
    }
    
    
    var body: some View {
        
        //ScrollView {
        HStack (spacing: 10){
            Image(uiImage: title.poster!)
                .resizable()
                .frame(width: CGFloat(66), height: CGFloat(100))
            VStack {
                Text(title.title).font(.headline).frame(width: CGFloat(UIScreen.main.bounds.width/2), height: CGFloat(50), alignment: .leading)
                }.frame(width: CGFloat(UIScreen.main.bounds.width/2), height: CGFloat(50), alignment: .leading)
            }.padding().frame(width: UIScreen.main.bounds.width - 200, height: CGFloat(100), alignment: .leading)
    }//.frame(width: UIScreen.main.bounds.width-50, height: CGFloat(100), alignment: .topLeading)
}


struct label: View {
    var body: some View {
        HStack {
        Text("Label")
    }
}
}

func dateFormatter (date: Date) -> String {
    let format = DateFormatter(format: "MMM YYYY")
    
    return format.string(from: date)
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView().environmentObject(CartClass())
    }
}
