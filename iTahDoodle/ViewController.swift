//
//  ViewController.swift
//  iTahDoodle
//
//  Created by senna on 5/9/16.
//  Copyright © 2016 Kelly Senna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let todoList = TodoList()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = todoList
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addButtonPressed(sender: UIButton) {
        guard let text = itemTextField.text where !text.isEmpty else {
            return
        }
        todoList.addItem(text)
        itemTextField.text = ""
        tableView.reloadData()
    }

}


extension ViewController : UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = indexPath.row
        todoList.removeItem(item)
        print("Item: \(item)")
        tableView.reloadData()
    }

}