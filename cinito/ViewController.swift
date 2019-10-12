//
//  ViewController.swift
//  cinito
//
//  Created by Alex on 10/9/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var candies: [Candy] = []
    var movies: [Movie] = []
    var rooms: [Room] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeData()
        print(rooms.count)
        Compra.rooms = rooms
    }
    
    func initializeData(){
        candies.append(Candy(id: 1, name: "Palomitas", price: 50.00))
        candies.append(Candy(id: 2, name: "Gomitas", price: 10.00))
        candies.append(Candy(id: 3, name: "Nachos", price: 120.00))
        candies.append(Candy(id: 4, name: "Refresco", price: 70.00))
        candies.append(Candy(id: 5, name: "Papas", price: 40.00))
        candies.append(Candy(id: 6, name: "Chocolate", price: 30.00))
        
        movies.append(Movie(id: 1, title: "Gemini Man", poster: UIImage(named: "movie1")))
        movies.append(Movie(id: 2, title: "The Addams Family", poster: UIImage(named: "movie2")))
        movies.append(Movie(id: 3, title: "Parasite", poster: UIImage(named: "movie3")))
        movies.append(Movie(id: 4, title: "Jexi (2019)", poster: UIImage(named: "movie4")))
        movies.append(Movie(id: 5, title: "Little Monsters", poster: UIImage(named: "movie5")))
        movies.append(Movie(id: 6, title: "The Dead Center", poster: UIImage(named: "movie6")))
        movies.append(Movie(id: 7, title: "Gift", poster: UIImage(named: "movie7")))
        movies.append(Movie(id: 8, title: "High Strung Free Dance", poster: UIImage(named: "movie8")))
        movies.append(Movie(id: 9, title: "Joker", poster: UIImage(named: "movie9")))
        movies.append(Movie(id: 10, title: "Abominable", poster: UIImage(named: "movie10")))
        movies.append(Movie(id: 11, title: "Downton Abbey", poster: UIImage(named: "movie11")))
        movies.append(Movie(id: 12, title: "Hustlers", poster: UIImage(named: "movie12")))
        movies.append(Movie(id: 13, title: "It: Chapter Two", poster: UIImage(named: "movie13")))
        movies.append(Movie(id: 14, title: "Ad Astra", poster: UIImage(named: "movie14")))
        movies.append(Movie(id: 15, title: "Judy", poster: UIImage(named: "movie15")))
        movies.append(Movie(id: 16, title: "Rambo: Last Blood", poster: UIImage(named: "movie16")))
        movies.append(Movie(id: 17, title: "War", poster: UIImage(named: "movie17")))
        movies.append(Movie(id: 18, title: "Good Boys", poster: UIImage(named: "movie18")))

        var i = 1
        repeat {
            let dateIntRam = Int.random(in: 600 ... 1000)
            let date = Date.init(timeIntervalSinceNow: (TimeInterval(86400 + dateIntRam) ))
            rooms.append(Room(id: i, movieId: Int.random(in: 1 ... 18), maxCapacity: Int.random(in: 20 ... 60), datetime: date))
            i = i + 1
        } while i < 41
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        guard let destination = segue.destination as? MoviesTableViewController else
       {
          return
       }
       destination.movies = movies
    }
}

