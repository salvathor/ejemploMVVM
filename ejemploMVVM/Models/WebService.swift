//
//  WebService.swift
//  ejemploMVVM
//
//  Created by Salvador Lopez on 10/09/20.
//  Copyright © 2020 Salvador Lopez. All rights reserved.
//

import Foundation

class WebService {
  
  func getArticles(url: URL, completion: @escaping ([Articulo]?) -> ()){
    URLSession.shared.dataTask(with: url) { (data, resp, error) in
      if let error = error{
        print("Error: \(error)")
      }else if let data = data {
        do {
          let articleList = try? JSONDecoder().decode(ArticuloLista.self, from: data)
          
          if let articleList = articleList{
            completion(articleList.articles)
          }
          
        }catch{
          print("Error: \(error)")
        }
      }
    }.resume()
  }
  
}
