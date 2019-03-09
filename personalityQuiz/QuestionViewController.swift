//
//  QuestionViewController.swift
//  personalityQuiz
//
//  Created by student15 on 3/8/19.
//  Copyright © 2019 student15. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    
    @IBOutlet weak var singleStackView: UIStackView!
    
  
    @IBOutlet weak var multipleStackView: UIStackView!
    
    
    
    @IBOutlet weak var rangedStackView: UIStackView!
    
    
    
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
        
        navigationItem.title = "Question #\(questionIndex+1)"
        
        let currentQuestion = questions[questionIndex]
        
        switch currentQuestion.type {
        case .single:
            singleStackView.isHidden = false
        case .multiple:
            multipleStackView.isHidden = false
        case .ranged:
            rangedStackView.isHidden = false
            
        }
        
        
    }
    
    
    

}
