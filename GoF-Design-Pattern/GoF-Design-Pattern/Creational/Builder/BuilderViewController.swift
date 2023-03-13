//
//  BuilderViewController.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/08.
//

import UIKit

class BuilderViewController: UIViewController {
    
    var builder = HouseBuilder(location: .Jukjeon, materials: .Marble, capacity: .three)
    let materials = Materials.allCases
    let capacity = Capacity.allCases
    let locations = Location.allCases
    
    @IBOutlet weak var houseImageView: UIImageView!
    @IBOutlet weak var peopleImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buildButtonDidTap(_ sender: UIButton) {
        builder = builder.setLocation(location: locations[picker.selectedRow(inComponent: 0)])
            .setCapacity(capacity: capacity[picker.selectedRow(inComponent: 1)])
            .setMaterials(materials: materials[picker.selectedRow(inComponent: 2)])
        let newHouse = builder.build()
        buildNewHouse(newHouse)
    }
    
    private func buildNewHouse(_ house: House) {
        locationLabel.text = "위치: " + house.location.string
        var imageStr = house.materials == .Wood ? "house.fill" : "house"
        houseImageView.image = UIImage(systemName: imageStr)
        imageStr = house.capacity == .one ? "person" : house.capacity == .two ? "person.2" : "person.3"
        peopleImageView.image = UIImage(systemName: imageStr)
    }
}

extension BuilderViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0: return locations.count
        case 1: return capacity.count
        default: return materials.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return locations[row].string
        case 1:
            return capacity[row].string
        default:
            return materials[row].string
        }
    }
}
