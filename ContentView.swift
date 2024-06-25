//
//  ContentView.swift
//  navlist_swui
//
//  Created by Pavel Ruzmanov on 24.06.2024.
//
/*
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
   List(cats.indices, id: \.self, editActions: .delete)) { index in
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
   */

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
        // для того чтобы значения стимились надо указать $ перед экземпляром
        List($cats, id: \.self, editActions: .delete) { $user in
          NavigationLink(user.name){
          CatDetails(cat: user.name)
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

/*
 Тут хешированый нужен был, для этого достаточно подписать под протокол Hashable.
 Как будто можно было не использовать лишний тип только для хранения имен,
 хватило бы просто массива строк (строки под капотом уже имеют хеш значения, под протокол бы не пришлось ничего прописывать)
*/
struct Cat: Hashable {
  var name: String
  let id = UUID()
}
