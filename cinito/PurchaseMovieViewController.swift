//
//  PurchaseMovieViewController.swift
//  cinito
//
//  Created by Alex on 10/9/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class PurchaseMovieViewController: UIViewController {
    var movie: Movie!
    var schedules: [Room]!

    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("compra total \(currentCompra.total)")
        
        if(movie != nil){
            poster.image = movie.poster
            movieTitle.text = movie.title
        }
        if (schedules != nil){
            print(schedules.count)
        }
        
        let buttonX = 70
        let buttonWidth = 300
        let buttonHeight = 50
        var buttonY = 330
        
        let i = 55
        var pos = 0
        for item in schedules{
            buttonY = buttonY + i
            let button = UIButton(type: .system)
            let formatter = DateFormatter()
            // initially set the format based on your datepicker date / server String
            formatter.dateFormat = "dd-MMM - HH:mm"

            let dateString = formatter.string(from: item.datetime)
            
            print(item.datetime)
            
            button.tag = pos
            button.setTitle(dateString as String, for: .normal)
            button.tintColor = .white
            button.backgroundColor = .red
            button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
               
            button.frame = CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight)
               
            pos = pos + 1
            self.view.addSubview(button)
        }
        
        // Do any additional setup after loading the view.
    }
    
    @objc func buttonClicked(sender : UIButton){
        
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BuyTicket") as? BuyTicketViewController
        {
            vc.room = schedules[sender.tag]
            present(vc, animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
