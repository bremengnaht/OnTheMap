//
//  ListViewController.swift
//  OnTheMap
//
//  Created by Nguyen Quyet Thang on 20/7/24.
//

import UIKit

class ListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return getSharedDatasource().count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCellTableIndentifier", for: indexPath) as! CustomTableViewCell
//        
//        let data = getSharedDatasource()[indexPath.row]
//        cell.customImageView.image = data.memedImage
//        cell.customDisplayName.text = "\(data.topText ?? "") \(data.bottomText ?? "")"
//        
//        return cell
//    }
}
