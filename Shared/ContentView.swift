//
//  ContentView.swift
//  Shared
//
//  Created by Don Chia on 25/1/21.
//

import SwiftUI

struct DetailView1: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var isActive: Bool
    var body: some View {
        VStack {
            NavigationLink(destination: DetailView2()) {
                Text("Tap to dismiss DetailView and show DetailView2")
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.isActive.toggle()
                        }
                    }
            }
        }
    }
}
struct DetailView2: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        Button(
            "This is DetailView2",
            action: { self.presentationMode.wrappedValue.dismiss() }
        )
    }
}
struct RootView: View {
    @State var isActive: Bool = false
    var body: some View {
        VStack {
            NavigationLink(destination: DetailView1(isActive: $isActive))
            { Text("This is root view. Tap to go to DetailView") }
            
            NavigationLink(destination: DetailView2() ,isActive: self.$isActive) {
                    EmptyView()
            }
        }
    }
}
struct ContentView: View {
    var body: some View {
        NavigationView {
            RootView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
