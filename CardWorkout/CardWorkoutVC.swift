//
//  CardWorkoutVC.swift
//  CardWorkout
//
//  Created by Lakshay Bhatnagar on 21/07/25.
//

import UIKit

class CardWorkoutVC: UIViewController {

    @IBOutlet var cardImageView: UIImageView!
    
    var timer: Timer!
    
    var cards: [UIImage] = Decks.allValues
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateCard), userInfo: nil, repeats: true)
    }
    
    @objc func updateCard() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
}
