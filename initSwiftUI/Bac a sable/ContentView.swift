//
//  ContentView.swift
//  Bac a sable
//
//  Created by Florian  on 21/05/2021.
//

import SwiftUI

struct ContentView: View {

    
    var body: some View {
        TabView{
            ChefList()
                .tabItem {
                    VStack{
                        Image(systemName: "lasso.sparkles")
                        Text("Dirigeant")
                    }
                }
           
            GestionStack()
            Formulaire()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ChefEtat: View {
    
    var chef : ChefDEtat
    var body: some View {
        HStack{
            Image(chef.ImageUrl)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120 , height: 120)
                .clipShape(Circle(), style: FillStyle())
            Text(chef.name)
                .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

struct ChefList: View {
    var body: some View {
        NavigationView{
            List(ChefDEtat.teamChef) { chef in
                NavigationLink(
                    destination: ChefDetailView(chef: chef)){
                    ChefEtat(chef : chef)
                }
            }.navigationBarTitle("Un jour un Chef", displayMode: .inline)
        }
    }
}

struct GestionStack: View {
    
    @State private var superWidth : CGFloat = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                RoundedRectangle(cornerRadius: 10).fill(Color.red).frame(width: 185, height: 30, alignment: .bottomLeading).shadow(radius: 10)
                Spacer()
            }
            RoundedRectangle(cornerRadius: 10).fill(Color.green).frame(width: 350, height: 60).shadow(radius: 10)
            RoundedRectangle(cornerRadius: 10).fill(Color.blue).frame(width: 50, height: 60).shadow(radius: 10)
            RoundedRectangle(cornerRadius: 10).fill(Color.black).frame(width: 150, height: 30).shadow(radius: 10)
            RoundedRectangle(cornerRadius: 10).fill(Color.yellow).frame(width: 0 + superWidth, height: 30).shadow(radius: 10)
            RoundedRectangle(cornerRadius: 10).fill(Color.white).frame(width: 100, height: 30).shadow(radius: 10)
            Divider()
            Circle().foregroundColor(.blue)
                .onTapGesture(count: 1, perform: {
                    if superWidth < 350{
                   superWidth += 10
                    }
                    else {
                        superWidth = 0
                    }
                })
        }
        .tabItem {
            VStack{
                Image(systemName: "globe")
                Text("World Color")
            }
        }
    }
}

struct Formulaire: View {
    
    //slider
    @State private var value : Double = 250
    //picker
    @State private var pickerIndex = 0
    var cityFrom = ["Paris", "New-York", "Berlin", "London" ]
    var cityToGo = ["Amesterdam", "Vienne", "Rome", "San Francisco", "Brasilia"]
    //toggle
    @State private var bonusTrip = false
    @State private var Animals = false
    @State private var largeSit = false
    // stepper
    @State private var numberPerson = 1
     
    //text form
    
    @State private var name : String = ""
    @State private var surname : String = ""
    @State private var age : String = ""
    var body: some View {
        VStack{
            NavigationView{
                Form{
                    Picker(selection: $pickerIndex, label: Text("Depart")) {
                        ForEach(0..<cityFrom.count){
                            Text(self.cityFrom[$0]).tag($0)
                        }
                    }
                    Picker(selection: $pickerIndex, label: Text("Arrivée")) {
                        ForEach(0..<cityToGo.count){
                            Text(self.cityToGo[$0]).tag($0)
                        }
                    }
                    Section{
                        Text("Mon Budget est de \(Int(value)) $")
                        Slider(value : $value, in: 250...10000)
                            .accentColor(.green)
                    }
                    Stepper(value : $numberPerson, in : 1...10){
                        Text("Nombre de personne: \(numberPerson)")
                        
                    }
                    Section{
                        Toggle(isOn: $bonusTrip){
                            Text("Option voyage")
                        }
                        if bonusTrip{
                            Toggle(isOn: $Animals, label: {
                                Text("J ai un animal compagnie: ")
                            })
                            Toggle(isOn: $largeSit, label: {
                                Text("Je veux un siege plus large: ")
                            })
                        }
                    }
                    Section{
                        TextField("Name", text: $name)
                        TextField("Surname", text: $surname)
                        TextField("Age", text: $age)
                    }
                    Button("Send") {
                        
                    }.cornerRadius(40)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding()
                }
            }
        }.tabItem {
            VStack{
                Image(systemName: "graduationcap.fill")
                Text("Formulaire")
            }
        }
    }
}
