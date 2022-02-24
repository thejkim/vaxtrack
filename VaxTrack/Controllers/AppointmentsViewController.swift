//
//  AppointmentsViewController.swift
//  Capstone Project iOS
//
//  Created by Harp on 3/28/21.
//

import UIKit

class AppointmentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var database: Database = Database()
    var appointments: [Appointment] = []
    var providers: [Provider] = []
    
    var touchedCellBtnTag: Int?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        createArray() // Array of appointments and corresponding providers
    }
    
    func createArray() {
        // Get all appointments set for the patient
        var tempAppointmemnts: [Appointment]? = []
        var error: MyError
        (tempAppointmemnts, error) = database.fetchAppointmentListForPatient(patientID: ST_User.shared.userID)

        
//        // Test. Hard coding ver.
//        let appointment = Appointment(appointmentID: 0001, virusType: "Covid-19", date: "2021-05-01", providerName: "Dr. Atrey", organizationName: "UAlbany", address: "1400 Washington Ave, NY 12222", contactPhone: "1(646)-777-7777", contactEmail: "email@email.com", website: "www.website.com")
//        tempAppointmemnts.append(appointment)
        
        self.appointments = tempAppointmemnts!
        // Get provider info
        var tempProviders: [Provider] = []
        for appointment in appointments {
            let (provider, error) = database.fetchProvider(providerID: appointment.providerID)
            print("-------------appointID=\(appointment.appointmentID) : pid=\(appointment.providerID)-----------")
            tempProviders.append(provider!)
        }
        self.providers = tempProviders
    }
    
    // Cancel appointment
    @IBAction func cancelBtnTouched(_ sender: UIButton) {
        touchedCellBtnTag = sender.tag
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("You tapped me!")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appointments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let appointment = appointments[indexPath.row]
        let provider = providers[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "appointmentCell", for: indexPath) as! appointmentCell
        cell.setAppointment(appointment: appointment)
        cell.setProviderInfo(provider: provider)
        cell.cancelBtn.tag = indexPath.row
        
        return cell
    }
    



}
