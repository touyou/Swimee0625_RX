//
//  nameCell.swift
//  Swimee0625
//
//  Created by 荒川陸 on 2016/06/24.
//  Copyright © 2016年 Riku Arakawa. All rights reserved.
//

import UIKit

final class nameSettingCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet private weak var textField: UITextField!
    
    var delegate: HomeViewControllerDelegate!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.text = ""
        textField.delegate = self
    }
    
    func set(user: User) {
        textField.text = user.name
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        textField.text.flatMap(delegate.changeName)
        
        return false
    }
}
