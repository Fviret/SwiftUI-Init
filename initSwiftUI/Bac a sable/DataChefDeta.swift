//
//  DataChefDeta.swift
//  Bac a sable
//
//  Created by Florian  on 21/05/2021.
//

import Foundation



struct ChefDEtat: Identifiable {
    var id = UUID()
    var name : String
    var ImageUrl : String
    var pays : String
    var regime : String
    var age : Int
    
    
    
    static let teamChef = [
        ChefDEtat(name: "Boris Johnson", ImageUrl: "Boris_Johnson", pays: "Royaumes-Unis", regime: "Republique", age : 56),
    ChefDEtat(name: "Jair Bolsonaro" , ImageUrl: "Jair_Bolsonaro",pays: "Bresil", regime: "Republique",age : 66),
    ChefDEtat(name: "Joe Biden", ImageUrl: "Joe_Biden",pays: "Etats-Unis", regime: "Republique", age : 78),
    ChefDEtat(name: "Kimy", ImageUrl: "Kim", pays: "Coree du Nord", regime: "Dictature", age : 37),
    ChefDEtat(name: "Vladimir Poutine", ImageUrl: "VladimirPutin", pays: "Russie", regime: "Republique", age : 68),
    ChefDEtat(name: "Xi Jinping", ImageUrl: "Xi_Jinping",pays: "Chine", regime: "Republique", age : 67)]
}

