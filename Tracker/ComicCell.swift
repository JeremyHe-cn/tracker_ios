//
//  ComicCell.swift
//  Tracker
//
//  Created by Jeremy He on 2017/12/25.
//  Copyright © 2017年 Jeremy He. All rights reserved.
//

import UIKit
import Alamofire

class ComicCell: UITableViewCell {

    @IBOutlet weak var cover: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var chapter: UILabel!
    
    var comic : Comic? {
        didSet {
            name.text = comic?.name
            date.text = "更新时间： \(comic!.date)"
            chapter.text = "最新章节：\(comic!.chapter)"

            if let url = comic?.cover {
                Alamofire.request(url).responseData { response in
                    if self.comic!.cover != url {
                        return
                    }

                    if let data = response.result.value {
                        self.cover.image = UIImage(data: data)
                    } else {
                        print("load \(self.comic!.cover) fail")
                        print("error code: \(response.error!)")
                    }
                }
            }
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
