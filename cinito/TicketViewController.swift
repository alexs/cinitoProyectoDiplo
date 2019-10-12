//
//  TicketViewController.swift
//  cinito
//
//  Created by Alex on 10/11/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class TicketViewController: UIViewController {

    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var subTotalTickets: UILabel!
    @IBOutlet weak var childTickets: UILabel!
    @IBOutlet weak var adultTicket: UILabel!
    @IBOutlet weak var room: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adultTicket.text = "Boletos Adulto: \(ConfirmedBuy.totalAdultTickets!)"

        // Do any additional setup after loading the view.
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
