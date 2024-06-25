//
//  CatDetails.swift
//  navlist_swui
//
//  Created by Pavel Ruzmanov on 25.06.2024.
//

import SwiftUI

struct CatDetails: View {
  let cat: String
  var body: some View {
      Text("Cat name: " + cat).navigationTitle("Cat name: " + cat)
  }
}

#Preview {
  CatDetails(cat: String())
}
