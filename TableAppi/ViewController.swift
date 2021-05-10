//
//  ViewController.swift
//  TableAppi
//
//  Created by Шамиль Каммаев on 06.05.2021.
//

import UIKit
import SnapKit


class ViewController: UIViewController {
    
    let myfruit : [String] = ["яблоко","груша","банан","апельсин","малина","ананас"]
    
    var tableView = UITableView()
    
    // var breakingBad: [WelcomeElement] = []
    var forbes: [Datum] = []
    
    struct Cells {
        static let videoCell = "Cell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurTableView()
        downloadJson()
    }
    
    func configurTableView() {
        
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(TableCell.self, forCellReuseIdentifier:Cells.videoCell )
        tableView.snp.makeConstraints { maker in
            maker.bottom.top.left.right.equalTo(view).inset(0)
        }
        
    }

    
    func downloadJson() {
        

        guard let url = URL(string: "http://app.cre.ru/api8/PlayersPersonList" ) else { return }
        URLSession.shared.dataTask(with: url) { [unowned self] (data, _, _) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                
                let welcome1 = try decoder.decode(WelcomeElement.self, from: data)
                print(welcome1)
                forbes = welcome1.data
                DispatchQueue.main.async {
                    print(forbes)
                    tableView.reloadData()
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}
//
extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return forbes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        let cell = self.tableView.dequeueReusableCell(withIdentifier:Cells.videoCell , for: indexPath) as! TableCell
        
        cell.labelName.text = forbes[indexPath.row].company
        cell.titleLable.text = forbes[indexPath.row].fio
        
        
        
        

        return cell
    }
    
    
    
    }


