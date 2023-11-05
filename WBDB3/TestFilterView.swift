//
//  TestFilterView.swift
//  WBDB3
//
//  Created by Taylor Carr on 12/5/19.
//  Copyright © 2019 Taylor Carr. All rights reserved.
//

import SwiftUI
import UIKit

struct TestFilterView: View {
    @State var territory = "TERRITORY"
    @State var media = "MEDIA"
    @State var genres: [genre] = [
        genre(name: "Action"),
        genre(name: "Horror"),
    ]
    @State var selectedGenres: [String] = ["GENRES"]
    @State var years: [CGFloat] = [2019, 2055]
    @State var selected = filterOption()

    let screenW = UIScreen.main.bounds.width
    let screenH = UIScreen.main.bounds.height

    var body: some View {
        GeometryReader { _ in
            VStack {
                HStack(spacing: 50) {
                    Text(self.territory)
                    Text(self.media)
                    VStack {
                        ForEach(self.selectedGenres, id: \.self) { genre in
                            Text(genre)
                        }
                    }
                }.frame(width: UIScreen.main.bounds.width, height: 300, alignment: .center)
                Group {
                    ForEach(self.genres, id: \.id) { genre in
                        Button(action: {
                            self.selected.selected = !self.selected.selected
                            if self.selected.selected == true {
                                self.genres.append(genre)
                            } else {
                                // self.genres.removeAll(where: {)
                            }
                        }) {
                            Text(verbatim: genre.name)
                        }.buttonStyle(self.selected)
                    }
                } // .frame(width: self.screenW, height: 800, alignment: .center)
                Group {
                    MultiValueSlider(value: self.$years, minimumValue: 2019, maximumValue: 2055, snapStepSize: CGFloat(1.0), valueLabelPosition: .top, outerTrackColor: .lightGray, hasRoundTrackEnds: true)
                }.frame(width: self.screenW - 100, height: 150, alignment: .bottom).padding()
                Text(verbatim: "test")
            }.frame(width: self.screenW, height: UIScreen.main.bounds.height, alignment: .center)
        }
    }
}

struct TestFilterView_Previews: PreviewProvider {
    static var previews: some View {
        TestFilterView()
    }
}

extension MultiValueSlider {}

struct genre {
    let id = UUID()
    var name: String
}

struct filterOption: ButtonStyle {
    var selected = false
    // var value: String

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 150, height: 150, alignment: .center)
    }
}
