//
//  MainViewController.swift
//  Tracker
//
//  Created by Jeremy He on 2017/12/24.
//  Copyright © 2017年 Jeremy He. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    let urls = [
        "http://www.manhuagui.com/comic/883/",
        "http://www.manhuagui.com/comic/8356/",
        "http://www.manhuagui.com/comic/25956/",
        "http://www.manhuagui.com/comic/17965/",
        "http://www.manhuagui.com/comic/7708/",
        "http://www.manhuagui.com/comic/18883/",
        "http://www.manhuagui.com/comic/21963/",
        "http://www.manhuagui.com/comic/15761/",
        "http://www.manhuagui.com/comic/16460/",
        "http://www.manhuagui.com/comic/7620/",
        "http://www.manhuagui.com/comic/7580/",
        "http://www.manhuagui.com/comic/20568/"
    ]
    
    var datas = [Comic]() {
        didSet {
            datas.sort { left, right in left.date > right.date }
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let manhuagui = Manhuagui()
        for url in urls {
            manhuagui.crawl(url: url, handler: { (comic) in
                self.datas.append(comic)
            })
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "comic", for: indexPath)

        if let cell = cell as? ComicCell {
            cell.comic = datas[indexPath.row]
        }

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
