import RealmSwift
import UIKit

class EventViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet var field: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    private let realm = try! Realm()
    public var completionHandler: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        field.delegate = self
        field.becomeFirstResponder()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSaveButton))
        
        datePicker.setDate(Date(), animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
    
        //saveEvent()
        field.resignFirstResponder()
        return true
    }
    
    @objc func didTapSaveButton(){
           
        if let text = field.text, !text.isEmpty{
            let date = datePicker.date
            
            realm.beginWrite()
            let newTask = MonthString()
            newTask.date = date
            newTask.item = text
            realm.add(newTask)
            try! realm.commitWrite()
            
            completionHandler?()
            navigationController?.popViewController(animated: true)
            
        } else {
            print("add something")
        }
           
       }

}
