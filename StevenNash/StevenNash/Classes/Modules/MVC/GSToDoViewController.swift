//
//  GSToDoViewController.swift
//  StevenNash
//
//  Created by gongsheng on 2020/11/19.
//  Copyright © 2020 gongsheng. All rights reserved.
//

import UIKit

class GSToDoViewController: UITableViewController {
    
    enum Section: Int {
        case input = 0, todos, max
    }
    
    
    struct State {
        let todos: [String]
        let text: String
    }
    
    
//    var todos: [String] = []
    
    
    var state = State(todos: [], text: "") {
        didSet {
            if oldValue.todos != state.todos {
                tableView.reloadData()
                title = "TODO - (\(self.state.todos.count))"
            }
            
            if oldValue.text != state.text {
                let isItemLengthEnough = state.text.count >= 3
                navigationItem.rightBarButtonItem?.isEnabled = isItemLengthEnough
                
                let inputIndexPath = IndexPath(row: 0, section: Section.input.rawValue)
                let inputCell = tableView.cellForRow(at: inputIndexPath) as? GSTodoTableViewCell
                inputCell?.textField.text = state.text
            }
        }
    }
    
    let todoCellReuseId = "todoCellReuseId"
    let inputCellReuseId = "inputCellReuseId"
    
    
    override func viewDidLoad() {
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: todoCellReuseId)
        self.tableView.register(UINib.init(nibName: "GSTodoTableViewCell", bundle: nil), forCellReuseIdentifier: inputCellReuseId)
        
        ToDoStore.shared.getToDoItmes { (data) in
//            self.todos += data
//            self.title = "TODO - (\(self.todos.count))"
//            self.tableView.reloadData()
            
            self.state = State(todos: self.state.todos + data, text: self.state.text)
            
        }
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "add", style: .plain, target: self, action: #selector(addAction))
        
        self.view.backgroundColor = .white
    
    }
    
    @objc func addAction() {
//        let inputIndexPath = IndexPath(row: 0, section: Section.input.rawValue)
//        guard let inputCell = tableView.cellForRow(at: inputIndexPath) as? GSTodoTableViewCell,
//              let text = inputCell.textField.text else {
//            return
//        }
//
//        todos.insert(text, at: 0)
//        inputCell.textField.text = "";
//        title = "TODO - (\(self.todos.count))"
//        tableView.reloadData()
        
        state = State(todos: [state.text] + self.state.todos, text: "")
        
        
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.max.rawValue
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else {
            fatalError()
        }
        switch section {
        case .input: return 1
        case .todos: return state.todos.count
        case .max: fatalError()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Section(rawValue: indexPath.section) else {
            fatalError()
        }
        
        switch section {
        case .input:
            // return input cell
            let cell = tableView.dequeueReusableCell(withIdentifier: inputCellReuseId, for: indexPath) as! GSTodoTableViewCell
            cell.delegate = self
            return cell
        case .todos:
            let cell = tableView.dequeueReusableCell(withIdentifier: todoCellReuseId, for: indexPath)
            cell.textLabel?.text = self.state.todos[indexPath.row]
            return cell
        default:
            fatalError()
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == Section.todos.rawValue else {
            return
        }
//        todos.remove(at: indexPath.row)
//        title = "TODO - (\(self.todos.count))"
//        tableView.reloadData()
        
        let newTodos = Array(state.todos[..<indexPath.row] + state.todos[(indexPath.row + 1)...])
        state = State(todos: newTodos, text: self.state.text)
    }
    
}


extension GSToDoViewController: TableViewInputCellDelegate {
    func inputChanged(cell: GSTodoTableViewCell, text: String) {
//        let isItemLengthEnough = text.count >= 3
//        navigationItem.rightBarButtonItem?.isEnabled = isItemLengthEnough
        
        state = State(todos: self.state.todos, text: text)
    }
}
