//
//  Carrito.swift
//  cinito
//
//  Created by Alex on 10/11/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import Foundation

let carrito = Carrito(total: 0.0)


class Carrito{
    
    let total: Decimal

    // Initialization

    init(total: Decimal) {
        self.total = total
    }
    
    func getTotal() -> Decimal{
        return self.total
    }
}
