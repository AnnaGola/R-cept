//
//  RecepiesTableViewController.swift
//  R - concept
//
//  Created by anna on 20.05.2022.
//

import UIKit

class RecepiesTableViewController: UITableViewController {
    
    var recepies = [Recepie]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Recepies"
       
    }

    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveNewRecepieSegue" else { return }
        let sourceVS = segue.source as! NewRecepieTableViewController
        let recepie = sourceVS.newRecepie
      
        let newIndexPath = IndexPath(row: recepies.count, section: 0)
        recepies.append(recepie)
        tableView.insertRows(at: [newIndexPath], with: .fade)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recepies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recepiesCell", for: indexPath) as! RecepieTableViewCell
        
        let recepie = recepies[indexPath.row]
        cell.nameOfTheRecepie.text = recepie.recepieName
        cell.descriptionOfTheRecepie.text = recepie.resepieDescription
        
        return cell
    }

   
  
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedRecepie = recepies.remove(at: sourceIndexPath.row)
        recepies.insert(movedRecepie, at: destinationIndexPath.row)
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
            self.recepies.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            complition(true)
        }
        action.backgroundColor = .red
        action.image = UIImage(systemName: "trash")
        return action
    }
}
