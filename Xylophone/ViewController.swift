//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    // Declaração de variável com especificação de tipo de dado.
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Veja que esse método inicialmente era a conexão do botão 'C' com o código. Agora, esse método é chamado para qualquer um dos botões. Isso foi feito através de um "click-hold" feito na bolinha que fica na margem esquerda do editor, seguido do arraste da seta de interação até cada um dos outros botões!
    // Note que o método recebe como argumento um objeto do tipo UIButton. Para diferenciar a nota que vai ser tocada, basta ler a letra presente no botão que foi apertado!
    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle!)
    }
    
    // Função de leitura de arquivo de audio retirada do StackOverFlow
    func playSound(soundName: String) {
        
        // Atribui à variável url uma referência para o arquivo C.wav possivelmente presente na pasta do projeto.
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }
        
        do {
        /*
           AVAudioSession é um objeto que faz a intermediação entre o aplicativo e o hardware de audio.
           sharedInstance() é um método que cria uma instância do AVAudioSession.
           setCategory() é um método (que toda instância AVAudioSession possui) que configura a sessão de audio e recebe como argumentos:
               - a categoria da sessão, que define como o app se comporta. Veja mais opções em:
                   https://developer.apple.com/documentation/avfoundation/avaudiosession/audio_session_categories
               - o modo de operação da sessão. Veja mais opções em:
                   https://developer.apple.com/documentation/avfoundation/avaudiosession/audio_session_modes
           setActive() é um método (que toda instância AVAudioSession possui) que ativa a sessão.
        */
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

        /*
             
        */
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}

