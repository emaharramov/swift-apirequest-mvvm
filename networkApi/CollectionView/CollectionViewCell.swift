//
//  CollectionViewCell.swift
//  networkApi
//
//  Created by Emil Maharramov on 10.10.24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var descField: UITextView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with model: PostStruct) {
          titleLabel.text = model.title
            descField.text = model.body
      }

}
