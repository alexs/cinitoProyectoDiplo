//
//  Compra.swift
//  cinito
//
//  Created by Alex on 10/10/19.
//  Copyright © 2019 Alex. All rights reserved.
//
let currentCompra = Compra(total: 120.50)

import UIKit
class Compra{
    static var rooms: [Room]!
    let total: Decimal
    
    init(total: Decimal){
        self.total = total
    }
}
