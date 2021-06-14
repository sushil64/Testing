//
//  ViewController.swift
//  SignUpForm21
//
//  Created by Sushil Pratap on 14/6/21.
//

import UIKit
import CoreData

var moc:NSManagedObjectContext!
var ad:AppDelegate!
var userEntityRef:NSEntityDescription!

class ViewController: UIViewController {
    
    
    @IBOutlet weak var signUpForm: UILabel!
    
    @IBOutlet weak var fNTxtFld: UITextField!
    @IBOutlet weak var lNTxtFld: UITextField!
    @IBOutlet weak var ageTxtFld: UITextField!
    @IBOutlet weak var phneTxtFld: UITextField!
    @IBOutlet weak var eMailTxtFld: UITextField!    
    
    @IBAction func saveOnBtnTapd(_ sender: Any) {
        
        let userMO = NSManagedObject.init(entity: userEntityRef, insertInto: moc)
        
        userMO.setValue(fNTxtFld.text, forKey: "firstName")
        userMO.setValue(lNTxtFld.text, forKey: "lastName")
        userMO.setValue(ageTxtFld.text, forKey: "age")
        userMO.setValue(phneTxtFld.text, forKey: "mobNo")
        userMO.setValue(eMailTxtFld.text, forKey: "eMail")
        
        do{
            try moc.save()
            print("Data Saved Succesfully")
            fNTxtFld.text = ""
            lNTxtFld.text = ""
            ageTxtFld.text = ""
            eMailTxtFld.text = ""
            phneTxtFld.text =  ""
            
        }
        catch{
            print("Unable TO Store Data")
        }
        
        
    }
    
    
    @IBAction func fetchOnBtnTad(_ sender: Any) {
        
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        do{
            let storeData:[NSManagedObject] = try moc.fetch(fetchReq) as! [NSManagedObject]
            
            print("Data Fetched")
            print(storeData.count)
            print(storeData)
            
            for i in 0..<storeData.count
            {
                let currentMO:NSManagedObject = storeData[i] as! NSManagedObject
                // Key Value Coding
                print(currentMO.value(forKey: "firstName")!)
                print(currentMO.value(forKey: "lastName")!)
                print(currentMO.value(forKey: "age")!)
                print(currentMO.value(forKey: "eMail")!)
                print(currentMO.value(forKey: "mobNo")!)
            }
            
        }
        catch{
            print("Unable To Fetch User")

        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ad = UIApplication.shared.delegate as! AppDelegate
        moc = ad.persistentContainer.viewContext
        
        userEntityRef = NSEntityDescription.entity(forEntityName: "User", in: moc)
        
        
        // Do any additional setup after loading the view.
    }


}

