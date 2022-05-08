//
//  ViewController.swift
//  MVVM_BringMyOwnBeer
//
//  Created by 김지인 on 2022/05/03.
//

import UIKit
import RxSwift
import RxCocoa

class BeerListViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    let viewModel = BeerViewModel()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "맥주리스트"
        viewModel.beerModelData
            .bind(to: tableView.rx.items(cellIdentifier: "BeerListTableViewCell", cellType: BeerListTableViewCell.self)) { index, item, cell in
                cell.data = item
            }.disposed(by: disposeBag)
        viewModel.reload()
    }
}
