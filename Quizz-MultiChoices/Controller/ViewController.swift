//
//  ViewController.swift
//  Quizz-MultiChoices
//
//  Created by Ahmed Alaa on 13/04/2023.
//

import UIKit

class ViewController: UIViewController {
    
    //Mark: - Outlets.
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!

    @IBOutlet weak var choose1Button: UIButton!
    @IBOutlet weak var choose2Button: UIButton!
    @IBOutlet weak var choose3Button: UIButton!
    //Mark: - Propreties.
    var quizBrain = QuizBrain()
  
    //Mark: - LifeCycle Method.
    override func viewDidLoad() {
        super.viewDidLoad()
        updatUI()
    }
    
    //Mark: - Actions.
    @IBAction func answerBtnTapped(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
    
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updatUI), userInfo: nil, repeats: false)
    }
    
    //Mark: - Methods.
    @objc func updatUI() {
        questionLabel.text = quizBrain.getQuestionText()
        
        let answerChoices = quizBrain.getAnswers()
        choose1Button.setTitle(answerChoices[0], for: .normal)
        choose2Button.setTitle(answerChoices[1], for: .normal)
        choose3Button.setTitle(answerChoices[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score : \(quizBrain.getScore())"
        choose1Button.backgroundColor = UIColor.clear
        choose2Button.backgroundColor = UIColor.clear
        choose3Button.backgroundColor = UIColor.clear
    }
}

