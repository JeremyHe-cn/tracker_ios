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
    
    func crawl(url: String, handler: @escaping (Comic)->Void) {
        Alamofire.request(url).responseString { resp in
            if let html = resp.value {
                var range = html.range(of: "<h1>(.*?)</h1>", options: .regularExpression)
                let name = html[range!]
                        .replacingOccurrences(of: "<.*?>", with: "", options: .regularExpression)

                range = html.range(of: "更新至：(.*?)</span>", options: .regularExpression)
                let chapter = html[range!]
                        .replacingOccurrences(of: "更新至：", with: "")
                        .replacingOccurrences(of: "</span>", with: "")

                range = html.range(of: "<span class=\"red\">(\\d{4}-\\d+-\\d+)</span>", options: .regularExpression)
                let date = html[range!]
                        .replacingOccurrences(of: "<.*?>", with: "", options: .regularExpression)

                range = html.range(of: "<p class=\"hcover\"><img src=\"(.*?)\" alt", options: .regularExpression)
                let cover = html[range!]
                        .replacingOccurrences(of: "<.*?>", with: "", options: .regularExpression)
                        .replacingOccurrences(of: "<img src=\"", with: "")
                        .replacingOccurrences(of: "\" alt", with: "")

                let comic = Comic(cover: cover, name: name, date: date, chapter: chapter)
                handler(comic)
            }
        }
    }
}
