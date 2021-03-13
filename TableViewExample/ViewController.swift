//
//  ViewController.swift
//  TableViewExample
//
//  Created by Israel Torres Alvarado on 12/03/21.
//

import UIKit

struct HeaderCellModel {
    
    let name: String
    let image1: String
    let image2: String
    let imahe3: String
    
}

struct TitleCellModel {
    let name: String
    let image: String
}

enum CellType {
    case headerCell(_ model: HeaderCellModel)
    case titleCell(_ model: TitleCellModel)
    case emptyCell
    case doubleEmptyCell
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.backgroundColor = .clear
            tableView.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "headerCell")
            //tableView.register(HeaderTableViewCell.self, forCellReuseIdentifier: "headerCell")
            tableView.register(UINib(nibName: "TitleTableViewCell", bundle: nil), forCellReuseIdentifier: "titleCell")
            //tableView.register(TitleTableViewCell.self, forCellReuseIdentifier: "titleCell")
        }
    }
    
    var options: [CellType] = [] {
        didSet {
            tableView.reloadData()
        }
        
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let emptCell = CellType.emptyCell
        let doubleCell = CellType.doubleEmptyCell
        
        let headerCell = CellType.headerCell(HeaderCellModel(name: "Titulo header", image1: "urlImage1", image2: "urlImage2", imahe3: "urlImage3"))
        let titleCell1 = CellType.titleCell(TitleCellModel(name: "Atletico de Madrid", image: "Atletico de Madrid"))
        let titleCell2 = CellType.titleCell(TitleCellModel(name: " Barcelona", image: "Barcelona"))
        let titleCell3 = CellType.titleCell(TitleCellModel(name: " Albacete", image: "Albacete"))
        
        options = [headerCell, doubleCell, titleCell1, emptCell, titleCell2, emptCell, titleCell3, doubleCell, titleCell1, emptCell, titleCell2, emptCell, titleCell3]
        
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch options[indexPath.row] {
        case .emptyCell:
            let cell = UITableViewCell()
            cell.backgroundColor = .clear
            return cell
        case .headerCell(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as? HeaderTableViewCell
            cell?.configureCell(model)
            cell?.backgroundColor = .clear
            return cell!
        case .titleCell(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as? TitleTableViewCell
            cell?.backgroundColor = .clear
            cell?.configure(model)
            return cell!
        case .doubleEmptyCell:
            let cell = UITableViewCell()
            cell.backgroundColor = .clear
            return cell
        }
        
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch options[indexPath.row] {
        case .emptyCell:
            return 5
        case .headerCell:
            return 200
        case .titleCell:
            return 50
        case .doubleEmptyCell:
            return 20
        }
    }
    
}

