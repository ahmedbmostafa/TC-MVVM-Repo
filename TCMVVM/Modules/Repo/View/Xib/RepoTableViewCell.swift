//
//  RepoTableViewCell.swift
//  TCMVVM
//
//  Created by Ahmed on 15/06/2023.
//

import UIKit

class RepoTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    var vm: RepoCellViewModel? {
        didSet {
            nameLbl.text = vm?.name
            descriptionLbl.text = vm?.description
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
