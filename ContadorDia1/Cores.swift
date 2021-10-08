//
//  Cores.swift
//  ContadorDia1
//
//  Created by Pedro Gomes on 08/10/21.
//

import UIKit


enum Cores {
    
    case azulClaro
    
    var uiColor: UIColor {
        switch self {
        case .azulClaro:
            return UIColor(red: 218.0/255, green: 243.0/255, blue: 255.0/255, alpha: 1.0)
        }
    }
}


