//
//  GuitarListViewController.swift
//  Guitar List
//
//  Created by Paul Heintz on 3/27/18.
//  Copyright © 2018 Paul Heintz. All rights reserved.
//

import UIKit

class GuitarListViewController: UITableViewController {
    var models: [String] = []
    var mfr: String?
    private let gibson = ["Les Paul", "SG", "Explorer", "Flying V", "Firebird"]
    private let fender = ["Stratocaster", "Telecaster", "Jazzmaster"]
    private let ibanez = ["RG Series", "S Series", "Artcore", "Iceman"]
    private let esp = ["Arrow", "Eclipse", "FRX Series", "Horizon"]
    private static let cellIdentifier = "GuitarModel"

    override func viewDidLoad() {
        super.viewDidLoad()
        mfrForDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mfrForDisplay() {
        switch mfr {
        case "Gibson"?:
            models = gibson
            break
        case "Fender"?:
            models = fender
            break
        case "ESP"?:
            models = esp
            break
        case "Ibanez"?:
            models = ibanez
            break
        default:
            models = [""]
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GuitarListViewController.cellIdentifier, for: indexPath)

        cell.textLabel?.text = models[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mfr
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tableViewCell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: tableViewCell)!
        let guitar = models[indexPath.row]
        
        let guitarVC = segue.destination as! GuitarInfoViewController
        guitarVC.title = guitar
        guitarVC.guitar = guitar
    }

}
