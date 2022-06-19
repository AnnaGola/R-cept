//
//  NewFolderTableViewController.swift
//  R - concept
//
//  Created by anna on 20.05.2022.
//

import UIKit

class NewFolderTableViewController: UITableViewController {

    var newFolder = Menu(emoji: "", folderName: "", description: "")
    
    @IBOutlet weak var imageTF: UITextField!
    @IBOutlet weak var folderNameTF: UITextField!
    @IBOutlet weak var descriptionTF: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        updateSaveButton()
    }
    
    private func updateSaveButton() {
        let imageText = imageTF.text ?? ""
        let folderNameText = folderNameTF.text ?? ""
        let descriptionText = descriptionTF.text ?? ""
        
        saveButton.isEnabled = !imageText.isEmpty && !folderNameText.isEmpty && !descriptionText.isEmpty
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        updateSaveButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveNewFolderSegue" else { return }
        
        let image = imageTF.text ?? ""
        let folderName = folderNameTF.text ?? ""
        let description = descriptionTF.text ?? ""
        
        self.newFolder = Menu(emoji: image, folderName: folderName, description: description)
    }
}
