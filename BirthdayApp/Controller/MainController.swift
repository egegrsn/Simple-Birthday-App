//
//  ViewController.swift
//  BirthdayApp
//
//  Created by Ege Girsen on 19.07.2022.
//

import UIKit

class MainController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var personViewModels = [PersonViewModel]()
    let cellId = "cell"
    var indexpathrow = 0
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        prepareTableView()
    }

    func prepareTableView(){
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
    }
    
    fileprivate func fetchData() {
        Service.shared.fetchPeople { (results, err) in
            if let err = err {
                print("Failed to fetch courses:", err)
                return
            }
            self.personViewModels = results?.map({return PersonViewModel(results: $0)}) ?? []
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PersonCell
        let personViewModel = personViewModels[indexPath.row]
        cell.personViewModel = personViewModel
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexpathrow = indexPath.row
        self.performSegue(withIdentifier: "profileSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ProfileViewController {
            vc.age = personViewModels[indexpathrow].age
            vc.initials = personViewModels[indexpathrow].initials
            vc.name = personViewModels[indexpathrow].name
            }
    }

}

