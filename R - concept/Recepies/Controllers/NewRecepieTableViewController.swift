//
//  NewRecepieTableViewController.swift
//  R - concept
//
//  Created by anna on 20.05.2022.
//

import UIKit

class NewRecepieTableViewController: UITableViewController {
    
    var newRecepie = Recepie(recepieName: "", resepieDescription: "")

    @IBOutlet weak var nameOfTheRecepieTF: UITextField!
    @IBOutlet weak var descriptionOfTheRecepieTF: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateSaveButton()
        
    }
    
    
    private func updateSaveButton() {
        let nameText = nameOfTheRecepieTF.text ?? ""
        let descriptionText = descriptionOfTheRecepieTF.text ?? ""
        
        saveButton.isEnabled = !nameText.isEmpty && !descriptionText.isEmpty
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        updateSaveButton()
    }
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveNewRecepieSegue" else { return }
        
        let name = nameOfTheRecepieTF.text ?? ""
        let description = descriptionOfTheRecepieTF.text ?? ""
        
        self.newRecepie = Recepie(recepieName: name, resepieDescription: description)
    }
}
