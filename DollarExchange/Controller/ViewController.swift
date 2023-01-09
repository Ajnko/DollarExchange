//
//  ViewController.swift
//  DollarExchange
//
//  Created by Abdulbosid Jalilov on 07/01/23.
//

import UIKit
import SnapKit
import Reachability

class ViewController: UIViewController {

    //MARK: - TableView
    let tableView: UITableView = {
       let table = UITableView()
        table.rowHeight = 210
        table.register(InfoTableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    var currencyList = [DollarCurrency]()
    
    let reachability = try! Reachability()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        fetchingData()
    }
    
    //MARK: - Data Fetching
    
    func fetchingData(){
        
        //url
        let url = URL(string: "https://nbu.uz/en/exchange-rates/json/")
        
        //dataTask
        let dataTask = URLSession.shared.dataTask(with: url!) {(data,  response, error) in
            guard let data = data, error == nil else {
                print("Error is \(error)")
                return
            }
            
            var clist = [DollarCurrency]()
          
            do {
                clist = try JSONDecoder().decode([DollarCurrency].self, from: data)
                print(data)
            }
            catch {
                fatalError("Tuya")
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            self.currencyList = clist
        }
        dataTask.resume()
    }
    
    //MARK: - UIFrames
    func initView(){

        //MARK: - Table View
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    //Checking Connection
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.reachability.whenReachable = { reachability in
//                self.showAlert(tittle: "Ooops", message: "Something went wrong")

                if reachability.connection == .wifi {
                    print("Reachable via WiFi")
                } else {
                    print("Reachable via Cellular")
                }
                
            }
            self.reachability.whenUnreachable = { _ in
                self.showAlert(tittle: "Ooops", message: "Something went wrong")
                print("Not reachable")
            }

            do {
                try self.reachability.startNotifier()
            } catch {
                print("Unable to start notifier")
            }
        }
    }
    
    deinit {
        reachability.stopNotifier()
    }
    
    //MARK: - Alert
    
    func showAlert(tittle: String , message: String) {

        let alert = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) { make in
            
        }
        let noAction = UIAlertAction(title: "No", style: UIAlertAction.Style.cancel, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)


        DispatchQueue.main.async {
            self.present(alert, animated: true,completion: nil)
        }

    }

}
    //MARK: - TableView Extension
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InfoTableViewCell
        cell.titleLabel.text = "\(self.currencyList[indexPath.row].title)"
        cell.datelabe.text = "\(self.currencyList[indexPath.row].date)"
        cell.codeLabel.text = "Code: \(self.currencyList[indexPath.row].code)"
        cell.priceLabel.text = "Price: \(self.currencyList[indexPath.row].cb_price)"
        cell.cellPriceLabel.text = "Sell: \(self.currencyList[indexPath.row].nbu_cell_price)"
        cell.buyPriceLabel.text = "Buy: \(self.currencyList[indexPath.row].nbu_buy_price)"
        
        return cell
    }
}
