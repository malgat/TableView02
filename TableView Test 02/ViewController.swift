import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    var animals = ["cat","Bird","Whale","Pig","Horse"]
    var korean = ["고양이","새","고래","돼지","말"]
    override func viewDidLoad() {
        myTableView.dataSource = self
        myTableView.delegate = self
    //NavigationBar에 title 추가 => self.title = "동물농장"
    }
    
    //UITableView DataSource Method
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return animals.count
    }
    //Cell 생성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        let row = indexPath.row
        
        cell.textLabel?.text = animals[row]
        cell.detailTextLabel?.text = korean[row]
        cell.imageView?.image = UIImage(named: animals[row])
        return cell
    }
    //섹션 두개 만들기
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    //헤더 만들기
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section Header \(section)"
    }
    //UITableViewDelegate Method 호출
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 100.0
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select = \(indexPath) row = \(indexPath.row)")
    }
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Section Footer \(section)"
    }
}
