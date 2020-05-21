import SideMenu
import FSCalendar
import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, FSCalendarDelegate {
    
    //SideMenu
    var menu: SideMenuNavigationController?
    
    //TableView: Month
    @IBOutlet var tableView: UITableView!
    var month = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       //Menu
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
        //Table
        tableView.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    //SideMenu
    @IBAction func didTapMenu() {
        present(menu!,animated: true)
    }
    
    //TableView: Month
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return month.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
//        cell.configure(with: month[indexPath.row])
//        cell.delegate = self
//        return cell
//    }
    
}

//TableView: Month
extension ViewController: UITableViewDelegate{
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return month.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
//        cell.configure(with: month[indexPath.row])
//        cell.delegate = self
//        return cell
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
//
//    func didTapButton(with title: String) {
//        print("\(title)")
//
//        let vc = storyboard?.instantiateInitialViewController(identifier: "calendar") as! CalendarViewController
//            vc.modalPresentationStyle = .fullScreen
//            present(vc, animated: true)
//
//    }
}
extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return month.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        
        cell.textLabel?.text = month[indexPath.row]
        
        //cell.configure(with: month[indexPath.row])
        //cell.delegate = self
        return cell
    }
    
    
}

//SideMenu
class MenuListController: UITableViewController {
    
    var items = ["a", "b"]
    let darkColor = UIColor(red: 59/255, green: 76/255, blue: 94/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = darkColor
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = darkColor
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
           
           //add function
       }
}

