//
//  ViewController.swift
//  ejemploMVVM
//
//  Created by Salvador Lopez on 10/09/20.
//  Copyright © 2020 Salvador Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var articleListVM: ArticleListViewModel!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = 150
    loadData()
  }

  func loadData(){
    
    let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=0cf790498275413a9247f8b94b3843fd")!
    
    WebService().getArticles(url: url) { (articulos) in
      if let articulos = articulos{
        // Pasar esto a la vista del modelo (vm)
        self.articleListVM = ArticleListViewModel(articles: articulos)
        // Refrescar estos datos en la tabla
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
      }
    }
    
  }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return articleListVM == nil ? 0 : articleListVM.numberOfSections
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return articleListVM.numberOfRowsInSection(section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
    
    let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
    cell.titulo.text = articleVM.titulo
    cell.contenido.text = articleVM.description
    
    return cell
  }
  
}
