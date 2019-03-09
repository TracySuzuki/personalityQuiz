//
//  QuestionViewController.swift
//  personalityQuiz
//
//  Created by student15 on 3/8/19.
//  Copyright © 2019 student15. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
  
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UIButton!
    @IBOutlet weak var multiLabel2: UIButton!
    @IBOutlet weak var multiLabel3: UIButton!
    @IBOutlet weak var multiLabel4: UIButton!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UIButton!
    @IBOutlet weak var rangedLabel2: UIButton!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
   
    
    
    var questions: [Question] = [
        Question(text: "Which food do you like the most?",
                 type: .single,
                 answer: [
                    Answer(text: "Steak", type: .dog),
                    Answer(text: "Fish", type: .cat),
                    Answer(text: "Carrots", type: .rabbit),
                    Answer(text: "Corn", type: .turtle)
            ]),
        
        Question(text: "Which activities do you enjoy?",
                 type: .multiple,
                 answer: [
                    Answer(text: "Swimming", type: .turtle),
                    Answer(text: "Sleeping", type: .cat),
                    Answer(text: "Cuddling", type: .rabbit),
                    Answer(text: "Eating", type: .dog)
            ]),
        
        Question(text: "How much do you enjoy car rides?",
                 type: .ranged,
                 answer: [
                    Answer(text: "I dislike them", type: .cat),
                    Answer(text: "I get a little nervous", type: .rabbit),
                    Answer(text: "I barely notice them", type: .turtle),
                    Answer(text: "I love them", type: .dog)
            ]),
    
    ]
    
    var questionIndex = 0
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }
    

    func updateUI() {
        
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
  
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answer
        let totalProgress = Float(questionIndex) /
            Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex+1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        

//        case .single:
//            singleStackView.isHidden = false
//        case .multiple:
//            multipleStackView.isHidden = false
//        case .ranged:
//            rangedStackView.isHidden = false
            
        }
        
    }
    
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers [0].text, for: .normal)
        singleButton2.setTitle(answers [1].text, for: .normal)
        singleButton3.setTitle(answers [2].text, for: .normal)
        singleButton4.setTitle(answers [3].text, for: .normal)
        
    }
    
    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
//        multiSwitch1 .isOn = false
//        multiSwitch2 .isOn = false
//        multiSwitch3 .isOn = false
//        multiSwitch4 .isOn = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text

    }
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
}
