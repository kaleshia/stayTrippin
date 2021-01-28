//
//  ToDoListViewController.swift
//  interface
//
//  Created by Kaleshia Lee on 11/15/20.
//

import UIKit

class ToDoListViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var field: UITextField!
//    @IBOutlet var field: UITextView!
    
    var tasks = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Tasks"
        // Get all current saved tasks
        field.delegate = self
        
        tableView.delegate=self
        tableView.dataSource=self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTask()
        return true
    }
    @objc func saveTask(){
        
    }
}
extension ToDoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension ToDoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
}
