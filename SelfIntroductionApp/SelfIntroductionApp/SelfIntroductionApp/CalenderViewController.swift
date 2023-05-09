//
//  CalenderViewController.swift
//  SelfIntroductionApp
//
//  Created by Watanabe Kazuyuki on 2023/05/04.
//

import UIKit

class CalenderViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
        let selection = UICalendarSelectionSingleDate(delegate: self)
        let calendarView = UICalendarView()
        calendarView.frame = view.bounds
        calendarView.delegate = self
        calendarView.selectionBehavior = selection
        view.addSubview(calendarView)
    }
}
extension CalenderViewController: UICalendarViewDelegate {}
extension CalenderViewController: UICalendarSelectionSingleDateDelegate {
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        guard let dateComponents = dateComponents,
              let year = dateComponents.year,
              let month = dateComponents.month,
              let day = dateComponents.day else {
            return
        }
        print("yate: \(year), month: \(month), day: \(day)")
    }
}
