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
    let ticketAdultPrice: Int = 80
    let ticketChildPrice: Int = 40
    var total: Int = 0

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var horario: UILabel!
    
    @IBOutlet weak var chidlTicket: UIStepper!
    
    @IBOutlet weak var adultTickets: UIStepper!
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
        updateTotalPrice()
    }
    
    @IBAction func childTicketStepper(_ sender: UIStepper) {
        childTickets.text = Int(sender.value).description
        updateTotalPrice()
    }
    
    @IBAction func buyTickets(_ sender: Any) {
        var total_tickets: Int = Int(adultTickets.value + chidlTicket.value)
       
        var pos = 0
        for item in Compra.rooms{
            if(item.id == room.id){
                if(item.maxCapacity > total_tickets){
                    Compra.rooms[pos].maxCapacity = item.maxCapacity - total_tickets
                    ConfirmedBuy.id = 1
                    ConfirmedBuy.room = room
                    ConfirmedBuy.totalAdultTickets = Int(adultTickets.value)
                    ConfirmedBuy.totalChildTickets = Int(chidlTicket.value)
                    ConfirmedBuy.ticketsTotalPrice = total
                    self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
                }
                else{
                    let alert = UIAlertController(title: "No hay lugares", message: "Elige menos lugares solo quedan \(Compra.rooms[pos].maxCapacity)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true)
                }
            }
            pos = pos + 1
        }
//        if(Compra.rooms[]
    }
    
    func updateTotalPrice(){
        var totalPriceAdult = ticketAdultPrice * Int(adultTickets.value)
        var totalPriceChild = ticketChildPrice * Int(chidlTicket.value)
        total = totalPriceAdult + totalPriceChild
        totalLabel.text = "Total: \(total) pesos"
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
