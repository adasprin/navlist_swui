//
//  ContentView.swift
//  navlist_swui
//
//  Created by Pavel Ruzmanov on 24.06.2024.
//

import SwiftUI

struct ContentView: View {
  @State private var cats = [
    Cat(name: "Tom"),
    Cat(name: "Bob"),
    Cat(name: "Liam"),
    Cat(name: "Tina"),
    Cat(name: "Ualla")
  ]
  func addCat() {
    cats.append(Cat(name: "A cat"))
  }
  var body: some View {
    NavigationStack {
      List(cats.indices, id: \.self) { index in
        NavigationLink(self.cats[index].name){
          CatDetails(cat: self.cats[index].name)
        }.swipeActions() {
          Button("Delete") {
            print(index)
            cats.remove(at: index) // Не понимаю как вынуть номер текущего элемента
          }.tint(.red)
        }
      }
      .navigationTitle("Cats list")
      .navigationBarTitleDisplayMode(.automatic)
      .toolbar {
        Button(action: addCat) {
          Text("Add a cat")
        }
      }
    }
  }
}

#Preview {
    ContentView()
}
struct Cat: Identifiable {
    var name: String
    var id = UUID()
}
