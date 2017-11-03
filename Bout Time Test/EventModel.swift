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
    case lateEighteenthCentury
    case earlyNineteenthCentury
    case lateNineteenthCentury
    case earlyTwentiethCentury
    case lateTwentiethCentury
    case TwentyFirstCentury
    
    
    var text: String {
        switch self {
        case .lateEighteenthCentury:
            return "Late 1700's"
        case .earlyNineteenthCentury:
            return "Early 1800's"
        case .lateNineteenthCentury:
            return "Late 1800's"
        case .earlyTwentiethCentury:
            return "Early 1900's"
        case .lateTwentiethCentury:
            return "Late 1900's"
        case .TwentyFirstCentury:
            return "The 2000's"
        }
    }
    
    var quiz: [Event] {
        switch self {
        case .lateEighteenthCentury:
            return EventSet().late1700Events.sorted(by: <)
        case .earlyNineteenthCentury:
            return EventSet().early1800Events.sorted(by: <)
        case .lateNineteenthCentury:
            return EventSet().late1800Events.sorted(by: <)
        case .earlyTwentiethCentury:
            return EventSet().early1900Events.sorted(by: <)
        case .lateTwentiethCentury:
            return EventSet().late1900Events.sorted(by: <)
        case .TwentyFirstCentury:
            return EventSet().twentyFirstCenturyEvents.sorted(by: <)
        }
    }
    
    static func randomEra() -> Era {
        let eras = [Era.lateEighteenthCentury, Era.earlyNineteenthCentury, Era.lateNineteenthCentury, Era.earlyTwentiethCentury, Era.lateTwentiethCentury, Era.TwentyFirstCentury]
        let index = GKRandomDistribution(lowestValue: 0, highestValue: 5)
        let chosenEra = eras[index.nextInt()]
        
        return chosenEra
    }
    
}

struct EventSet {
    let late1700Events: [Event] = [Event.init(era: .lateEighteenthCentury, event: "Lightning rod invented by Benjamin Franklin", year: 1752),
                                   Event.init(era: .lateEighteenthCentury, event: "Steam engin invented by James Watt", year: 1769),
                                   Event.init(era: .lateEighteenthCentury, event: "Hot air balloon invented by Montgolfier brothers", year: 1783),
                                   Event.init(era: .lateEighteenthCentury, event: "Steamboat invented by John Fitch", year: 1791),
                                   Event.init(era: .lateEighteenthCentury, event: "Eli Whitney develops the cotton gin", year: 1793),
                                   Event.init(era: .lateEighteenthCentury, event: "Vaccination invented by Edward Jenner", year: 1798),
                                   Event.init(era: .lateEighteenthCentury, event: "Oliver Evans invents the conveyer belt", year: 1799)]
    
    let early1800Events: [Event] = [Event.init(era: .earlyNineteenthCentury, event: "Steam Locomotive invented by George Stephenson", year: 1814),
                                    Event.init(era: .earlyNineteenthCentury, event: "Miner's safety lamp invented by Humphry Davy", year: 1816),
                                    Event.init(era: .earlyNineteenthCentury, event: "Faraday demonstrates the principle of the electric motor", year: 1821),
                                    Event.init(era: .earlyNineteenthCentury, event: "Charles Babbage designs his first mechanical computer", year: 1822),
                                    Event.init(era: .earlyNineteenthCentury, event: "Photography invented by Joseph Nicephore Niepce", year: 1826),
                                    Event.init(era: .earlyNineteenthCentury, event: "Lawn mower invented by Edwin Beard Budding", year: 1830),
                                    Event.init(era: .earlyNineteenthCentury, event: "Electric telegraph invented by Charles Wheatstone", year: 1838)]
    
