//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by julia rodriguez on 6/19/19.
//  Copyright © 2019 julia rodriguez. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    var delegate: ButtonTableViewCellDelegate?
    
    @IBOutlet weak var primaryLabel: UILabel!
    
    @IBOutlet weak var completeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        
        delegate?.buttonCellButtonTapped(self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateButton(_ isComplete: Bool) {
        switch isComplete {
        case true:
            completeButton.setImage(UIImage(named: "complete"), for: .normal)
        case false:
            completeButton.setImage(UIImage(named: "incomplete"), for: .normal)
            
        }
    }
    
}

extension ButtonTableViewCell {
    
    func update(withTask task: Task) {
        primaryLabel.text = task.name
        updateButton(task.isComplete)
        
    }
}

protocol ButtonTableViewCellDelegate: class {
    
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
    
}

