//
//  ArticleListViewModel.swift
//  ejemploMVVM
//
//  Created by Salvador Lopez on 10/09/20.
//  Copyright © 2020 Salvador Lopez. All rights reserved.
//

import Foundation

// Estructura que maneja la lista de articulos
struct ArticleListViewModel{
  let articles: [Articulo]
}

// Extension - Funciones del modelo de vista (VM) para pasar datos del ws al controller (Tabla)
extension ArticleListViewModel {
  
  // Variable que nos sirve para especificar las secciones en una tabla
  var numberOfSections: Int{
    return 1
  }
  
  // Metodo para indicar el numero de celdas en una seccion
  func numberOfRowsInSection(_ section: Int) -> Int {
    return self.articles.count
  }
  
  // Conocer y retornar un articulo en base a su indice
  func articleAtIndex(_ index: Int) -> ArticleViewModel{
    let article = self.articles[index]
    return ArticleViewModel(article)
  }
  
}

// Estructura que maneja un articulo
struct ArticleViewModel{
  private let article: Articulo
}

// Extension - Funcion del modelo de vista (VM) para inicializar un articulo
extension ArticleViewModel{
  // Metodo inicializador del ws
  init(_ article: Articulo){
    self.article = article
  }
}

//Obtener las propiedades de los articulos
extension ArticleViewModel{
  //Obtener el titulo
  var titulo: String{
    return self.article.title!
  }
  //Obtener la descripcion
  var description: String{
    return self.article.description ?? ""
  }
}

