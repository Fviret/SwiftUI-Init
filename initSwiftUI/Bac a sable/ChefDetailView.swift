//
//  ChefDetailView.swift
//  Bac a sable
//
//  Created by Florian  on 21/05/2021.
//

import SwiftUI

struct ChefDetailView: View {
    
    var chef : ChefDEtat
    
    var body: some View {
        VStack(spacing : 20){
            Image(chef.ImageUrl)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250 , height: 250)
                .clipShape(Circle(), style: FillStyle())
            Divider()
            Text(chef.name)
                .frame(maxWidth: .infinity, alignment: .center)
            Text("il dirige le/la: \(chef.pays)" )
            Text("le regime du pays est une \(chef.regime)")
            Text("Son age est de : \(chef.age) ans")
            Spacer()
            Divider()
        }
    }
}

struct ChefDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChefDetailView(  chef : ChefDEtat(name: "Boris Johnson", ImageUrl: "Boris_Johnson", pays: "Royaumes-Unis", regime: "Republique", age : 56))
    }
}
