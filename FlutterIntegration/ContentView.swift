//
//  ContentView.swift
//  FlutterIntegration
//
//  Created by Flavio Franco on 21/01/24.
//

import SwiftUI
import Flutter

struct ContentView: View {
    var body: some View {
        VStack {
            Text("This is a native screen :D")
            Spacer()
                .frame(height: 24)
            Button("Open Flutter Screen", action: launchFlutterScreen)
        }
        .padding()
    }
}

func launchFlutterScreen() {
    // Get the RootViewController.
    guard
      let windowScene = UIApplication.shared.connectedScenes
        .first(where: { $0.activationState == .foregroundActive && $0 is UIWindowScene }) as? UIWindowScene,
      let window = windowScene.windows.first(where: \.isKeyWindow),
      let rootViewController = window.rootViewController
    else { return }

    // Create the FlutterViewController without an existing FlutterEngine.
    let flutterViewController = FlutterViewController(
      project: nil,
      nibName: nil,
      bundle: nil)
    flutterViewController.modalPresentationStyle = .overCurrentContext
    flutterViewController.isViewOpaque = false

    rootViewController.present(flutterViewController, animated: true)
}

#Preview {
    ContentView()
}
