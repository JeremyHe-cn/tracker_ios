//
//  Manhuagui.swift
//  Tracker
//
//  Created by Jeremy He on 2017/12/26.
//  Copyright © 2017年 Jeremy He. All rights reserved.
//

import Foundation
import Alamofire

class Manhuagui {
    
    func crawl(url: String) {
        Alamofire.request(url).responseString { resp in
            if let html = resp.value {
                let range = html.range(of: "<h1>(.*?)</h1>", options: String.CompareOptions.regularExpression, range: nil, locale: nil)
                print(html.substring(with: range!))
            }
        }
    }
}
