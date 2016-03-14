//
//  HOC_ResponseViewController.swift
//  HouseOfCode
//
//  Created by Anders Butzbach Christensen on 11/03/16.
//  Copyright © 2016 Anders B. Christensen. All rights reserved.
//

import UIKit
import CoreData

class HOC_ResponseViewController: UIViewController{

    @IBOutlet var memberSince_label: UILabel!
    @IBOutlet var email_label: UILabel!
    @IBOutlet var name_label: UILabel!
    @IBOutlet var logoutButton: UIButton!
    
    @IBAction func logoutButtonAction(sender: AnyObject)
    {
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
        
        let context: NSManagedObjectContext = appDel.managedObjectContext;
        
        let userRequest = NSFetchRequest(entityName: "User");
        let responseRequest = NSFetchRequest(entityName: "Response");
        
        userRequest.returnsObjectsAsFaults = false;
        responseRequest.returnsObjectsAsFaults = false;
        
        do
        {
            let results = try context.executeFetchRequest(userRequest)
            for managedObject in results
            {
                let managedObjectData:NSManagedObject = managedObject as! NSManagedObject
                context.deleteObject(managedObjectData)
            }
            try context.save();
        }
        catch
        {
            print("Something went wrong deleting the user!");
        }
        
        do
        {
            let results = try context.executeFetchRequest(responseRequest)
            for managedObject in results
            {
                let managedObjectData:NSManagedObject = managedObject as! NSManagedObject
                context.deleteObject(managedObjectData)
            }
            try context.save();
        }
        catch
        {
            print("Something went wrong deleting the access_token!");
        }
        
        //Redirects to the app:
        dispatch_async(dispatch_get_main_queue())
            {
                let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
                let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("LoginView") as UIViewController
                self.presentViewController(vc, animated: true, completion: nil)
        }
        
        print("");
        print("STANDARD-LOG OUT");
        print("Log out was a succes!");
        print("");

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
        let context: NSManagedObjectContext = appDel.managedObjectContext;
        
        let requestUser = NSFetchRequest(entityName: "Response");
        requestUser.returnsObjectsAsFaults = false;
        
        var user_name = "";
        var user_email = "";
        var user_memberSince = "";
        
        do
        {
            let results = try context.executeFetchRequest(requestUser);
            
            for result in results as! [NSManagedObject]
            {
                user_name = result.valueForKey("name") as! String
                user_email = result.valueForKey("email") as! String
                user_memberSince = result.valueForKey("memberSince") as! String
            }
        }
        catch
        {
            print("");
            print("There were no users in core data, please sign in!");
            print("");
        }
        name_label.text = user_name;
        email_label.text = user_email;
        memberSince_label.text = user_memberSince;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
