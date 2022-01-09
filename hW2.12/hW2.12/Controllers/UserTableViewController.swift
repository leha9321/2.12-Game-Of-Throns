//
//  UserTableViewController.swift
//  hW2.12
//
//  Created by Алексей Трофимов on 12.12.2021.
//

import UIKit

class UserTableViewController: UITableViewController {
    
    var characters: [UserModel?] = []
    let urlString = "https://thronesapi.com/api/v2/Characters"
        
    //let searchConroller = UISearchController(searchResultsController: nil)
    ////    var felteredCharacter: [Result] = []
    //    var searchBarIsEmpty: Bool {
    //        guard let text = searchConroller.searchBar.text else { return false }
    //        return text.isEmpty
    //    }
    //    var isFiltering: Bool {
    //        return searchConroller.isActive && !searchBarIsEmpty
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        setupNavigationBar()
        ////   setupSearchController()
        //        tableView.rowHeight = 70
        //        tableView.backgroundColor = .black
        
        NetworkManager.shared.fetchData(from: urlString) { characters in
            DispatchQueue.main.async {
                self.characters = characters
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "go", sender: nil)
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserTableViewCell
        if let character = characters[indexPath.row] {
        cell.configure(with: character)
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        let person = characters[indexPath.row]
        let detailVC = segue.destination as! PersonViewController
        detailVC.character = person
    }
    
    
}

