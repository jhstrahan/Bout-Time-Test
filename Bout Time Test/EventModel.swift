//
//  EventModel.swift
//  Bout Time Test
//
//  Created by Joel Strahan on 10/28/17.
//  Copyright © 2017 Joel Strahan. All rights reserved.
//

import Foundation
import GameKit

class Event: Equatable, Comparable {
    let era: Era
    let event: String
    let year: Int
    
    init(era: Era, event: String, year: Int) {
        self.era = era
        self.event = event
        self.year = year
    }
    
    static func ==(lhs: Event, rhs: Event) -> Bool {
        return lhs.event == rhs.event
    }
    
    static func < (lhs: Event, rhs: Event) -> Bool {
        return lhs.year < rhs.year
    }
    
    var description: String {
        return "\(event) - \(year)"
    }
    
    var quizLabel: String {
        return "\(event)"
    }
}


enum Era {
    case creation
    case exodus
    
    var text: String {
        switch self {
        case .creation:
            return "Creation"
        case .exodus:
            return "Exodus"
        }
    }
    
    var quiz: [Event] {
        switch self {
        case .creation:
            return EventSet().creationEvents.sorted(by: <)
        case .exodus:
            return EventSet().exodusEvents.sorted(by: <)
        }
    }
}

struct EventSet {
    let creationEvents: [Event] = [Event.init(era: .creation, event: "Beginning", year: 01),
                                   Event.init(era: .creation, event: "Fall", year: 02),
                                   Event.init(era: .creation, event: "Cain and Abel", year: 03),
                                   Event.init(era: .creation, event: "Noah", year: 04),
                                   Event.init(era: .creation, event: "Babel", year: 05),
                                   Event.init(era: .creation, event: "Job", year: 06),
                                   Event.init(era: .creation, event: "Extra", year: 07)]
    
    let exodusEvents: [Event] = [Event.init(era: .exodus, event: "Midwives", year: 01),
                                 Event.init(era: .exodus, event: "Moses Young", year: 02),
                                 Event.init(era: .exodus, event: "Pharoah", year: 03),
                                 Event.init(era: .exodus, event: "Bush", year: 04),
                                 Event.init(era: .exodus, event: "Lamb", year: 05),
                                 Event.init(era: .exodus, event: "Commandment", year: 06),
                                 Event.init(era: .exodus, event: "Judgement", year: 07)]
    
    func masterQuiz(for era: Era) -> (master: [String], quiz: [String]) {
        var quizEvents = era.quiz
        var masterEvents = [Event]()
        var masterArray = [String]()
        var quizArray = [String]()
        
        for _ in 1...4 {
            let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: 4)
            masterEvents.append(quizEvents[randomNumber])
            quizArray.append(quizEvents[randomNumber].quizLabel)
            quizEvents.remove(at: randomNumber)
        }
        var answerArray = masterEvents.sorted(by: <)
        for _ in 1...4 {
            masterArray.append(answerArray[0].description)
            answerArray.remove(at: 0)
        }
        return (masterArray, quizArray)
    }
}
