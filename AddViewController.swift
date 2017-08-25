//
//  AddViewController.swift
//  SnehaDemo
//
//  Created by ispl Mac Mini on 8/25/17.
//  Copyright © 2017 infinium. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    var name:String!
    var place:String!
    var status = Int()
    var avariable:NSMutableArray = NSMutableArray()
      @IBOutlet var TxtName: UITextField!
    @IBOutlet var TxtPlace: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
      //  let appDelegate = UIApplication.shared.delegate as! AppDelegate
          //avariable = appDelegate.items
        
        TxtName.text = name
        TxtPlace.text = place
       // let delegate = UIApplication.sharedApplication.delegate as AppDelegate
        //let deviceToken = delegate.deviceToken


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func BtnAdd(_ sender: UIButton)
    {
        if status == -1
        {
//            let dict:NSMutableDictionary = NSMutableDictionary()
//            dict.setValue(TxtName.text, forKey: "name")
//            dict.setValue(TxtPlace.text, forKey: "place")
//            avariable.add(dict)
//            print(avariable)
            //INSERT INTO Employee(Name,Email,Contact) VALUES(\'%@\',\'%@\',%d)",_TxtName.text,_TxtMail.text,[_TxtContact.text integerValue] ]
        let queryinsert: String = "INSERT INTO STUDENT(Name,Semester) VALUES(\'\(TxtName.text!)\',\'\(TxtPlace.text!)\')"
            print(queryinsert)
            Database.share().insert(queryinsert)
            

            self.dismiss(animated: true, completion: nil)
        }
        else
        {
            
        let dict:NSMutableDictionary = NSMutableDictionary()
        dict.setValue(TxtName.text, forKey: "name")
        dict.setValue(TxtPlace.text, forKey: "place")
        //avariable.add(dict)
            avariable.replaceObject(at: status, with: dict)
        print(avariable)
            
            //itemsArray.objectAtIndex(0).valueForKey("Item").replaceObjectAtIndex(0, withObject: "ReplaceValue")
        self.dismiss(animated: true, completion: nil)
        }
        
 
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
