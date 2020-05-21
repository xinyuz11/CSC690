import UIKit
import FSCalendar

class CalendarViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, UIGestureRecognizerDelegate{
    
    @IBOutlet var calendar: FSCalendar!
    @IBOutlet var taskTableView: UITableView!
    @IBOutlet var animationSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calendar.delegate = self
        self.taskTableView.panGestureRecognizer.require(toFail: self.scopeGesture)
        self.calendar.scope = .week
        
        self.calendar.accessibilityIdentifier = "calendar"
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        //print("selected")
        
        //var weekdayColor = UIColor(red: 116/255, green: 104/255, blue: 117/255, alpha: 1)
        
        calendar.firstWeekday = 2
        calendar.appearance.weekdayTextColor = UIColor(red: 116/255, green: 104/255, blue: 117/255, alpha: 1)
        calendar.appearance.selectionColor = UIColor(red: 176/255, green: 90/255, blue: 90/255, alpha: 1)
        calendar.appearance.eventSelectionColor = UIColor(red: 165/255, green: 241/255, blue: 172/255, alpha: 1)
        calendar.appearance.todayColor = UIColor(red: 196/255, green: 77/255, blue: 129/255, alpha: 1)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-YYYY at h:mm a"
        let string = formatter.string(from: date)
        print("\(string)")
    }
    
    fileprivate lazy var scopeGesture: UIPanGestureRecognizer = {
        [unowned self] in
        let panGesture = UIPanGestureRecognizer(target: self.calendar, action: #selector(self.calendar.handleScopeGesture(_:)))
        panGesture.delegate = self
        panGesture.minimumNumberOfTouches = 1
        panGesture.maximumNumberOfTouches = 2
        return panGesture
    }()
    
    //Calendar TableView
    
    func numberofSections(in tableView: UITableView) -> Int {
        return 2
    }

}

//class TaskListViewController: UIViewController{
//
//    var tasks = ["water"]
//
//}
