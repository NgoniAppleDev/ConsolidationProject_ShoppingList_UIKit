//
//  ViewController.swift
//  ShoppingList
//
//  Created by Ngoni Katsidzira  on 18/5/2025.
//

import UIKit

class ViewController: UITableViewController {
    
    var shoppingList: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Shopping List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewItem))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(clearShoppingList))
        
    }

    @objc func addNewItem() {
        let ac = UIAlertController(title: "New Item", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Add", style: .default) { [weak self, weak ac] _ in
            if let item = ac?.textFields?[0].text {
                self?.shoppingList.insert(item, at: 0)
                let indexPath = IndexPath(row: 0, section: 0)
                self?.tableView.insertRows(at: [indexPath], with: .left)
            }
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    @objc func clearShoppingList() {
        shoppingList.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingItem", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        
        return cell
    }

}

