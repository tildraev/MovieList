//
//  MovieDetailViewController.swift
//  MovieList
//
//  Created by Arian Mohajer on 1/19/22.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var movieNameTextField: UITextField!
    @IBOutlet weak var runTimeTextField: UITextField!
    @IBOutlet weak var leadActorTextField: UITextField!
    
    var movie: Movie? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        guard let movie = movie else {return}
        updateUI(movie: movie)
    }
    
    func updateUI(movie: Movie){
        movieNameTextField.text = movie.title
        runTimeTextField.text = "\(movie.runTime)"
        leadActorTextField.text = movie.leadActor
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard   let movieName = movieNameTextField.text,
                !movieName.isEmpty,
                let runTimeString = runTimeTextField.text,
                let runTime = Int(runTimeString),
                let leadActor = leadActorTextField.text,
                !leadActor.isEmpty
        else {return}
        
        if let movie = movie {
            //update a movie
            MovieController.sharedInstance.update(movie, withTitle: movie.title, runTime: movie.runTime, leadActor: movie.leadActor)
        } else {
            //create a movie
            MovieController.sharedInstance.createMovie(name: movieName, runTime: runTime, leadActor: leadActor)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        movieNameTextField.text = ""
        runTimeTextField.text = ""
        leadActorTextField.text = ""
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        if let movie = movie {
            MovieController.sharedInstance.delete(movie)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
}

