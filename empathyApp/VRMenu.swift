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
    
    @IBOutlet weak var imgPanoramaView: GVRPanoramaView! //instance of panoramic view
    
    @IBOutlet weak var imgVideoView: GVRVideoView!
    enum Media {
        static var photoArray = ["777-Atlantic-Dr-NW-Laundry.jpg"] //array of the photos used of makerspace
        static let videoURL = "777.mp4"
        
    }
    var currentView: UIView? //ui component of view
    var currentDisplayMode = GVRWidgetDisplayMode.embedded
    var isPaused = true //starts off paused
    
    override func viewDidLoad() {
      super.viewDidLoad()
       // readMeText.isHidden = true
        imgPanoramaView.isHidden = true //start off not viewing
        imgPanoramaView.delegate = self //set delegate to self
        //videoLabel.isHidden = true
        //videoVRView.isHidden = true
      imgPanoramaView.load(UIImage(named: Media.photoArray.first!),
                                    of: GVRPanoramaImageType.mono) //load the image as a ui image into the panoramic view for gvr
      //imgVideoView.load(from: URL(string: "777.mp4"))
      imgPanoramaView.enableCardboardButton = true //allow a button to go to google cardboard
      imgPanoramaView.enableFullscreenButton = true //fullscreen button
      
      //imgVideoView.enableCardboardButton = true
      //imgVideoView.enableFullscreenButton = true
    }
    func setTouchView(touchPoint point:CGPoint) {
      if imgPanoramaView!.frame.contains(point) { //allow to touch image
        currentView = imgPanoramaView //touch point in image
      }
    }
    
}
extension VRMenu: GVRWidgetViewDelegate {
  func widgetView(_ widgetView: GVRWidgetView!, didLoadContent content: Any!) {
    if content is UIImage { //checks the type of image
     imgPanoramaView.isHidden = false //show the panoramic image view
     //readMeText.isHidden = false
    }/* else if content is NSURL {
     videoVRView.isHidden = false
     videoLabel.isHidden = false
    }*/
  }

  func widgetView(_ widgetView: GVRWidgetView!, didFailToLoadContent content: Any!,
    withErrorMessage errorMessage: String!)  { //print error message if fails
    print(errorMessage)
  }

  func widgetView(_ widgetView: GVRWidgetView!, didChange displayMode: GVRWidgetDisplayMode) {
    currentView = widgetView //sets the current ui view
    currentDisplayMode = displayMode //sets display mode
    //refreshVideoPlayStatus()
    if currentView == imgPanoramaView && currentDisplayMode != GVRWidgetDisplayMode.embedded { //checks to see if its the panoramic image view being displayed
      view.isHidden = true //shows if this is the case
    } else {
      view.isHidden = false
    }
  }
  
  func widgetViewDidTap(_ widgetView: GVRWidgetView!) {
    guard currentDisplayMode != GVRWidgetDisplayMode.embedded else {return}
    if currentView == imgPanoramaView {
      Media.photoArray.append(Media.photoArray.removeFirst()) //go to the next image by tapping
        imgPanoramaView?.load(UIImage(named: Media.photoArray.first!), of: GVRPanoramaImageType.mono)
    }
  }
}

class TouchView: UIView {
  override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
    if let VRMenu = viewController() as? VRMenu , event?.type == UIEvent.EventType.touches {
      VRMenu.setTouchView(touchPoint: point)
    } //touch view class that finds what point is being touched
    return true
  }
  
  func viewController() -> UIViewController? {
    if self.next!.isKind(of: VRMenu.self) {
      return self.next as? UIViewController
    } else {
      return nil
    } //corresponding view controllers
  }
}

