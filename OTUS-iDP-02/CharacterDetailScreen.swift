//
//  CharacterDetailScreen.swift
//  OTUS-IDP-02
//
//  Created by Igor Andryushenko on 11.04.2021.
//

import Foundation
import SwiftUI
import UIComponents
import NetworkingRAM

struct CharacterDetailScreen: View {
 
    var item: Char?
    
    var body: some View {
        VStack{
            NavPopButton(destination: .previous){
                Image(systemName: "arrow.left.circle.fill")
                    .font(.largeTitle)
            }
            
            Text("Caracter details")
                .font(.largeTitle)
                .padding(.top, 20)
            
            Text("Name: \(item?.name ?? "")")
            Text("Gender: \(item?.gender ?? "")")
            Text("Status: \(item?.status ?? "")")
            
            NavPushButton(destination: LazyView(CharacterImageScreen(item: item))) {
                Text("Show Origin and Location")
                    .padding(20)
                    .foregroundColor(Color.blue)
            }
        }
    }
}

struct CharacterImageScreen: View {
 
    var item: Char?
    
    var body: some View {
        VStack{
            HStack{
                NavPopButton(destination: .previous){
                    Image(systemName: "arrow.left.circle.fill")
                        .font(.largeTitle)
                }
                NavPopButton(destination: .root){
                    Image(systemName: "house")
                        .font(.largeTitle)
                }
            }
            
            
            Text("Origin and Location")
                .font(.largeTitle)
                .padding(.top, 20)
            
            Text("Name: \(item?.name ?? "")")
            Text("Origin: \(item?.location?.name ?? "")")
            Text("Location: \(item?.location?.name ?? "")")
            
            
        }
    }
}

struct CharacterDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailScreen()
    }
}
