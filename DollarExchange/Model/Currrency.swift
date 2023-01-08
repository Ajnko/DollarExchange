//
//  Currrency.swift
//  DollarExchange
//
//  Created by Abdulbosid Jalilov on 08/01/23.
//

import Foundation


struct DollarCurrency: Decodable {
    
    let title          : String
    let code           : String
    let cb_price       : String
    let nbu_cell_price : String
    let nbu_buy_price  : String
    let date           : String
}
