//
//  Manhuagui.swift
//  Tracker
//
//  Created by Jeremy He on 2017/12/26.
//  Copyright © 2017年 Jeremy He. All rights reserved.
//

import Foundation
import Alamofire
import Regex

class Manhuagui {
    
    func crawl(url: String, handler: @escaping (Comic?)->Void) {
        Alamofire.request(url).responseString { resp in
            if let html = resp.value {
                do {
                    let regex = try Regex(
                            pattern: "<p class=\"hcover\"><img src=\"(.*?)\" alt.*?class=\"book-title\"><h1>(.*?)</h1>.*?最近于.*?(\\d{4}-\\d+-\\d+).*?更新至 .*?<a.*?href=\"(.*?)\".*?>(.*?)</a>",
                            groupNames: ["cover", "title", "date", "url", "chapter"])

                    if let match = regex.findFirst(in: html) {
                        let cover = match.group(named: "cover") ?? ""
                        let name = match.group(named: "title") ?? ""
                        let date = match.group(named: "date") ?? ""
                        let url = (resp.request?.url?.host ?? "") + (match.group(named: "url") ?? "")
                        let chapter = match.group(named: "chapter") ?? ""
                        let comic = Comic(cover: cover, name: name, date: date, chapter: chapter)

//                        var chapters = [("", "")]
//                        let regex = try Regex(pattern: "(<a href=\"(.*?)\" title=\"(.*?)\" class=\"status0\" target=\"_blank\">)")
//                        let matches = regex.findAll(in: html)
//                        for match in matches {
//                            chapters.append((match.group(at: 3) ?? "<标题>", match.group(at: 2) ?? "<地址>"))
//                            print("\(chapters[chapters.count - 1])")
//
//                            if chapters.count >= 10  {
//                                break
//                            }
//                        }
                        handler(comic)
                    } else {
                        handler(nil)
                    }
                } catch {
                    handler(nil)
                }

//                (.*?<a href=\"(.*?)\" title=\"(.*?)\" class="status0" target="_blank">
            } else {
                handler(nil)
            }
        }
    }
}
