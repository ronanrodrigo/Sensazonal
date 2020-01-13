//
//  FoodCell.swift
//  iOS
//
//  Created by Ronan R. Nunes on 23/11/19.
//  Copyright © 2019 Ronan Rodrigo Nunes. All rights reserved.
//

import SwiftUI

struct FoodCell: View {

    @State var favorited: Bool = false

    var body: some View {
        HStack {
            Image(systemName: "photo")
            Text("Hello, World!")
            Button(action: {
                self.favorited.toggle()
            }) {
                if self.favorited {
                    Image(systemName: "heart.fill")
                } else {
                    Image(systemName: "heart")
                }
            }
        }
    }
}

struct FoodCell_Previews: PreviewProvider {
    static var previews: some View { FoodCell() }
}
