import RealmSwift
import UIKit

class GridViewController: UIViewController {
    
    public var item: MonthString?
    
    public var deletionHandler: (() -> Void)?
    @IBOutlet var itemLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var gridView: UIView!
    @IBOutlet var newButton: UIButton!
    
    private let realm = try! Realm()
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()

    override func viewDidLoad() {
        
        newButton.backgroundColor = .clear
        super.viewDidLoad()
        
        itemLabel.text = item?.item
        dateLabel.text = Self.dateFormatter.string(from: item!.date)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(didTapDelete))
        
        //My tracker
        let width = gridView.frame.width
        let frameColor = CGColor(srgbRed: 143/255, green: 116/255, blue: 145/255, alpha:1)
        let frameWidth = (width / 7)
        //for d in 1...31{
        for j in 0...3 {
            for i in 0...6{
                let redView = UIView()
                //redView.backgroundColor = randomColor()
                redView.frame = CGRect(x: CGFloat(i) * frameWidth, y: CGFloat(j) * frameWidth, width: frameWidth, height: frameWidth)
                redView.layer.borderWidth = 1.5
                redView.layer.borderColor = frameColor
                    //CGColor(srgbRed: 143/255, green: 116/255, blue: 145/255, alpha:1)
                gridView.addSubview(redView)
            }
        }
        gridView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
    }
        
//    @objc func didTapNewButton() {
//        if newButton.backgroundColor == UIColor.clear {
//            newButton.backgroundColor = randomColor()
//        } else {
//             newButton.backgroundColor = randomColor()
//        }
//    }
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        let location = gesture.location(in: gridView)
        print("\(location)")
        
        var loopCount = 0
        for subview in gridView.subviews {
            if subview.frame.contains(location) {
                subview.backgroundColor = randomColor()
                print("loopCount: ", loopCount)
            }
            loopCount += 1
        }
       
//        realm.beginWrite()
//        let count = location
//        realm.add(count)
//        try! realm.commitWrite()
        
    }
    
    @objc private func didTapDelete(){
        guard let itemTask = self.item else{
            return
        }
        realm.beginWrite()
        realm.delete(itemTask)
        try! realm.commitWrite()
        
        deletionHandler?()
        navigationController?.popViewController(animated: true)
    }
    
    func randomColor() -> UIColor {
        //let red = CGFloat(drand48())
        //let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: 45/255, green: 96/255, blue: blue, alpha: 1)
    }
}

//class UICollectionView: UICollectionViewFlowLayout {
//    override func prepare() {
//        super.prepare()
//
//        guard let collectionView = collectionView else {
//            return
//        }
//        collectionView.backgroundColor = .red
//        let availableWidth = collectionView.bounds.inset(by: collectionView.layoutMargins).width
//        let maxNumColumns = Int(availableWidth / 7)
//        let cellWidth = (availableWidth / CGFloat(maxNumColumns)).rounded(.down)
//
//        self.itemSize = CGSize(width: cellWidth, height: cellWidth)
//        self.sectionInset = UIEdgeInsets(top: self.minimumInteritemSpacing, left: 0.0, bottom: 100, right: 0)
//        self.sectionInsetReference = .fromSafeArea
//
//    }
//}
