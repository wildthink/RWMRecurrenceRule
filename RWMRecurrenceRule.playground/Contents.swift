// Note: Run this playground from within the RWMRecurrenceRule project.

import Foundation
import RWMRecurrenceRule

extension String.StringInterpolation {

    mutating func appendInterpolation(_ value: Date) {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        
        let dateString = formatter.string(from: value)
        appendLiteral(dateString)
    }
    
    mutating func appendInterpolation(_ value: Date, style: DateFormatter.Style) {
        let formatter = DateFormatter()
        formatter.dateStyle = style
        
        let dateString = formatter.string(from: value)
        appendLiteral(dateString)
    }

}

extension Date {
    func enumerate(_ rule: String, call: (Date?, inout Bool) -> Void) {
        let parser = RWMRuleParser()
            if let rules = parser.parse(rule: rule) {
                let scheduler = RWMRuleScheduler(rule: rules)
                scheduler.enumerateDates(startingFrom: self, using: call)
        }
    }
}

// Every 4 days, 10 occurrences
/*

let rule = "RRULE:FREQ=DAILY;INTERVAL=4;COUNT=10"
let parser = RWMRuleParser()
if let rules = parser.parse(rule: rule) {
    let scheduler = RWMRuleScheduler(rule: rules)
    let start = Date()
    scheduler.enumerateDates(startingFrom: start, using: { (date, stop) in
        if let date = date {
            print("\(date)")
        }
    })
}
*/

Date().enumerate("FREQ=monthly;INTERVAL=4;COUNT=10") { (date, stop) in
    if let date = date { print ("\(date, style: .medium)") }
}

// TODO - coming soon
