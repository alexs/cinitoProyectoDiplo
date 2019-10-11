//
//  BuyTicketViewController.swift
//  cinito
//
//  Created by Alex on 10/11/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class BuyTicketViewController: UIViewController {
    
    var room: Room!

    @IBOutlet weak var horario: UILabel!
    

    @IBOutlet weak var childTickets: UILabel!
    @IBOutlet weak var amount: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = DateFormatter()
       // initially set the format based on your datepicker date / server String
       formatter.dateFormat = "dd-MMM - HH:mm"

       let dateString = formatter.string(from: room.datetime)
        
        horario.text = dateString
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ticketStepper(_ sender: UIStepper) {
        amount.text = Int(sender.value).description
    }
    
    @IBAction func childTicketStepper(_ sender: UIStepper) {
        childTickets.text = Int(sender.value).description
    }
    
    @IBAction func buyTickets(_ sender: Any) {
        print(Carrito.getTotal)
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
