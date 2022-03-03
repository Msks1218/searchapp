//
//  ViewController.swift
//  Vobilishetty_SearchApp
//
//  Created by Student on 3/2/22.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var resultImage: UIImageView!
    
    @IBOutlet weak var topicInfoText: UITextView!
    
    @IBOutlet weak var searchButtonAction: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var showPrevImagesBtn: UIButton!
    
    @IBOutlet weak var showNextImagesBtn: UIButton!
    
    var arr = [["actor1","actor2","actor3","actor4","actor5"],["Villain1","Villain2","Villain3","Villain4","Villain5"],["wonders1","wonders2","wonders3","wonders4","wonders5",],["bg","404"]]
    
    var actors = ["actor","actors","hero","Hollywood","captainMarvel","Thor","Groot","Krish","captainAmerica","superhero","hero","film"]
    
    var villains = ["villains","marvel","joker","thanos","venom","greengoblin","droctopus"]
    
    var wonders = ["7wonders","wonders", "tajmahal","greatwall","colosseum","pyramid","picchu","monuments"]
    
    var topic = 0
    var imag1:Int!
    var imag2:Int!
    var imag3:Int!
    var name1:Int!
    var name2:Int!
    var name3:Int!
    var text1:Int!
    var text2:Int!
    var text3:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showPrevImagesBtn.isHidden = true
        showNextImagesBtn.isHidden = true
        searchButtonAction.isEnabled = false
        resetButton.isHidden = true
        resultImage.image = UIImage(named: arr[3][0])
        topicInfoText.text = nil
    }
    

    
    @IBAction func searchTextField(_ sender: UITextField) {
        searchButtonAction.isEnabled = true
        if(sender.text == ""){
            searchButtonAction.isEnabled = false
            
        }
        else{
            showPrevImagesBtn.isEnabled = false
            showNextImagesBtn.isEnabled = false
            searchButtonAction.isEnabled = true
            resetButton.isHidden = false
        }
    }
    
    
    
    var actor = [["captainAmerica","captainmarvel","thor","krish","groot"],["Captain America is the first avenger in marvel comics  He is the one leads all the avengers","Captain marvel is the lady superhero. She is late every time.","Thor is the oldest superhero of the marvel comics, he uses his hammer to attack.","Krish is the Indian super hero. He got his super powers from his dad.","I am groot."]]

    
    var Villains = [["joker","Thanos","greengoblin","DR octopus","venom"],["Joker is the most popular villain among all other in DC comics","Thanos is the most powerful villain in marvel comics. He wiped out half of the population using Infinity garunlet.","Green goblin is the villan from Spiderman movie, where he wear a goblin suite","DR Octopus is the first super hero villain from the Spiderman comics. He designed 4 metallic arms and attached them to himself.","Venom is the deadly super villain from the movie venom."]]


    var wonder = [["great wall","tajmahal","colloseum","pichhu","pyramids"],["Great Wall of china is the largest man made wall ever built.","Taj mahal is also known as symbol of love.","Colosseum is the place which built for bull fights.","Huayna Picchu is place with high mountain ranges.","Pyramids are the most ancient structures among the man made ones."]]

    
    
    
    @IBAction func searchButtonActionAction(_ sender: UIButton) {
        imag1 = 0
        imag2 = 0
        imag3 = 0
        name1 = 0
        name2 = 0
        name3 = 0
        text1 = 0
        text2 = 0
        text3 = 0
        showPrevImagesBtn.isHidden = false
        showNextImagesBtn.isHidden = false
        showPrevImagesBtn.isEnabled = false
        showNextImagesBtn.isEnabled = false
        resetButton.isEnabled = true
        if(actors.contains(searchTextField.text!)){
            showNextImagesBtn.isEnabled = true
            showPrevImagesBtn.isEnabled = false
            resultImage.image = UIImage(named: arr[0][imag1])
            topic = 1
            topicInfoText.text = actor[1][text1]
        }
        else if(villains.contains(searchTextField.text!)){
            showNextImagesBtn.isEnabled = true
            showPrevImagesBtn.isEnabled = false
            resultImage.image = UIImage(named: arr[1][imag2])
            topic = 2
            topicInfoText.text = Villains[1][text2]
        }
        else if(wonders.contains(searchTextField.text!)){
            showNextImagesBtn.isEnabled = true
            showPrevImagesBtn.isEnabled = false
            resultImage.image = UIImage(named: arr[2][imag3])
            topic = 3
            topicInfoText.text = wonder[1][text3]
        }
        else{
            resultImage.image = UIImage(named: arr[3][1])
            topicInfoText.text = nil
            showPrevImagesBtn.isHidden = true
            showNextImagesBtn.isHidden = true
            resetButton.isEnabled = true
        }
        
        
    }
    
    @IBAction func showPrevImagesBtn(_ sender: Any) {
        if(topic == 1){
            imag1 -= 1
            name1 -= 1
            text1 -= 1
            dataUpdate(imgNo: imag1)
        }
        if(topic == 2){
            imag2 -= 1
            name2 -= 1
            text2 -= 1
            dataUpdate(imgNo: imag2)
        }
        if(topic == 3){
            imag3 -= 1
            name3 -= 1
            text3 -= 1
            dataUpdate(imgNo: imag3)
        }
        
    }
    
    @IBAction func showNextImagesBtn(_ sender: Any) {
        if(topic == 1){
            imag1 += 1
            name1 += 1
            text1 += 1
            dataUpdate(imgNo: imag1)
        }
        if(topic == 2){
            imag2 += 1
            name2 += 1
            text2 += 1
            dataUpdate(imgNo: imag2)
        }
        if(topic == 3){
            imag3 += 1
            name3 += 1
            text3 += 1
            dataUpdate(imgNo: imag3)
        }
    }
    
    
    @IBAction func resetButton(_ sender: Any) {
        showPrevImagesBtn.isHidden = true
        showNextImagesBtn.isHidden = true
        topicInfoText.text = nil
        searchTextField.text = nil
        resetButton.isHidden = true
        imag1 = 0
        imag2 = 0
        imag3 = 0
        name1 = 0
        name2 = 0
        name3 = 0
        text1 = 0
        text2 = 0
        text3 = 0
        topic = 0
        
        
    }
    
    func dataUpdate(imgNo: Int){
        if(topic == 1){
            if imag1 == arr[0].count-1 {
                showNextImagesBtn.isEnabled = false
                showPrevImagesBtn.isEnabled = true
                resultImage.image = UIImage(named: arr[0][imag1])
                topicInfoText.text = actor[1][text1]
            }
            else if(imag1 == 0){
                showPrevImagesBtn.isEnabled = false
                showNextImagesBtn.isEnabled = true
                resultImage.image = UIImage(named: arr[0][imag1])
                topicInfoText.text = actor[1][text1]
            }
            else{
                showNextImagesBtn.isEnabled = true
                showPrevImagesBtn.isEnabled = true
                resultImage.image = UIImage(named: arr[0][imag1])
                topicInfoText.text = actor[1][text1]
            }
        }
        if(topic == 2){
            if imag2 == arr[1].count-1 {
                showNextImagesBtn.isEnabled = false
                showPrevImagesBtn.isEnabled = true
                resultImage.image = UIImage(named: arr[1][imag2])
                topicInfoText.text = Villains[1][text2]
            }
            else if(imag2 == 0){
                showPrevImagesBtn.isEnabled = false
                showNextImagesBtn.isEnabled = true
                resultImage.image = UIImage(named: arr[1][imag2])
                topicInfoText.text = Villains[1][text2]
            }
            else{
                showNextImagesBtn.isEnabled = true
                showPrevImagesBtn.isEnabled = true
                resultImage.image = UIImage(named: arr[1][imag2])
                topicInfoText.text = Villains[1][text2]
                
            }
        }
        if(topic == 3){
            if imag3 == arr[1].count-1 {
                showNextImagesBtn.isEnabled = false
                showPrevImagesBtn.isEnabled = true
                resultImage.image = UIImage(named: arr[2][imag3])
                topicInfoText.text = wonder[1][text3]
            }
            else if(imag3 == 0){
                showPrevImagesBtn.isEnabled = false
                showNextImagesBtn.isEnabled = true
                resultImage.image = UIImage(named: arr[2][imag3])
                topicInfoText.text = wonder[1][text3]
            }
            else{
                showNextImagesBtn.isEnabled = true
                showPrevImagesBtn.isEnabled = true
                resultImage.image = UIImage(named: arr[2][imag3])
                topicInfoText.text = wonder[1][text3]
                
            }
        }
    }
    

    
    
    
    
    
}




