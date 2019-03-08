//
//  LibraryAPI.swift
//  RWBlueLibrary
//
//  Created by ATLAS on 2019/3/1.
//  Copyright © 2019 Razeware LLC. All rights reserved.
//

import Foundation

final class LibraryAPI {
  // Singleton pattern:
  //shared 声明的常量使得其他对象可以访问到单例对象 LibraryAPI
  static let shared = LibraryAPI()
  //私有的初始化方法防止从外部创建 LibraryAPI 的新实例
  private init() { }

  // Facade pattern:
  private let persistencyManager = PersistencyManager()
  private let httpClient = HTTPClient()
  private let isOnline = false
  
  func getAlbums() -> [Album] {
    return persistencyManager.getAlbums()
  }
  func addAlbum(_ album: Album, at index: Int) {
    persistencyManager.addAlbum(album, at: index)
    if isOnline {
      httpClient.postRequest("/api/addAlbum", body: album.description)
    }
  }
  func deleteAlbum(at index: Int) {
    persistencyManager.deleteAlbum(at: index)
    if isOnline {
      httpClient.postRequest("/api/deleteAlbum", body: "\(index)")
    }
  }

}

