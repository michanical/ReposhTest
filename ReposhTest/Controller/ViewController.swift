//
//  ViewController.swift
//  ReposhTest
//
//  Created by Mikhail Koroteev on 26.08.17.
//  Copyright © 2017 Mikhail Koroteev. All rights reserved.
//

import UIKit
import Darwin

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mainView: UIView!
    
    var viewWithInfo = MainView()
    
    var primeNumbers = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewSettings()
        setViewSettings()
    }
    
    func setTableViewSettings() {
        tableView?.register(NumberCell.nib, forCellReuseIdentifier:
            NumberCell.identifier)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }
    
    func setViewSettings() {
        viewWithInfo = Bundle.main.loadNibNamed("MainView",
                                                owner: nil,
                                                options: nil)?.first as! MainView
        viewWithInfo.frame = mainView.bounds
        viewWithInfo.calculateButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        mainView.addSubview(viewWithInfo)
    }
    
    func calculate(sender: UIButton) {
        if checkField() {
            let number = Int(viewWithInfo.inputTextField.text!)!
            primeNumbers = MathematicalMethods().findPrimeNumberBySieveOfAtkin(number: number)
            viewWithInfo.sumLabel.text = "Сумма: " + String(MathematicalMethods().getSumOfArray(array: primeNumbers))
            tableView.reloadData()
        }
    }
    
    func checkField() -> Bool {
        let fieldNumber = Int(viewWithInfo.inputTextField.text!)
        if fieldNumber != nil && fieldNumber! >= 2 {
            return true
        }
        return false
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return primeNumbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier:
            NumberCell.identifier, for: indexPath) as? NumberCell
        {
            cell.addDataToNumberCell(number: primeNumbers[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
    
}
