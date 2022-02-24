//
//  recordCell.swift
//  Capstone Project iOS
//
//  Created by Joeun Kim on 4/26/21.
//

import UIKit

class recordCell: UITableViewCell {
    
    @IBOutlet weak var virusNameLabel: UILabel!
    @IBOutlet weak var vaccinatedDateLabel: UILabel!
    
    func setRecord(record: Record) {
        virusNameLabel.text = record.virusType
//        let date = DateUtil.dateFrom(dateString: record.vaccinatedDate)!
//        vaccinatedDateLabel.text = DateUtil.dateOnlyToString(date: date!, withFormat: "")
        vaccinatedDateLabel.text = DateUtil.dateOnlyToString(date: record.vaccinatedDate, withFormat: "")
        
        
        
        
    }

}
