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
    
    public var data: Beer? {
        didSet {
            guard let data = data else { return }
            guard let id = data.id else { return }
            beerId.text = "\(String(describing: id))"
            beerName.text = data.name
            beerDescription.text = data.description
            let imageURL = URL(string: data.imageURL ?? "")
            beerImage.kf.setImage(with: imageURL)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }

}
