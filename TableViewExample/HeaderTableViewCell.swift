//
//  HeaderTableViewCell.swift
//  TableViewExample
//
//  Created by Israel Torres Alvarado on 12/03/21.
//

import UIKit

extension UIView {

    func dropShadow() {
        
        layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 3, height: 3)
            layer.masksToBounds = false

            layer.shadowOpacity = 0.3
            layer.shadowRadius = 5
            //layer.shadowPath = UIBezierPath(rect: bounds).cgPath
            layer.rasterizationScale = UIScreen.main.scale
            layer.shouldRasterize = true
       
    }
}

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var viewFondo: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewFondo.layer.cornerRadius = 10
        viewFondo.clipsToBounds = true
        viewFondo.dropShadow()
        
    }

    func configureCell(_ model: HeaderCellModel) {
        labelTitle.text = model.name
    }
    
}
