//
//  Movie.swift
//  MovieList
//
//  Created by Arian Mohajer on 1/19/22.
//

import Foundation

class Movie {
    // MARK: - Movie Properties
    var title: String
    var runTime: Int
    var leadActor: String
    
    // MARK: - Memberwise Initializer
    /// # Init
    /// Used to create a new `movie` instance
    /// - parameter title: The movie's title ->`string`
    /// - parameter runTime: The movie's runtime in minutes ->`int`
    /// - parameter leadActor: The lead actor of the `movie`->`string`
    ///
    /// Example
    ///  ```
    ///  Movie(title: "Titanic", runTime: 194, leadActor: "The Door")
    ///  ```
    init(title: String, runTime: Int, leadActor: String) {
        self.title = title
        self.runTime = runTime
        self.leadActor = leadActor
    }
}

// MARK: - Conforming to Equatable
extension Movie: Equatable {
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        lhs.title     == rhs.title &&
        lhs.leadActor == rhs.leadActor &&
        lhs.runTime   == rhs.runTime
    }
}
