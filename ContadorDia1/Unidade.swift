//
//  Unidade.swift
//  ContadorDia1
//
//  Created by Pedro Gomes on 08/10/21.
//

import Foundation


enum Unidade {
    case copo
    case ml
    case litro
    
    // variáveis computadas
    private var sigla: String {
        switch self {
        case .litro:
            return " L"
        case .ml:
            return " ml"
        case .copo:
            return " c"
        }
    }
    
    func formaMensagem(copos: Int) -> String {
        switch self {
        case .litro:
            let litros = Float(copos)*0.2
            return "Litros hoje: " + String(format: "%.1f", litros) + self.sigla
        case .ml:
            return "Mls hoje: " + copoParaMl(copos: copos) + self.sigla
        case .copo:
            return "Copos hoje: " + String(copos) + self.sigla
        }
    }
    
    private func copoParaMl(copos: Int) -> String {
        return String(copos*200)
    }
}


