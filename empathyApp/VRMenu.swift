//
//  VRMenu.swift
//  empathyApp
//
//  Created by Harsha Karanth on 4/19/21.
//

import Foundation
import SwiftUI
import UIKit

class VRMenu: UIViewController {
    
    @IBOutlet weak var readMeText:UITextView!
    
    @IBOutlet weak var imgPanoramaView: GVRPanoramaView!
    
    @IBOutlet weak var imgVideoView: GVRVideoView!
    enum Media {
      static var photoArray = ["360Test.jpg"]
      static let videoURL = ""
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()
        
      imgPanoramaView.load(UIImage(named: Media.photoArray.first!),
                                    of: GVRPanoramaImageType.mono)
      imgPanoramaView.enableCardboardButton = true
      imgPanoramaView.enableFullscreenButton = true
    }
    
}

