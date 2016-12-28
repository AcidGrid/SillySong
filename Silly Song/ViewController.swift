//
//  ViewController.swift
//  Silly Song
//
//  Created by Luis Enrique Cadena Fragoso on 25/12/16.
//  Copyright © 2016 Luis Enrique Cadena Fragoso. All rights reserved.
//

import UIKit

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}


class ViewController: UIViewController {
  

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func shortNameFromName(name:String)->String
    {
        let lowerCasedName = name.lowercased()
        let vowelSet = CharacterSet.init(charactersIn: "aeiou")
        var shortName = ""
        
        for character in lowerCasedName.unicodeScalars {
            
            if vowelSet.contains(character) {
                shortName = lowerCasedName.substring(from: lowerCasedName.characters.index(of: Character(character))!)
                return shortName
            }
        }
        
        return lowerCasedName
    }
    
    func lyricsForName(lyricsTemplae: String, fullName: String) -> String {
        let shortName = shortNameFromName(name: fullName)
        
        let lyrics = lyricsTemplae
            .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
            .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
        
        return lyrics
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
        
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        if nameField.text != "" {
            lyricsView.text = lyricsForName(lyricsTemplae: bananaFanaTemplate, fullName: nameField.text!)
        }
    }
    
  
  


}

