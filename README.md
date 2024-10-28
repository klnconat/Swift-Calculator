# Calculator App

This project is a simple calculator app developed using Swift and the MVC architecture. It supports basic arithmetic operations (`+`, `-`, `×`, `÷`), percentage calculations (`%`), sign change (`+/-`), and resetting all values (`AC`). The calculator consists of a `CalculatorModel` to handle calculations and a `ViewController` to manage the UI interactions.

## Features

- **Basic Arithmetic Operations**: Supports addition, subtraction, multiplication, and division.
- **Percentage Calculation (`%`)**: Calculates the percentage of the current number.
- **Sign Change (`+/-`)**: Switches between positive and negative values.
- **Reset (`AC`)**: Resets all operations and clears the display.
- **Decimal Input**: Allows entering decimal numbers (e.g., `5.5`).

## Structure

This project is organized into two main components: `CalculatorModel` and `ViewController`.

- **`CalculatorModel`**: This model class handles all calculations and stores the state of the last operation. The `performOperation` function manages operations, and the `calculateResult` function performs calculations based on the current operation.
  
- **`ViewController`**: This class manages the user interface and interactions, updating the display with the current value using `displayLabel`. It interacts with `CalculatorModel` to execute the operations.

## Functions

### `CalculatorModel`

- **`performOperation(_ operation: String, _ number: Double) -> Double?`**:  
  Handles the main operations (`+`, `-`, `×`, `÷`, `%`, `+/-`, `AC`). For basic arithmetic operations, it stores the current number and selected operation. If `=` is pressed, it performs the calculation and returns the result.

- **`calculateResult(with number: Double) -> Double?`**:  
  Calculates the result of the stored operation and returns the final value based on `previousNumber` and `currentOperation`.

### `ViewController`

- **`displayValue`**:  
  Computed property that manages the value shown in the `displayLabel`. It converts the text in `displayLabel` to `Double` for calculation and updates the label when new results are obtained.

- **`calcButtonPressed(_ sender: UIButton)`**:  
  Handles operator button presses (`+`, `-`, `×`, `÷`, `=`, etc.). It sets up `CalculatorModel` with the current display value and performs the operation.

- **`numButtonPressed(_ sender: UIButton)`**:  
  Handles numeric input and decimal entry. This function also clears the display for new input after an operation has been selected.

## Usage

1. **Enter Numbers**: Tap the number buttons to enter values. 
2. **Perform Calculations**: Tap the operator buttons (`+`, `-`, `×`, `÷`) to select an operation.
3. **Calculate Result**: Tap `=` to display the result.
4. **Use Other Functions**: 
   - Tap `+/-` to toggle the sign.
   - Tap `%` to calculate the percentage.
   - Tap `AC` to reset the calculator.

## Example Scenarios

- `89 * 8 =` will show `712`.
- `50 %` will show `0.5`.
- `5 +/-` will change `5` to `-5`.

This app serves as a simple calculator to perform basic operations, demonstrating Swift's computed properties, optionals, and the MVC structure.
