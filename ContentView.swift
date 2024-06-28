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
    showingAlert.toggle()
  }
  func submit() {
    if (name != "") {
      cats.append(Cat(name: name))
      name = ""
    } else {
      return
    }
  }
  @State private var showingAlert = false
  @State private var name = ""
  
  var body: some View {
    NavigationStack {
      // для того чтобы значения стимились надо указать $ перед экземпляром
      List($cats, id: \.self, editActions: .delete) { $user in
        NavigationLink(user.name) {
          CatDetails(cat: user.name)
        }
      }
      .navigationTitle("Cats list")
      .navigationBarTitleDisplayMode(.automatic)
      .toolbar {
        Button(action: addCat) {
          Text("Add a cat")
        }.alert(
          "Имя кота",
          isPresented: $showingAlert
        ) {
          TextField("Enter your name", text: $name)
          Button("OK", action: submit)
          Button("Cancel", role: .cancel) {}
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
