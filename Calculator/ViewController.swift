import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var calculatorModel = CalculatorModel()
    
    // Yeni sayı girişi yapılıp yapılmadığını kontrol eden bayrak
    private var isFinishedTyping = true
    
    private var displayValue: Double {
        get {
            guard let doubleNumber = Double(displayLabel.text!) else {
                fatalError("Geçerli bir sayı değil.")
            }
            return doubleNumber
        }
        set {
            displayLabel.text? = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        // İşlem butonuna basıldığında mevcut sayı set edilir
        isFinishedTyping = true
        
        if let calcMethod = sender.currentTitle {
            if let result = calculatorModel.performOperation(calcMethod, displayValue) {
                displayValue = result
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let number = sender.currentTitle {
            // Yeni bir işlem başladıysa ekranı temizle
            if isFinishedTyping {
                displayLabel.text = number
                isFinishedTyping = false
            } else {
                if number == "." {
                    // Ondalık işaretini sadece bir kere ekle
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                // Yeni sayıyı mevcut sayıya ekle
                displayLabel.text? += number
            }
        }
    }
}
