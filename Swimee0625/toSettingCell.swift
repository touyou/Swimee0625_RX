//
//  toSettingCell.swift
//  Swimee0625
//
//  Created by 荒川陸 on 2016/06/24.
//  Copyright © 2016年 Riku Arakawa. All rights reserved.
//

import UIKit

//protocol toSettingCellDelegate {
//    func settingView()
//}

final class toSettingCell: UITableViewCell {
    
    @IBOutlet var settingButton: UIButton!
    
//    var delegate: toSettingCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    @IBAction func pushSetting() {
//        delegate.settingView()
//    }
}
