//
//  OTUS_IDP_02App.swift
//  OTUS-IDP-02
//
//  Created by Igor Andryushenko on 10.04.2021.
//

import SwiftUI
import UIComponents
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    print("📟 SwiftUI_OTUS_App application is starting up. ApplicationDelegate didFinishLaunchingWithOptions.")
    return true
  }
}

//@main
//struct OTUS_IDP_02App: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}


@main
struct SwiftUI_OTUS_App: App {
    
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  
  @Environment(\.scenePhase) var scenePhase
  
  init() {
    print("📟 SwiftUI_OTUS_App application is starting up. App initialiser.")
  }
  
  var body: some Scene {
    WindowGroup {
        RootView()
            .environmentObject(RamViewModel())
    }
    .onChange(of: scenePhase) { newScenePhase in
      switch newScenePhase {
      case .active:
        print("📟 App is active")
      case .inactive:
        print("📟 App is inactive")
      case .background:
        print("📟 App is in background")
      @unknown default:
        print("📟 Oh - interesting: I received an unexpected new value.")
      }
    }
  }
}
