//
//  MenuViewController.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/06.
//

import UIKit

class MenuTableViewController: UITableViewController {
        
    let sections = ["👨🏻‍🎨Creational", "🧬Structural", "🤸🏻Behavioral"]
    
    let patterns = [
        ["Singleton", "Factory Method", "Abstract Factory", "Builder", "Prototype"],
        ["Adapter", "Bridge", "Composite", "Facade", "Flyweight"],
        ["Observer", "Chain of Responsibility", "Command", "Interpreter", "Iterator", "Mediator", "Memento", "State", "Strategy", "Template Method", "Visitor"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension MenuTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patterns[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as? MenuTableViewCell else { return UITableViewCell() }
        cell.menuTitleLabel.text = patterns[indexPath.section][indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: patterns[indexPath.section][indexPath.row]) else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
}
