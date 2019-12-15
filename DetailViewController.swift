//
//  DetailViewController.swift
//  APICall
//
//  Created by Alvin Tuo on 7/10/19.
//  Copyright © 2019 SWIFT. All rights reserved.
//
// "https://api.exchangeratesapi.io/latest?base=USD&symbols=EUR,GBP,JPY,CNY,HKD,CHF,RUB,MXN,AUD,NZD,CAD,USD"

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var currencyTypeLabel: UILabel!
    @IBOutlet weak var dateOfRefresh: UILabel!
    @IBOutlet weak var exchangeRate: UILabel!
    @IBOutlet weak var currencyTypeLabel2: UILabel!
    @IBOutlet weak var currencySymbol: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    
    var fx = [String: String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyTypeLabel.text = fx["currency"]
        dateOfRefresh.text = fx["date"]
        exchangeRate.text = fx["rate"]
        currencyTypeLabel2.text = fx["currency"]
        if currencyTypeLabel.text == String("GBP") {
            flagImage.image = UIImage(named: "GBP")
            currencySymbol.text = "British Pound / £"
        }
        if currencyTypeLabel.text == String("EUR") {
            flagImage.image = UIImage(named: "EUR")
            currencySymbol.text = "Euro / €"
        }
        if currencyTypeLabel.text == String("JPY") {
            flagImage.image = UIImage(named: "JPY")
            currencySymbol.text = "Japanese Yen / ¥ (円)"
        }
        if currencyTypeLabel.text == String("CNY") {
            flagImage.image = UIImage(named: "RMB")
            currencySymbol.text = "Chinese Renminbi / 元"
        }
        if currencyTypeLabel.text == String("HKD") {
            flagImage.image = UIImage(named: "HKD")
            currencySymbol.text = "Hong Kong Dollar / $"
        }
        if currencyTypeLabel.text == String("CHF") {
            flagImage.image = UIImage(named: "CHF")
            currencySymbol.text = "Swiss Franc / Fr. "
        }
        if currencyTypeLabel.text == String("RUB") {
            flagImage.image = UIImage(named: "RUB")
            currencySymbol.text = "Russian Ruble / ₽"
        }
        if currencyTypeLabel.text == String("MXN") {
            flagImage.image = UIImage(named: "MXN")
            currencySymbol.text = "Mexican Peso / Mex$"
        }
        if currencyTypeLabel.text == String("AUD") {
            flagImage.image = UIImage(named: "AUD")
            currencySymbol.text = "Australian Dollar / $"
        }
        if currencyTypeLabel.text == String("NZD") {
            flagImage.image = UIImage(named: "NZD")
            currencySymbol.text = "New Zealand Dollar / $"
        }
        if currencyTypeLabel.text == String("CAD") {
            flagImage.image = UIImage(named: "CAD")
            currencySymbol.text = "Canadian Dollar / CA$"
        }
        if currencyTypeLabel.text == String("USD") {
            flagImage.image = UIImage(named: "USD")
            currencySymbol.text = "United States Dollar / $"
        }
    }
}
