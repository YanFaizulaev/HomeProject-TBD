//
//  Extension+String.swift
//  HomeProject-TBD
//
//  Created by Bandit on 26.04.2023.
//

import UIKit

extension String {
    func getZodiacSign () -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM. yyyy г."
        let date = dateFormatter.date(from: self)
        
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date!)
        let month = calendar.component(.month, from: date!)
        
        var zodiacSign = ""
        if (month == 3 && day >= 21) || (month == 4 && day <= 19) {
            zodiacSign = "Овен"
        } else if (month == 4 && day >= 20) || (month == 5 && day <= 20) {
            zodiacSign = "Телец"
        } else if (month == 5 && day >= 21) || (month == 6 && day <= 21) {
            zodiacSign = "Близнецы"
        } else if (month == 6 && day >= 22) || (month == 7 && day <= 22) {
            zodiacSign = "Рак"
        } else if (month == 7 && day >= 23) || (month == 8 && day <= 22) {
            zodiacSign = "Лев"
        } else if (month == 8 && day >= 23) || (month == 9 && day <= 22) {
            zodiacSign = "Дева"
        } else if (month == 9 && day >= 23) || (month == 10 && day <= 22) {
            zodiacSign = "Весы"
        } else if (month == 10 && day >= 23) || (month == 11 && day <= 21) {
            zodiacSign = "Скорпион"
        } else if (month == 11 && day >= 22) || (month == 12 && day <= 21) {
            zodiacSign = "Стрелец"
        } else if (month == 12 && day >= 22) || (month == 1 && day <= 19) {
            zodiacSign = "Козерог"
        } else if (month == 1 && day >= 20) || (month == 2 && day <= 18) {
            zodiacSign = "Водолей"
        } else if (month == 2 && day >= 19) || (month == 3 && day <= 20) {
            zodiacSign = "Рыбы"
        }
        return zodiacSign
    }
}
