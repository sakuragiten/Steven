//
//  GSTodoTableViewCell.swift
//  StevenNash
//
//  Created by gongsheng on 2020/11/19.
//  Copyright © 2020 gongsheng. All rights reserved.
//

import UIKit


protocol TableViewInputCellDelegate: class {
    func inputChanged(cell: GSTodoTableViewCell, text: String)
}

class GSTodoTableViewCell: UITableViewCell {

    weak var delegate: TableViewInputCellDelegate?
    @IBOutlet weak var textField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func editingChanged(_ sender: UITextField) {
        delegate?.inputChanged(cell: self, text: sender.text ?? "")
    }
    
}
