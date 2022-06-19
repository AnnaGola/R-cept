//
//  MenuTableViewController.swift
//  R - concept
//
//  Created by anna on 20.05.2022.
//

import UIKit

class MenuTableViewController: UITableViewController {

    var folders = [Menu]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Menu"
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem

    }
  
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveNewFolderSegue" else { return }
        let sourceVC = segue.source as! NewFolderTableViewController
        let folder = sourceVC.newFolder
        
        let newIndexPath = IndexPath(row: folders.count, section: 0)
        folders.append(folder)
        tableView.insertRows(at: [newIndexPath], with: .fade)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return folders.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foldersCell", for: indexPath) as! MenuTableViewCell
        
        let folder = folders[indexPath.row]
        cell.emojiLabel.text = folder.emoji
        cell.nameOfTheFolderLabel.text = folder.folderName
        cell.descriptionOfTheFolderLabel.text = folder.description
        
        return cell
    }

   
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedFolder = folders.remove(at: sourceIndexPath.row)
        folders.insert(movedFolder, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let trash = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [trash])
        
    }
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "trash") { (action, view, complition) in
            self.folders.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            complition(true)
        }
        action.backgroundColor = .red
        action.image = UIImage(systemName: "trash")
        return action
    }
}

