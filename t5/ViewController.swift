//
//  ViewController.swift
//  t3
//
//  Created by Admin on 08/02/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate
{

    @IBOutlet weak var stepPLS: UIStepper!
    @IBOutlet weak var testPLS: UILabel!
    @IBOutlet weak var rounds: UILabel!
    @IBOutlet weak var groupStepper: UIStepper!
    @IBOutlet weak var groupSize: UITextField!


    @IBOutlet weak var groupDrop: UIPickerView!

    @IBOutlet weak var roundStepper: UIStepper!
    @IBOutlet weak var sizeTwo: UILabel!
    @IBOutlet weak var twoStep: UIStepper!
    @IBOutlet weak var sizeThree: UILabel!
    @IBOutlet weak var threeStep: UIStepper!
    @IBOutlet weak var sizeFour: UILabel!
    @IBOutlet weak var fourStep: UIStepper!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var namePlayers: UIButton!

    var list2 = ["2", "3", "4", "Mixed"];

    var results = [String]();
    var names = [String]();
    var numberPlayers = 0
    
    @IBAction func roundStepper(_ sender: UIStepper) {
         rounds.text = Int(sender.value).description
    }
    @IBAction func twoStepper(_ sender: UIStepper) {
        sizeTwo.text = Int(sender.value).description
    }
  
    @IBAction func threeStepper(_ sender: UIStepper) {
        sizeThree.text = Int(sender.value).description
    }
    @IBAction func fourStepper(_ sender: UIStepper) {
        sizeFour.text = Int(sender.value).description
    }
    @IBAction func PLSStepper(_ sender: UIStepper) {
        testPLS.text = Int(sender.value).description
        names = [String]()
        var temp = Int(testPLS.text!)
        for i in 1..<temp! + 1{
            names.append("Player "+String(i))
        }
        numberPlayers = Int(Int(sender.value).description)!
    }

    @IBAction func Test(_ sender: Any) {
        results = [String]()
        let a:Int? = Int(testPLS.text!)
        let b:String = groupSize.text!
        var e:Int? = 0
        var f:Int? = 0
        var g:Int? = 0
        var h:Int = 0
        var i:Int?

        if(b == "Mixed"){
            e = Int(sizeTwo.text!)
            f = Int(sizeThree.text!)
            g = Int(sizeFour.text!)
            h = 5
            i = e! + f!
            i = i! + g!
            if(e!*2 + f!*3 + g!*4 != a!){
                checkValidGroups()
            }
        }
        else{
            h = Int(b)!
            if(a!%h != 0){
                checkValidGroups()
            }
            i = a!/h
        }
        
        let d:Int? = Int(rounds.text!)
        
        if(a! < 1){
            let refreshAlert = UIAlertController(title: "Refresh", message: "All data will be lost.", preferredStyle: UIAlertControllerStyle.alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                print("Handle Ok logic here")
            }))
            present(refreshAlert, animated: true, completion: nil)
            //ViewController()
        }
        
        var run = Search();
        var groups = run.search(numPlayer: a!, rounds: d!, groupSize: h, numGroups: i!, mTwo:e!, mThree:f!, mFour:g!);
        print(names)
        for i in 0..<groups.count{
            var temp:String = ""
            var t = groups[i]
            for j in 0..<t.count{
                temp += names[t[j].getPlayerOne().getPlayerNo() - 1] + ", "
                temp += names[t[j].getPlayerTwo().getPlayerNo() - 1]
                let three = t[j].getPlayerThree().getPlayerNo()
                if(three != 0){
                   temp += ", " + names[t[j].getPlayerThree().getPlayerNo() - 1]
                }
                let four = t[j].getPlayerFour().getPlayerNo()
                if(four != 0){
                    temp += ", " +  names[t[j].getPlayerFour().getPlayerNo() - 1]
                }
                temp += "\n\n---------------\n\n"

            }
            results.append(temp);
        }
      
    }
    
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.hidesBackButton = true;
        groupDrop.delegate = self
        groupSize.delegate = self
        groupDrop.isHidden = true
        twoStep.isHidden = true;
        threeStep.isHidden = true;
        fourStep.isHidden = true;
        labelTwo.isHidden = true;
        labelThree.isHidden = true;
        labelFour.isHidden = true;
        sizeTwo.isHidden = true;
        sizeThree.isHidden = true;
        sizeFour.isHidden = true;

         let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view, typically from a nib.
        testPLS.text = String(numberPlayers)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "addDetail":
            guard let roundViewController = segue.destination as? RoundTableViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            print(results)
            for i in 0..<results.count {
                roundViewController.round.append(results[i])
            }
            
        case "nameDetail":
            guard let nameViewController = segue.destination as? NameTableViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            var numPlayers = Int(testPLS.text!)
            nameViewController.test = numPlayers!
            for i in 1..<numPlayers!+1 {
                nameViewController.name.append("Player " + String(i))
            }

            
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list2.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return list2[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.groupSize.text = self.list2[row]
        if(groupSize.text == "Mixed"){
            mixedSizesUiOn()
        }
        else{
            mixedSizesUiOff()
        }
        self.groupDrop.isHidden = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == groupSize {
            self.groupDrop.isHidden = false
            textField.endEditing(true)
        }
        
    }

    func mixedSizesUiOn(){
        twoStep.isHidden = false;
        threeStep.isHidden = false;
        fourStep.isHidden = false;
        labelTwo.isHidden = false;
        labelThree.isHidden = false;
        labelFour.isHidden = false;
        sizeTwo.isHidden = false;
        sizeThree.isHidden = false;
        sizeFour.isHidden = false;
    }
    
    func mixedSizesUiOff(){
        twoStep.isHidden = true;
        threeStep.isHidden = true;
        fourStep.isHidden = true;
        labelTwo.isHidden = true;
        labelThree.isHidden = true;
        labelFour.isHidden = true;
        sizeTwo.isHidden = true;
        sizeThree.isHidden = true;
        sizeFour.isHidden = true;
    }

    func checkValidGroups(){
        let refreshAlert = UIAlertController(title: "Error", message: "Invalid combination of players and group size(s)", preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
        }))
        present(refreshAlert, animated: true, completion: nil)

    }
    
}

