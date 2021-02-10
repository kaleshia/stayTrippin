//
//  ToDoListViewController.swift
//  interface
//
//  Created by Kaleshia Lee on 11/15/20.
//

import UIKit

class ToDoListViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, UIScrollViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var inputOutlet: UITextField!
    
    var vacationList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    //table view code
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
//    init(insertionIndexPath: IndexPath,
//    reuseIdentifier: String,
//    rowHeight: CGFloat)
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vacationList.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")!
        cell.textLabel?.text = vacationList[indexPath.row]
       
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //print("You tapped cell number \(indexPath.row).")
        vacationList.remove(at: indexPath.row)
        myTableView.reloadData()
    }
    //button code
    func displayAlert(msgTitle:String, msgContent:String){
        let alertController = UIAlertController(title: msgTitle, message: msgContent,
                                                preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func addToList(_ sender: Any) {
        view.endEditing(true)
        
        let firstTab = self.tabBarController?.viewControllers?[0] as! ToDoListViewController
        firstTab.vacationList.append(inputOutlet.text!)
        firstTab.myTableView.reloadData()
        
        inputOutlet.text = "" //clear the text
    }
    
}

