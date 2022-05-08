//
//  ViewController.swift
//  MVVM_BringMyOwnBeer
//
//  Created by 김지인 on 2022/05/03.
//

import UIKit
import Alamofire

class BeerListViewController: UIViewController {
    var beerList = [Beer]()
    private let urlLink = "https://api.punkapi.com/v2/beers"

    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "맥주리스트"
        tableView.dataSource = self
    }
    
    
}

extension BeerListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerListTableViewCell", for: indexPath) as! BeerListTableViewCell
        cell.data = beerList[indexPath.row]
        return cell
    }
}

extension BeerListViewController {
    
}
