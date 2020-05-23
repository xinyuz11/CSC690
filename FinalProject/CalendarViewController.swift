import UIKit
import FSCalendar
import SCLAlertView

class CalendarViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, UIGestureRecognizerDelegate{
        
    @IBOutlet var calendar: FSCalendar!
    //@IBOutlet var taskTableView: UITableView!
    @IBOutlet var animationSwitch: UISwitch!
    
    @IBOutlet weak var calendarHeightConstraint: NSLayoutConstraint!
    
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        return formatter
    }()
    var eventDate = ["2020-05-20"]
    var eventMoreDate = ["2020-05-01","2020-05-11","2020-05-21"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calendar.delegate = self
        self.view.addGestureRecognizer(self.scopeGesture)
        //self.taskTableView.panGestureRecognizer.require(toFail: self.scopeGesture)
        //self.calendar.scope = .week
        
        self.calendar.accessibilityIdentifier = "calendar"
        
        calendar.firstWeekday = 2
        calendar.appearance.weekdayTextColor = UIColor(red: 116/255, green: 104/255, blue: 117/255, alpha: 1)
        calendar.appearance.selectionColor = UIColor(red: 176/255, green: 90/255, blue: 90/255, alpha: 1)
        calendar.appearance.eventSelectionColor = UIColor(red: 165/255, green: 241/255, blue: 172/255, alpha: 1)
        calendar.appearance.todayColor = UIColor(red: 196/255, green: 77/255, blue: 129/255, alpha: 1)
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        //print("selected")
        
        //var weekdayColor = UIColor(red: 116/255, green: 104/255, blue: 117/255, alpha: 1)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-YYYY at h:mm a"
        let string = formatter.string(from: date)
        print("\(string)")
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let dateString = self.dateFormatter.string(from: date)
        if self.eventDate.contains(dateString){
            return 1
        }; if self.eventMoreDate.contains(dateString) {
            return 3
        }
        return 0
    }
    
    fileprivate lazy var scopeGesture: UIPanGestureRecognizer = {
        [unowned self] in
        let panGesture = UIPanGestureRecognizer(target: self.calendar, action: #selector(self.calendar.handleScopeGesture(_:)))
        panGesture.delegate = self
        panGesture.minimumNumberOfTouches = 1
        panGesture.maximumNumberOfTouches = 2
        return panGesture
    }()
    
//    
//    func numberofSections(in tableView: UITableView) -> Int {
//        return 2
//    }
//
}

//class TaskListViewController: UITableViewController, UITableViewDelegate{
//
//    @IBOutlet var taskInCalendar: UITableView!
//    var tasktv = ["water", "exercise"]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.addSubview(taskInCalendar)
//
//        taskInCalendar.delegate = self
//        taskInCalendar.dataSource = self
//
//        //taskInCalendar.backgroundColor = .black
//        //view.bringSubviewToFront(taskInCalendar)
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return tasktv.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "tasktv", for: indexPath) as? TaskListViewController
//        cell.textLabel?.text = tasktv[indexPath.row]
//        //cell.textLabel?.textColor = .white
//        //cell.backgroundColor = darkColor
//        return cell
//    }
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//           taskInCalendar.deselectRow(at: indexPath, animated: true)
//
//           //add function
//       }
//
//}
