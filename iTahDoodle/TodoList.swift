//
//  TodoList.swift
//  iTahDoodle
//
//  Created by senna on 5/9/16.
//  Copyright © 2016 Kelly Senna. All rights reserved.
//

import UIKit

class TodoList: NSObject {
    private var items: [String] = []
    
    func addItem(item: String) {
        items.append(item)
    }
}

extension TodoList : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        let item = items[indexPath.row]
        
        cell.textLabel!.text = item
        
        return cell
    }
}