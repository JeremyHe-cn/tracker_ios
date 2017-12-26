//
//  ComicCell.swift
//  Tracker
//
//  Created by Jeremy He on 2017/12/25.
//  Copyright © 2017年 Jeremy He. All rights reserved.
//

import UIKit

class ComicCell: UITableViewCell {

    @IBOutlet weak var cover: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var chapter: UILabel!
    
    var comic : Comic? {
        didSet {
            cover.image = UIImage(named: "DefaultCover")
            name.text = comic?.name
            date.text = "2017-12-15"
            chapter.text = "更新至\(comic?.lastestChapter)话"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
