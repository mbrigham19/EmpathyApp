//
//  PlayerView.swift
//  test
//
//  Created by Molly Brigham on 11/23/20.
//
import SwiftUI
import UIKit

struct PlayerView: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
  }
func makeUIView(context: Context) -> UIView {
    return PlayerUIView(frame: .zero)
  }

}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
