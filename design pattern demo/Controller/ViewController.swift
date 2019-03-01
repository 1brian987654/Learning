/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

final class ViewController: UIViewController {
  private enum Constants {
    static let CellIdentifier = "Cell"
  }

  @IBOutlet var tableView: UITableView!
  @IBOutlet var undoBarButtonItem: UIBarButtonItem!
  @IBOutlet var trashBarButtonItem: UIBarButtonItem!
  
  // Decorator pattern -- Delegration:
//  private var currentAlbumIndex = 0
//  private var currentAlbumData: [AlbumData]?
//  private var allAlbums = [Album]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
//    allAlbums = LibraryAPI.shared.getAlbums()
//    tableView.dataSource = self
//
//    showDataForAlbum(at: currentAlbumIndex)
  }
  
//  private func showDataForAlbum(at index: Int) {
//    if index < allAlbums.count && index > -1 {
//      let album = allAlbums[index]
//      currentAlbumData = album.tableRepresentation
//    } else {
//      currentAlbumData = nil
//    }
//    tableView.reloadData()
//  }

}

//extension ViewController: UITableViewDataSource {
//  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    guard let albumData = currentAlbumData else {
//      return 0
//    }
//    return albumData.count
//  }
//
//  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifier, for: indexPath)
//    if let albumData = currentAlbumData {
//      let row = indexPath.row
//      cell.textLabel?.text = albumData[row].title
//      cell.detailTextLabel?.text = albumData[row].value
//    }
//    return cell
//  }
//}

