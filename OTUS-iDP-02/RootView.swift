//
//  ContentView.swift
//  OTUS-IDP-02
//
//  Created by Igor Andryushenko on 10.04.2021.
//

import SwiftUI
import UIComponents


struct RootView: View {
    @State private var selectedIndex = 0
    @EnvironmentObject var ramViewModel: RamViewModel
    
        var body: some View {
            
            VStack {
                Picker("RaM", selection: $selectedIndex, content: {
                    Text("Characters").tag(0)
                    Text("Episodes").tag(1)
                })
                .onChange(of: selectedIndex) {
                    print($0)
                    ramViewModel.type = $0
                    ramViewModel.loadPage()
                }
                .pickerStyle(SegmentedPickerStyle())
                
                NavControllerView(transition: .custom(.moveAndFade)) {
                    RaMScreen()
                }
                
                Spacer.init()

            }
        }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
