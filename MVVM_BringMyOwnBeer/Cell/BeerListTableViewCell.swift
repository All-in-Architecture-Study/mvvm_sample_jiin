//
//  BeerListTableViewCell.swift
//  MVVM_BringMyOwnBeer
//
//  Created by 김지인 on 2022/05/03.
//

import UIKit
import Kingfisher

class BeerListTableViewCell: UITableViewCell {

    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var beerId: UILabel!
    @IBOutlet weak var beerName: UILabel!
    @IBOutlet weak var beerDescription: UILabel!
    
    public var data: Any? { //네이밍,,
        didSet { //값이 변경되야 할 변수에서 주로 사용 굳이 ?!
            guard let data = data as? BeerModel else { return }
            let id = data.id
            beerId.text = "\(String(describing: id))"
            beerName.text = data.name
            beerDescription.text = data.description
            let imageURL = URL(string: data.imageURL)
            beerImage.kf.setImage(with: imageURL)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    // 셀 데이터 값 받아오기는 메소드 따로 필요 ,,
//    func cellConfigure() {
//
//    }

}
