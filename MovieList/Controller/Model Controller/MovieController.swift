//
//  MovieController.swift
//  MovieList
//
//  Created by Arian Mohajer on 1/19/22.
//

import Foundation

class MovieController {
    // MARK: - Properties
    static let sharedInstance = MovieController()
    var movies = [Movie]()
    
    // MARK: - Crud
    func createMovie(name: String, runTime: Int, leadActor: String) {
        let newMovie = Movie(title: name, runTime: runTime, leadActor: leadActor)
        movies.append(newMovie)
    }
    
    func update(_ movie: Movie, withTitle title: String, runTime: Int, leadActor: String) {
        movie.title = title
        movie.runTime = runTime
        movie.leadActor = leadActor
    }
    
    func delete(_ movie: Movie) {
        guard let index = movies.firstIndex(where: {$0 == movie}) else {return}
        movies.remove(at: index)
    }
}
