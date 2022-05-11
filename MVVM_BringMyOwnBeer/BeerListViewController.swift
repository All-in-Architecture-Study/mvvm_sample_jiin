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
    
    private let viewModel = BeerViewModel()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        setTableView()
    }
    
    private func setNavigation() {
        self.navigationController?.title = "맥주리스트"
    }
    
    private func setTableView() {
        viewModel.beerModelData
            .bind(to: tableView.rx.items(cellIdentifier: "BeerListTableViewCell", cellType: BeerListTableViewCell.self)) { index, item, cell in
                cell.configureData(item)
            }.disposed(by: disposeBag)
        viewModel.reload()
    }
}
