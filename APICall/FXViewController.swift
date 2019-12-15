//
//  FXViewController.swift
//  APICall
//
//  Created by Alvin Tuo on 7/9/19.
//  Copyright © 2019 SWIFT. All rights reserved.
//

import UIKit

class FXViewController: UITableViewController {
    
    var fx = [[String: String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Foreign Exchange Rates From USD"
        let query = "https://api.exchangeratesapi.io/latest?base=USD&symbols=EUR,GBP,JPY,CNY,HKD,CHF,RUB,MXN,AUD,NZD,CAD,USD"
        DispatchQueue.global(qos: .userInitiated).async {
            [unowned self] in
            if let url = URL(string: query) {       // line 21-26 check for JSON/String errors
                if let data = try? Data(contentsOf: url) {
                    let json = try! JSON(data: data)
                    self.parse(json: json)
                    return
                }
            }
            self.loadError()
        }
    }
    
    func parse(json: JSON) {
        let date = json["date"].stringValue
        for (key, value) in json["rates"] {
            let currency = key
            let rate = value.stringValue
            fx.append(["date": date, "currency": currency, "rate": rate])
        }
        DispatchQueue.main.async {
            [unowned self] in
            self.tableView.reloadData()
        }
    }

    func loadError () {
        DispatchQueue.main.async {
            [unowned self] in
            let alert = UIAlertController(title: "Loading Error", message: "There was a problem loading today's rates.", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fx.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let fxt = fx[indexPath.row]
        cell.textLabel?.text = "USD / " + fxt["currency"]!
        return cell
    }

//    @IBAction func onTappedDoneButton(_ sender: Any) {
//        exit(0)
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! DetailViewController
        let index = tableView.indexPathForSelectedRow?.row
        dvc.fx = fx[index!]
    }
}


