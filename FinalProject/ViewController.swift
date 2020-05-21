import RealmSwift
import SideMenu
import UIKit

class MonthString: Object {
    
    @objc dynamic var item: String = ""
    @objc dynamic var date: Date = Date()
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //TableView: Month
    @IBOutlet var tableView: UITableView!
    private var month = [MonthString]()
    private let realm = try! Realm()
    
    //public var deletionHandler: (() -? Void)?
    
    //SideMenu
    var sideMenu: SideMenuNavigationController?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        month = realm.objects(MonthString.self).map({ $0 })
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        //SideMenu
        sideMenu = SideMenuNavigationController(rootViewController: MenuListController())
        sideMenu?.leftSide = true
        sideMenu?.setNavigationBarHidden(true, animated: false)
        
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return month.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = month[indexPath.row].item
        //cell.configure(with: month[indexPath.row])
        //cell.delegate = self
        return cell
    }
    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: UI) -> UITableView {
//        return .delete
//    }
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func didTapMonthButton() {
        
        let vc = storyboard?.instantiateViewController(identifier: "calendar") as! CalendarViewController
        vc.title = "My Calendar"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapAddButton(){
        
        guard let vc = storyboard?.instantiateViewController(identifier: "event") as? EventViewController else {
            return
        }
        vc.completionHandler = {
            [weak self] in self?.refresh()
        }
        
        vc.title = "New Item"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        
    }
    func refresh() {
        month = realm.objects(MonthString.self).map({ $0 })
        tableView.reloadData()
        
    }
    
    //SideMenu
    @IBAction func didTapMenu() {
        present(sideMenu!, animated: true)
    }
}

class MenuListController: UITableViewController {
    
    var menuItem = ["May"]
    let darkColor = UIColor(red: 59/255, green: 76/255, blue: 94/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = darkColor
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItem[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = darkColor
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
           
           //add function
       }

}



////TableView: Month
//extension ViewController: UITableViewDelegate{
//
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return month.count
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
////        cell.configure(with: month[indexPath.row])
////        cell.delegate = self
////        return cell
////    }
    
    
//    func didTapButton(with title: MonthString) {
//        print("\(title)")
//
////        let vc = storyboard?.instantiateInitialViewController(identifier: "calendar") as! CalendarViewController
////            vc.modalPresentationStyle = .fullScreen
////            present(vc, animated: true)
////
//    }
////}
