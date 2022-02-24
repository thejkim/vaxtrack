//
//  AppointmentConfirmationViewController.swift
//  VaxTrack
//
//  Created by Joeun Kim on 5/3/21.
//

import UIKit

class AppointmentConfirmationViewController: UIViewController {

    private var database: Database = Database()
    var appointment: Appointment?
    var provider: Provider?
    var tabbedTime: String = ""
    var selectedDate = Date()
    
    @IBOutlet weak var virusType: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var organizationName: UILabel!
    @IBOutlet weak var providerName: UILabel!
    @IBOutlet weak var contactPhone: UILabel!
    @IBOutlet weak var contactEmail: UILabel!
    @IBOutlet weak var website: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        virusType.text = "Covid-19" // TODO:- get it from search bar input
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        date.text = formatter.string(from: selectedDate)
        
//        date.text = appointment?.dateToString()
        
        time.text = tabbedTime
        address.text = provider?.address
        organizationName.text = provider?.organizationName
        providerName.text = (provider?.firstName)! + " " + (provider?.lastName)!
        contactPhone.text = provider?.contactPhone
        contactEmail.text = provider?.contactEmail
        website.text = provider?.website

        // Do any additional setup after loading the view.
    }

}
