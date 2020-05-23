import UIKit

class SleepViewController: UIViewController {
    
    @IBOutlet var sleepGView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = sleepGView.frame.width
        let frameColor = CGColor(srgbRed: 143/255, green: 116/255, blue: 145/255, alpha:1)
        let frameWidth = (width / 13)
        for j in 0...30 {
            for i in 0...12{
                let redView = UIView()
                //redView.backgroundColor = randomColor()
                redView.frame = CGRect(x: CGFloat(i) * frameWidth, y: CGFloat(j) * frameWidth, width: frameWidth, height: frameWidth)
                redView.layer.borderWidth = 1.5
                redView.layer.borderColor = frameColor
                    //CGColor(srgbRed: 143/255, green: 116/255, blue: 145/255, alpha:1)
                sleepGView.addSubview(redView)
            }
        }
        sleepGView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
    }
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
           let location = gesture.location(in: sleepGView)
           print("\(location)")
           
           var loopCount = 0
           for subview in sleepGView.subviews {
               if subview.frame.contains(location) {
                   subview.backgroundColor = randomColor()
                   print("loopCount: ", loopCount)
               }
               loopCount += 1
           }
    }
    func randomColor() -> UIColor {
        //let red = CGFloat(drand48())
        //let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: 45/255, green: 96/255, blue: blue, alpha: 1)
    }

}
