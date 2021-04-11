//
//  FirstView.swift
//  OTUS-IDP-02
//
//  Created by Igor Andryushenko on 11.04.2021.
//

import SwiftUI
import UIComponents
import NetworkingRAM


struct RaMScreen: View {
    @EnvironmentObject var ramViewModel: RamViewModel
    
    var body: some View {
        LazyView{
            NavigationView {
                List {
                    Section(header: Text("RickandmortyAPI")) {
                        if ramViewModel.type == 0{
                            ForEach(ramViewModel.itemsChar) { char in
                                NavPushButton(destination: LazyView(CharacterDetailScreen(item: char))) {
                                    RamCharCell(item: char)
                                        .onAppear() {
                                            if ramViewModel.itemsChar.isLast(char) {
                                                ramViewModel.loadPage()
                                            }
                                        }
                                }
                                
                            }
                        } else if ramViewModel.type == 1 {
                            ForEach(ramViewModel.itemsEpi) { epi in
                                RamEpiCell(item: epi)
                                    .onAppear() {
                                        if ramViewModel.itemsEpi.isLast(epi) {
                                            ramViewModel.loadPage()
                                        }
                                    }
                            }
                        }
                    }
                } // List
                .navigationTitle("")
                .navigationBarHidden(true)
                .onAppear() {
                    if ramViewModel.type == 0{
                        ramViewModel.loadPage()
                    } else if ramViewModel.type == 1 {
                        ramViewModel.loadPage()
                    }
                }
            }
        }
        
    }
    
}


struct RamCharCell: View {
    
    @EnvironmentObject var ramViewModel: RamViewModel
    let item: Char
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.name.asStringOrEmpty)
                .font(.headline)
                .foregroundColor(.primary)
            Text(item.status.asStringOrEmpty)
                .font(.callout)
                .foregroundColor(.secondary)
            if ramViewModel.isPageLoading && ramViewModel.itemsChar.isLast(item) {
                Divider()
                VStack (alignment: .center) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                .frame(maxWidth: .infinity)
            }
        } // VStack
    }
}

struct RamEpiCell: View {
    
    @EnvironmentObject var ramViewModel: RamViewModel
    let item: Episode
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.name.asStringOrEmpty)
                .font(.headline)
                .foregroundColor(.primary)
            Text(item.episode.asStringOrEmpty)
                .font(.callout)
                .foregroundColor(.secondary)
            if ramViewModel.isPageLoading && ramViewModel.itemsEpi.isLast(item) {
                Divider()
                VStack (alignment: .center) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                .frame(maxWidth: .infinity)
            }
        } // VStack
    }
}

//struct RaMScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        RaMScreen()
//    }
//}
