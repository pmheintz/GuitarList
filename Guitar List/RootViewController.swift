//
//  RootViewController.swift
//  Guitar List
//
//  Created by Paul Heintz on 3/27/18.
//  Copyright © 2018 Paul Heintz. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {
    private let mfr = ["Gibson", "Fender", "Ibanez", "ESP"]
    private static let mfrCell = "Manufacturers"

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mfr.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RootViewController.mfrCell, for: indexPath)

        cell.textLabel?.text = mfr[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Manufactorers"
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
        let modelsVC = segue.destination as! GuitarListViewController
        
        let mfrName = mfr[indexPath.row]
        modelsVC.mfr = mfrName
    }
}
