//
//  VRMenuView.swift
//  empathyApp
//
//  Created by Harsha Karanth on 4/20/21.
//

import Foundation
import UIKit
import SwiftUI

struct VRMenuView: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: VRMenu, context: Context) {
////////
    }
    

    func makeUIViewController(context: Context) -> VRMenu {

        guard let viewController = UIStoryboard(name: "VRViewStoryboard", bundle: nil).instantiateViewController(identifier: "VRMenu") as? VRMenu else {
            fatalError("VRMenu not implemented in storyboard")
        }

        return viewController
    }

    func updateUIViewController(context: Context) {

        // update code

    }

}
