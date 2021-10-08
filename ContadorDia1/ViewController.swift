//
//  ViewController.swift
//  ContadorDia1
//
//  Created by Pedro Gomes on 07/10/21.
//


/*
 - Label => UILabel
 - Botão => UIButton
 - Imagem => UIImageView (view), e UIImage (própria imagem)
 - Storyboard
 
 */

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var labelQtdAgua: UILabel!
    
    @IBOutlet weak var botaoIncrementar: UIButton!
    
    @IBOutlet weak var botaoDiminuir: UIButton!
    
    @IBOutlet weak var imageViewCopoDagua: UIImageView!
    
    @IBOutlet weak var entradaDeTextoUsuario: UITextField!
    
    @IBOutlet weak var labelMeta: UILabel!
    
    //MARK: - Variáveis
    
    var contadorCoposDagua: Int = 0
    
    var metaCoposDagua: Int {
        let textoDoUsuario: String = entradaDeTextoUsuario.text ?? "20"
        let metaEmInteiro = Int(textoDoUsuario) ?? 20
        return metaEmInteiro
    }
    
    var metaEstaCumprida: Bool = false {
        didSet {
            if metaEstaCumprida {
                view.backgroundColor = UIColor.green
            } else { 
                view.backgroundColor = Cores.azulClaro.uiColor
            }
        }
    }
    
    let unidadeExposta: Unidade = .copo
 
    // MARK: - Ciclo de Vida (Life Cycle)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let imagemCopoAgua: UIImage? = UIImage(named: "copoDeAgua")
       
        imageViewCopoDagua.image = imagemCopoAgua
        
        atualizaLabel()
        
        entradaDeTextoUsuario.addTarget(self, action: #selector(atualizaMeta), for: .editingChanged)
        
    }

    // MARK: - Metodos
    func atualizaLabel() {
        let mensagem: String = unidadeExposta.formaMensagem(copos: contadorCoposDagua)
        
        labelQtdAgua.text = mensagem
    }
    
    @objc func atualizaMeta() {
        guard let textoDoUsuario = entradaDeTextoUsuario.text else {
            return
        }
        labelMeta.text = "Meta: " + textoDoUsuario
    }
    
    // MARK: - IBAction
    
    @IBAction func incrementaContador(_ sender: UIButton) {
        contadorCoposDagua += 1
        
        metaEstaCumprida = (contadorCoposDagua >= metaCoposDagua)
        
        atualizaLabel()
    }
    
    @IBAction func diminuiContador(_ sender: Any) {
        contadorCoposDagua -= 1
        
        metaEstaCumprida = (contadorCoposDagua >= metaCoposDagua)
        
        atualizaLabel()
    }
    
}



