//
//  CityCell.swift
//  psaweatherconsult
//
//  Created by mhd on 15/07/2022.
//

import Foundation
import UIKit

class CityCell: UITableViewCell {
    
    @IBOutlet weak var cityView: UIView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(cityWeather: City){
        cityView.layer.cornerRadius = 8.0
        cityView.layer.shadowColor = UIColor.lightGray.cgColor
        cityView.layer.shadowOpacity = 2
        cityView.layer.shadowOffset = CGSize.zero
        cityView.layer.shadowRadius = 4
        cityView.contentMode = .scaleAspectFill
        cityView.layer.masksToBounds = true
        cityLabel.text = cityWeather.name
        countryLabel.text = cityWeather.state
    }
    
}
