import UIKit

enum MenuType: Int {
    case theme1
    case sleep
    case addMore
}

class SideMenuViewController: UITableViewController {
    
    var didTapMenuType: ((MenuType) -> Void)?
    //@IBOutlet var sleepButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func didTapSleepButton() {
        
        print("jiji")
        
        let vc = storyboard?.instantiateViewController(identifier: "sleepview") as! SleepViewController
        vc.title = "Sleep Time"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else {
            return
        }
        dismiss(animated: true){ [weak self] in
            print("Dismissing: \(menuType)")
            self?.didTapMenuType?(menuType)
        }
    }
    
}

