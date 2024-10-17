//
//  CollectionViewCell.swift
//  networkApi
//
//  Created by Emil Maharramov on 10.10.24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var descField: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with model: PostStruct) {
        titleLabel.text = model.title
        descField.text = model.body
    }

}
