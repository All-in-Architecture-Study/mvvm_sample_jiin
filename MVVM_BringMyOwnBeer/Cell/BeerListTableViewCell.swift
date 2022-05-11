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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }

    public func configureData(_ cellData: Beer) {
        let id = cellData.id
        beerId.text = "\(String(describing: id))"
        beerName.text = cellData.name
        beerDescription.text = cellData.description
        let imageURL = URL(string: cellData.imageURL ?? "")
        beerImage.kf.setImage(with: imageURL)
    }
}
