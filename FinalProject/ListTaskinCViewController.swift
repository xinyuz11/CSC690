//
//import UIKit
//
//class ListTaskinCViewController: UITableViewController {
//
//
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
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return tasktv.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "tasktv", for: indexPath)
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
//
//
//}
