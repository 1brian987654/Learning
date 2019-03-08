/// Copyright (c) 2018 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit
import ARKit

class EmojiBlingViewController: UIViewController {

  @IBOutlet var sceneView: ARSCNView!
  let noseOptions = ["👃", "🐽", "💧", " "]
  let eyeOptions = ["👁", "🌕", "🌟", "🔥", "⚽️", "🔎", " "]
  let mouthOptions = ["👄", "👅", "❤️", " "]
  let hatOptions = ["🎓", "🎩", "🧢", "⛑", "👒", " "]
  let features = ["nose", "leftEye", "rightEye", "mouth", "hat"]
  let featureIndices = [[9], [1064], [42], [24, 25], [20]]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    guard ARFaceTrackingConfiguration.isSupported else { fatalError() }
    sceneView.delegate = self
    
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    let configuration = ARFaceTrackingConfiguration()
    
    sceneView.session.run(configuration)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    sceneView.session.pause()
  }
  
  func updateFeatures(for node: SCNNode, using anchor: ARFaceAnchor) {
    for (feature, indices) in zip(features, featureIndices) {
      let child = node.childNode(withName: feature, recursively: false) as? EmojiNode
      let vertices = indices.map { anchor.geometry.vertices[$0] }
      child?.updatePosition(for: vertices)
      
      switch feature {
      case "leftEye":
        let scaleX = child?.scale.x ?? 1.0
        let eyeBlinkValue = anchor.blendShapes[.eyeBlinkLeft]?.floatValue ?? 0.0
        child?.scale = SCNVector3(scaleX, 1.0 - eyeBlinkValue, 1.0)
      case "rightEye":
        let scaleX = child?.scale.x ?? 1.0
        let eyeBlinkValue = anchor.blendShapes[.eyeBlinkRight]?.floatValue ?? 0.0
        child?.scale = SCNVector3(scaleX, 1.0 - eyeBlinkValue, 1.0)
      case "mouth":
        let jawOpenValue = anchor.blendShapes[.jawOpen]?.floatValue ?? 0.2
        child?.scale = SCNVector3(1.0, 0.8 + jawOpenValue, 1.0)
      default:
        break
      }
    }
  }
  
  @IBAction func handleTap(_ sender: UITapGestureRecognizer) {
    let location = sender.location(in: sceneView)
    let results = sceneView.hitTest(location, options: nil)
    if let result = results.first,
      let node = result.node as? EmojiNode {
      node.next()
    }
  }
}

extension EmojiBlingViewController: ARSCNViewDelegate {
  
  func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
    guard let faceAnchor = anchor as? ARFaceAnchor,
          let device = sceneView.device else { return nil }
    let faceGeometry = ARSCNFaceGeometry(device: device)
    let node = SCNNode(geometry: faceGeometry)
    node.geometry?.firstMaterial?.fillMode = .lines
    
    node.geometry?.firstMaterial?.transparency = 0.0
    let noseNode = EmojiNode(with: noseOptions)
    noseNode.name = "nose"
    node.addChildNode(noseNode)
    
    let leftEyeNode = EmojiNode(with: eyeOptions)
    leftEyeNode.name = "leftEye"
    leftEyeNode.rotation = SCNVector4(0, 1, 0, GLKMathDegreesToRadians(180.0))
    node.addChildNode(leftEyeNode)
    
    let rightEyeNode = EmojiNode(with: eyeOptions)
    rightEyeNode.name = "rightEye"
    node.addChildNode(rightEyeNode)
    
    let mouthNode = EmojiNode(with: mouthOptions)
    mouthNode.name = "mouth"
    node.addChildNode(mouthNode)
    
    let hatNode = EmojiNode(with: hatOptions)
    hatNode.name = "hat"
    node.addChildNode(hatNode)
    
    updateFeatures(for: node, using: faceAnchor)
    return node
  }
  
  func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
    guard let faceAnchor = anchor as? ARFaceAnchor, let faceGeometry = node.geometry as? ARSCNFaceGeometry else { return }
    
    faceGeometry.update(from: faceAnchor.geometry)
    updateFeatures(for: node, using: faceAnchor)
  }
}


