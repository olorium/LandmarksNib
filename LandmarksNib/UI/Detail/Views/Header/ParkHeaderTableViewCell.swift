import UIKit

final class ParkHeaderTableViewCell: UITableViewCell {

    @IBOutlet private weak var parkImageView: UIImageView!
    @IBOutlet private weak var parkFullNameLabel: UILabel!
    
    func configure(image: String, parkName: String) {
        parkImageView.image = UIImage(named: "\(image)")
        parkFullNameLabel.text = parkName
        parkImageView.contentMode = UIView.ContentMode.scaleAspectFill
        parkImageView.layer.cornerRadius = 15
        
    }
}
