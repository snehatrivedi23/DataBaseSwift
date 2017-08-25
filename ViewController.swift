//
//  ViewController.swift
//  SnehaDemo
//
//  Created by ispl Mac Mini on 8/25/17.
//  Copyright © 2017 infinium. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var TableData: UITableView!
    //var arraydata:NSMutableArray = NSMutableArray()
    var database:NSMutableArray = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        //let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //// arraydata = appDelegate.items
       // arraydata = ["Sneha"]
        let select:String = "SELECT * FROM STUDENT"
       database = Database.share().selectAll(fromTable: select)
        print(database)
        TableData.reloadData()
        //print(arraydata)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        let select:String = "SELECT * FROM STUDENT"
        database = Database.share().selectAll(fromTable: select)
        print(database)
        TableData.reloadData()
            }
    @IBAction func BtnAdd(_ sender: UIButton)
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
      
        let nextViewController = storyBoard.instantiateViewController(withIdentifier:"AddViewController") as! AddViewController
        
        nextViewController.status = -1
        self.present(nextViewController, animated:true, completion:nil)

        
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return database.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AddTableViewCell
        //cell.LblName.text = arraydata.object(at: indexPath.row) as? String
        cell.LblName.text = (database.object(at: indexPath.row) as AnyObject).value(forKey: "Name") as? String
        cell.LblPlace.text = (database.object(at: indexPath.row) as AnyObject).value(forKey: "Semester") as? String
        return cell
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        //check = true
        let nextViewController = storyBoard.instantiateViewController(withIdentifier:"AddViewController") as! AddViewController
       
        nextViewController.name = ((database.object(at: indexPath.row) as AnyObject).value(forKey: "Name") as? String)!
        
        nextViewController.place = ((database.object(at: indexPath.row) as AnyObject).value(forKey: "Semester") as? String)!
    
        nextViewController.status = indexPath.row
        
        self.present(nextViewController, animated:true, completion:nil)
        
    }
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        
//        let editAction = UITableViewRowAction(style: .normal, title: "Edit")
//        {
//            (rowAction, indexPath) in
//            //TODO: edit the row at indexPath here
//        }
//        editAction.backgroundColor = .blue
//        
//        let deleteAction = UITableViewRowAction(style: .normal, title: "Delete") { (rowAction, indexPath) in
//            //TODO: Delete the row at indexPath here
//        }
//        deleteAction.backgroundColor = .red
//        
//        return [editAction,deleteAction]
//    }
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
     {
        return true
    }
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            database.removeObject(at: indexPath.row)
            self.TableData.reloadData()
        }
    }
    

}

