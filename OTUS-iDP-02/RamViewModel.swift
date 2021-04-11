//
//  RamViewModel.swift
//  OTUS-IDP-02
//
//  Created by Igor Andryushenko on 11.04.2021.
//


import Foundation
import NetworkingRAM

extension Char: Identifiable {
    public var id: String {
        url
    }
}

extension Episode: Identifiable {
    public var id: String {
        url
    }
}

final class RamViewModel: ObservableObject {
    
    @Published private(set) var itemsChar: [Char] = [Char]()
    @Published private(set) var itemsEpi: [Episode] = [Episode]()
    @Published private(set) var pageChar: Int = 0
    @Published private(set) var pageEpi: Int = 0
    @Published private(set) var isPageLoading: Bool = false
    @Published var type: Int = 0
        
    init() {}
    
    func loadPage() {
        
        guard isPageLoading == false else {
            return
        }
        isPageLoading = true
       
        
        if type == 0 {
            pageChar += 1
            RamAPI.getChars(page: pageChar){ response, error in
                if let results = response?.results {
                    self.itemsChar.append(contentsOf: results)
                }
                self.isPageLoading = false
            }
        } else if type == 1 {
            pageEpi += 1
            RamAPI.getEpisodes(page: pageEpi){ response, error in
                if let results = response?.results {
                    self.itemsEpi.append(contentsOf: results)
                }
                self.isPageLoading = false
            }
        }
    }
}


