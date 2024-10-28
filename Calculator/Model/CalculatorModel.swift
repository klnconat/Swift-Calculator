import Foundation

struct CalculatorModel {
    
    private var previousNumber: Double?
    private var currentOperation: String?
    
    mutating func performOperation(_ operation: String, _ number: Double) -> Double? {
        switch operation {
        case "+/-":
            return number * -1
        case "AC":
            previousNumber = nil
            currentOperation = nil
            return 0
        case "%":
            return number / 100
        case "=", "+", "-", "×", "÷":
            if operation != "=" {
                previousNumber = number
                currentOperation = operation
                return nil // İşlem yapılmadan önce nil döndür
            } else {
                return calculateResult(with: number)
            }
        default:
            return number
        }
    }
    
    
    private func calculateResult(with number: Double) -> Double? {
        guard let operation = currentOperation, let prevNumber = previousNumber else {
            return nil
        }
        
        switch operation {
        case "+":
            return prevNumber + number
        case "-":
            return prevNumber - number
        case "×":
            return prevNumber * number
        case "÷":
            return number != 0 ? prevNumber / number : nil // Bölme işleminde 0 kontrolü
        default:
            return nil
        }
    }
}
