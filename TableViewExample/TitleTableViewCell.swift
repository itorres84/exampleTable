//
//  TitleTableViewCell.swift
//  TableViewExample
//
//  Created by Israel Torres Alvarado on 12/03/21.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    @IBOutlet weak var imageContent: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var content: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        content.backgroundColor = .white
        content.layer.cornerRadius = 10
        content.clipsToBounds = true
        content.dropShadow()
    }
    
    func configure(_ model: TitleCellModel) {
        imageContent.image = UIImage(named: model.image)
        lblTitle.text = model.name
    }

}
