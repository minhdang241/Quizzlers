//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    // Create a list of all questions
    let allQuestions = QuestionBank()
    
    // Create a variable to store user's answer
    var pickedAnswer:Bool = false
    
    // Create a variable to store question number
    var questionNumber:Int = 0
    
    // Create a variable to store score
    var score:Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
        
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        // If the True button is pressed, change the pickedAnswer variable to true and vice versa
        
        if sender.tag == 1 {
            
            // Log the status to debug
            // print("Correct Answer!")
            
            // Change the value of picked Answer
            pickedAnswer = true
        
        } else if sender.tag == 2 {
            
            // Log the status to debug
            // print("Wrong Answer!")
            
            // Change the value of picked Answer
            pickedAnswer = false
        
        }
        
        // Check the picked answer with the correct answer
        checkAnswer()
        
        // Increase the question number
        questionNumber += 1
        
        // Move to the next question
        nextQuestion()
        
    
        
    }
    
    
    func updateUI() {
        
        progressLabel.text = "\(questionNumber + 1) / 13"
        scoreLabel.text = "\(score)"
        progressBar.frame.size.width = (view.frame.size.width/13) * CGFloat(questionNumber + 1)
        
    }
    

    func nextQuestion() {
        
        if questionNumber <= 12 {
            
            questionLabel.text = allQuestions.list[questionNumber].questionText
            
            updateUI()
            
        } else {
            
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            
            alert.addAction(restartAction)
            
            present(alert, animated: true)
        }
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].correctAnswer
        
        if pickedAnswer == correctAnswer {
            
            print("Correct")
            score += 1
            
        } else {
            
            print("Wrong")
            
        }
    }
    
    
    func startOver() {
        
        // Reset the question number to zero
        questionNumber = 0
        
        // Reset the score to zero
        score = 0
        
        // Return to the first question
        nextQuestion()
        
       
       
    }
    
}
