import UIKit

protocol ParkInfoTableViewCellDelegate: AnyObject {
    func didSendTextFromTextField(_ newText: String)
}

class ParkInfoTableViewCell: UITableViewCell {

    weak var infoCellDelegate: ParkInfoTableViewCellDelegate?
    @IBOutlet weak var newTitleTextField: UITextField!
    @IBOutlet private weak var parkFullDescriptionLabel: UILabel!
    
    //MARK: - Functions
    
    func configure(description: String) {
        parkFullDescriptionLabel.text = description
        newTitleTextField.delegate = self
    }
}

//MARK: - Extensions

extension ParkInfoTableViewCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        infoCellDelegate?.didSendTextFromTextField(newTitleTextField.text ?? "")
        self.endEditing(true)
        return true
    }
}
