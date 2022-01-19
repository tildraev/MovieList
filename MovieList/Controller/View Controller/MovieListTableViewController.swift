//
//  MovieListTableViewController.swift
//  MovieList
//
//  Created by Arian Mohajer on 1/19/22.
//

import UIKit

class MovieListTableViewController: UITableViewController {
    
    // MARK: - Table view data source
    
    //Deleted # of sections because it will default to 1
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return MovieController.sharedInstance.movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        
        // Configure the cell...
        let movie = MovieController.sharedInstance.movies[indexPath.row]
        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text = "Length: \(movie.runTime) mins. Lead actor: \(movie.leadActor)"
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let movieToDelete = MovieController.sharedInstance.movies[indexPath.row]
            MovieController.sharedInstance.delete(movieToDelete)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMovie" {
            if let indexPath = tableView.indexPathForSelectedRow,
               let destination = segue.destination as? MovieDetailViewController {
                let movieToSend = MovieController.sharedInstance.movies[indexPath.row]
                destination.movie = movieToSend
            }
        }
    }
}
