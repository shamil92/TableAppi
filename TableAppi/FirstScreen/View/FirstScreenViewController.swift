

import UIKit
import SnapKit
import Nuke


protocol FirstViewProtocol:class  {
    func failure(error: Error)
    func updateView(viewModel: FirstScreenViewModel)
}

final class FirstScreenViewController: UIViewController  {
    
    
    // MARK: - Properties
    
    var presenter:FirstViewPresenterProtocol?
    private var viewModel: FirstScreenViewModel?
    private let  tableView = UITableView()
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        presenter?.getDatums()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    // MARK: - Drawing
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(cellTypes: [UserCell.self])
        tableView.snp.makeConstraints { maker in
            maker.bottom.top.left.right.equalTo(view).inset(0)
        }
    }
}


    // MARK: - UITableViewDelegate,UITableViewDataSource


extension FirstScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel?.rows.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let row = viewModel?.rows[indexPath.row] else {
            assertionFailure("Failed to init cell in \(className)")
            return UITableViewCell()
        }
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier:row.reuseId , for: indexPath)
        row.configurator.configure(cell: cell)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let comment = presenter?.datums?.data[indexPath.row]
        presenter?.tapOnTheComment(datum: comment)
        
    }
}


    // MARK: - FirstViewProtocol
extension FirstScreenViewController: FirstViewProtocol {
    func updateView(viewModel: FirstScreenViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
}