    let late1800Events: [Event] = [Event.init(era: .lateNineteenthCentury, event: "Charles Darwin publishes The Origin of Species", year: 1859),
                                   Event.init(era: .lateNineteenthCentury, event: "Revoloving machine gun invented by Richard J. Gatling", year: 1862),
                                   Event.init(era: .lateNineteenthCentury, event: "Dynamite invented by Alfred Nobel", year: 1866),
                                   Event.init(era: .lateNineteenthCentury, event: "Mendeleev produces the Periodic Table", year: 1869),
                                   Event.init(era: .lateNineteenthCentury, event: "Stock ticker invented by Thomas Alva Edison", year: 1870),
                                   Event.init(era: .lateNineteenthCentury, event: "Christopher Sholes invents the Remington typewriter", year: 1873),
                                   Event.init(era: .lateNineteenthCentury, event: "Gasoline carburettor invented by Daimler", year: 1876),
                                   Event.init(era: .lateNineteenthCentury, event: "Phonograph invented by Thmas Alva Edison", year: 1877),
                                   Event.init(era: .lateNineteenthCentury, event: "Edison invents the incadescent lamp", year: 1878),
                                   Event.init(era: .lateNineteenthCentury, event: "Eiffel Tower is built", year: 1888),
                                   Event.init(era: .lateNineteenthCentury, event: "Diesel engine invented by Rudolf Diesel", year: 1895),
                                   Event.init(era: .lateNineteenthCentury, event: "Remote control invented by Nikola Tesla", year: 1898)]
    
    let early1900Events: [Event] = [Event.init(era: .earlyTwentiethCentury, event: "Planck develops quantom theory", year: 1900),
                                 Event.init(era: .earlyTwentiethCentury, event: "Vacuum cleaner invented by Hubert Booth", year: 1901),
                                 Event.init(era: .earlyTwentiethCentury, event: "Powered airplane invented by Wilbur Wright and Orville Wright", year: 1903),
                                 Event.init(era: .earlyTwentiethCentury, event: "Henry Ford mass-produces the Model T", year: 1908),
                                 Event.init(era: .earlyTwentiethCentury, event: "London to Paris air service begins", year: 1919),
                                 Event.init(era: .earlyTwentiethCentury, event: "Sound film invented by Lee DeForest", year: 1923),
                                 Event.init(era: .earlyTwentiethCentury, event: "Ballpoint pen invented by Laszio Biro", year: 1938),
                                 Event.init(era: .earlyTwentiethCentury, event: "Microwave oven invented by Percy Spencer", year: 1946)]
    
    let late1900Events: [Event] = [Event.init(era: .lateTwentiethCentury, event: "Videocassette recorder invented by Ampex", year: 1956),
                                    Event.init(era: .lateTwentiethCentury, event: "Computer mouse invented by Douglas Engelbart", year: 1963),
                                    Event.init(era: .lateTwentiethCentury, event: "Video game console invented by Ralph H. Baer", year: 1968),
                                    Event.init(era: .lateTwentiethCentury, event: "E-mail invented by Ray Tomlinson", year: 1971),
                                    Event.init(era: .lateTwentiethCentury, event: "Ethernet invented by BNob Metcalfe and David Boggs", year: 1973),
                                    Event.init(era: .lateTwentiethCentury, event: "Camcorder invented by Sony", year: 1983),
                                    Event.init(era: .lateTwentiethCentury, event: "World Wide Web invented by Tim Berners-Lee", year: 1990)]
    
    
    let twentyFirstCenturyEvents: [Event] = [Event.init(era: .TwentyFirstCentury, event: "Artificial liver invented by Dr. Kenneth Matsumura and Alin Foundation", year: 2001),
                                   Event.init(era: .TwentyFirstCentury, event: "Birth Control patch invented by Ortho McNeil Pharmaceutical", year: 2002),
                                   Event.init(era: .TwentyFirstCentury, event: "Toyota invents the Hybrid Car", year: 2003),
                                   Event.init(era: .TwentyFirstCentury, event: "YouTub is invented by Steve Chen, Chad Hurley and Jawed Karim", year: 2005),
                                   Event.init(era: .TwentyFirstCentury, event: "The iPhone is invented", year: 2007),
                                   Event.init(era: .TwentyFirstCentury, event: "The Retail DNA Test is invented", year: 2008),
                                   Event.init(era: .TwentyFirstCentury, event: "The Bionic Lens is invented", year: 2011)]
    
    
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
            masterArray.append(answerArray[0].quizLabel)
            answerArray.remove(at: 0)
        }
        return (masterArray, quizArray)
    }
}
