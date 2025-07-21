# ÆLang Control Flow Reference

## Overview
ÆLang supports essential control flow constructs including conditional statements, loops, and branching mechanisms. These constructs enable decision-making and repetitive execution in programs.

## Conditional Statements

### If Statements

#### Basic If Statement
```aelang
if (condition) {
    // Code block executed if condition is true
}
```

#### If-Else Statement
```aelang
if (condition) {
    // Code executed if condition is true
} else {
    // Code executed if condition is false
}
```

#### If-Else If Chain
```aelang
if (condition1) {
    // Code executed if condition1 is true
} else if (condition2) {
    // Code executed if condition2 is true
} else if (condition3) {
    // Code executed if condition3 is true
} else {
    // Code executed if all conditions are false
}
```

### Conditional Examples

#### Basic Conditional Logic
```aelang
extern print(format: str, ...);
extern read();

func check_age(): void {
    print("Enter your age: ");
    let age: u8 = read();
    
    if (age >= 18) {
        print("You are an adult.\n");
    } else {
        print("You are a minor.\n");
    }
}

func grade_classifier(): void {
    print("Enter your score (0-100): ");
    let score: u8 = read();
    
    if (score >= 90) {
        print("Grade: A (Excellent)\n");
    } else if (score >= 80) {
        print("Grade: B (Good)\n");
    } else if (score >= 70) {
        print("Grade: C (Average)\n");
    } else if (score >= 60) {
        print("Grade: D (Below Average)\n");
    } else {
        print("Grade: F (Fail)\n");
    }
}
```

#### Numeric Comparisons
```aelang
func compare_numbers(): void {
    print("Enter first number: ");
    let num1: i32 = read();
    print("Enter second number: ");
    let num2: i32 = read();
    
    if (num1 > num2) {
        print("%d is greater than %d\n", num1, num2);
    } else if (num1 < num2) {
        print("%d is less than %d\n", num1, num2);
    } else {
        print("%d is equal to %d\n", num1, num2);
    }
}

func check_even_odd(): void {
    print("Enter a number: ");
    let number: i32 = read();
    
    if ((number % 2) == 0) {
        print("%d is even\n", number);
    } else {
        print("%d is odd\n", number);
    }
}
```

#### Boolean Logic
```aelang
func validate_password(): void {
    print("Enter password length: ");
    let length: u8 = read();
    print("Has uppercase? (1=yes, 0=no): ");
    let has_upper: bool = read();
    print("Has numbers? (1=yes, 0=no): ");
    let has_numbers: bool = read();
    
    if (length >= 8 && has_upper && has_numbers) {
        print("Password is strong!\n");
    } else if (length >= 6) {
        print("Password is medium strength.\n");
    } else {
        print("Password is too weak!\n");
    }
}
```

### Complex Conditional Examples

#### Range Checking
```aelang
func temperature_analysis(): void {
    print("Enter temperature in Celsius: ");
    let temp: f32 = read();
    
    if (temp < -273.15) {
        print("Invalid temperature (below absolute zero)\n");
    } else if (temp < 0.0) {
        print("Freezing temperature\n");
    } else if (temp >= 0.0 && temp < 100.0) {
        print("Normal temperature range\n");
    } else if (temp >= 100.0 && temp < 200.0) {
        print("High temperature\n");
    } else {
        print("Extremely high temperature\n");
    }
}

func bmi_category(): void {
    print("Enter weight (kg): ");
    let weight: f32 = read();
    print("Enter height (m): ");
    let height: f32 = read();
    
    let bmi: f32 = weight / (height * height);
    
    if (bmi < 18.5) {
        print("BMI: %.2f - Underweight\n", bmi);
    } else if (bmi >= 18.5 && bmi < 25.0) {
        print("BMI: %.2f - Normal weight\n", bmi);
    } else if (bmi >= 25.0 && bmi < 30.0) {
        print("BMI: %.2f - Overweight\n", bmi);
    } else {
        print("BMI: %.2f - Obese\n", bmi);
    }
}
```

#### Multiple Condition Checks
```aelang
func loan_eligibility(): void {
    print("Enter annual income: ");
    let income: u32 = read();
    print("Enter credit score (300-850): ");
    let credit_score: u16 = read();
    print("Enter existing debt: ");
    let debt: u32 = read();
    
    let debt_to_income: f32 = debt / income;
    
    if (income >= 50000 && credit_score >= 700 && debt_to_income < 0.3) {
        print("Loan approved with excellent terms!\n");
    } else if (income >= 30000 && credit_score >= 650 && debt_to_income < 0.4) {
        print("Loan approved with standard terms.\n");
    } else if (income >= 20000 && credit_score >= 600) {
        print("Loan may be approved with higher interest.\n");
    } else {
        print("Loan application declined.\n");
    }
}
```

## Comparison Operators

### Basic Comparison Operators
```aelang
// Equal to
if (a == b) { }

// Not equal to
if (a != b) { }

// Greater than
if (a > b) { }

// Less than
if (a < b) { }

// Greater than or equal to
if (a >= b) { }

// Less than or equal to
if (a <= b) { }
```

### Comparison Examples by Data Type

#### Integer Comparisons
```aelang
func integer_comparisons(): void {
    let a: i32 = 10;
    let b: i32 = 20;
    let c: i32 = 10;
    
    // Equality checks
    if (a == c) {
        print("a equals c\n");           // This will execute
    }
    
    if (a != b) {
        print("a is not equal to b\n"); // This will execute
    }
    
    // Magnitude comparisons
    if (b > a) {
        print("b is greater than a\n"); // This will execute
    }
    
    if (a <= c) {
        print("a is less than or equal to c\n"); // This will execute
    }
}
```

#### Floating Point Comparisons
```aelang
func float_comparisons(): void {
    let x: f32 = 3.14159;
    let y: f32 = 2.71828;
    let tolerance: f32 = 0.00001;
    
    // Direct comparison (be careful with floating point precision)
    if (x > y) {
        print("Pi is greater than e\n");
    }
    
    // Range-based comparison
    if (x >= 3.0 && x <= 4.0) {
        print("x is between 3 and 4\n");
    }
    
    // Approximate equality (recommended for floats)
    let diff: f32 = x - y;
    if (diff < tolerance && diff > -tolerance) {
        print("x and y are approximately equal\n");
    }
}
```

#### Boolean Comparisons
```aelang
func boolean_operations(): void {
    let flag1: bool = true;
    let flag2: bool = false;
    
    if (flag1 == true) {
        print("flag1 is true\n");
    }
    
    if (flag2 != true) {
        print("flag2 is not true\n");
    }
    
    // Boolean logic combinations
    if (flag1 && !flag2) {
        print("flag1 is true AND flag2 is false\n");
    }
    
    if (flag1 || flag2) {
        print("At least one flag is true\n");
    }
}
```

#### Character Comparisons
```aelang
func character_comparisons(): void {
    let ch1: char = 'A';
    let ch2: char = 'B';
    let ch3: char = 'a';
    
    // ASCII value comparisons
    if (ch1 < ch2) {
        print("A comes before B\n");
    }
    
    if (ch1 != ch3) {
        print("A is not equal to a (case sensitive)\n");
    }
    
    // Range checks
    if (ch1 >= 'A' && ch1 <= 'Z') {
        print("ch1 is uppercase\n");
    }
    
    if (ch3 >= 'a' && ch3 <= 'z') {
        print("ch3 is lowercase\n");
    }
}
```

## Logical Operators

### Logical AND (&&)
```aelang
func logical_and_examples(): void {
    let age: u8 = 25;
    let has_license: bool = true;
    let has_car: bool = true;
    
    // All conditions must be true
    if (age >= 18 && has_license && has_car) {
        print("Can drive legally\n");
    }
    
    // Range checking
    let score: i32 = 85;
    if (score >= 80 && score <= 100) {
        print("Score is in A range\n");
    }
}
```

### Logical OR (||)
```aelang
func logical_or_examples(): void {
    let weather: char = 'R';  // R=Rain, S=Snow, C=Clear
    
    // Any condition can be true
    if (weather == 'R' || weather == 'S') {
        print("Bad weather - stay indoors\n");
    }
    
    let day: u8 = 7;  // 1=Monday, 7=Sunday
    if (day == 1 || day == 7) {
        print("It's either Monday or Sunday\n");
    }
}
```

### Logical NOT (!)
```aelang
func logical_not_examples(): void {
    let is_raining: bool = false;
    let has_umbrella: bool = true;
    
    // Negation
    if (!is_raining) {
        print("It's not raining\n");
    }
    
    // Complex negation
    if (!(is_raining && !has_umbrella)) {
        print("Safe to go out\n");
    }
}
```

### Combined Logical Operations
```aelang
func complex_logic(): void {
    let temperature: i32 = 22;
    let humidity: u8 = 60;
    let is_sunny: bool = true;
    let is_weekend: bool = true;
    
    // Complex condition for ideal picnic weather
    if ((temperature >= 20 && temperature <= 30) && 
        (humidity < 70) && 
        is_sunny && 
        is_weekend) {
        print("Perfect picnic weather!\n");
    }
    
    // Alternative conditions
    if ((temperature > 30 || temperature < 15) || 
        (humidity > 80) || 
        !is_sunny) {
        print("Not ideal outdoor weather\n");
    }
}
```

## Loops (Conceptual Implementation)

*Note: Specific loop syntax may vary based on compiler implementation*

### While Loop Pattern
```aelang
func count_to_ten(): void {
    let counter: i32 = 1;
    
    // Basic counting loop
    while (counter <= 10) {
        print("Count: %d\n", counter);
        counter = counter + 1;
    }
}

func sum_numbers(): void {
    print("Enter numbers (0 to stop):\n");
    let sum: i32 = 0;
    let number: i32 = 1;
    
    while (number != 0) {
        print("Enter number: ");
        number = read();
        sum = sum + number;
    }
    
    print("Total sum: %d\n", sum);
}
```

### For Loop Pattern (Implementation May Vary)
```aelang
func multiplication_table(): void {
    print("Enter a number: ");
    let base: i32 = read();
    
    let i: i32 = 1;
    while (i <= 12) {
        let result: i32 = base * i;
        print("%d x %d = %d\n", base, i, result);
        i = i + 1;
    }
}

func factorial_calculation(): void {
    print("Enter a number: ");
    let n: u8 = read();
    
    let result: u64 = 1;
    let i: u8 = 1;
    
    while (i <= n) {
        result = result * i;
        i = i + 1;
    }
    
    print("Factorial of %d is %lu\n", n, result);
}
```

## Nested Control Structures

### Nested If Statements
```aelang
func student_grade_analysis(): void {
    print("Enter student score: ");
    let score: u8 = read();
    print("Enter attendance percentage: ");
    let attendance: u8 = read();
    
    if (score >= 60) {
        print("Passing score!\n");
        if (attendance >= 75) {
            print("Good attendance!\n");
            if (score >= 90 && attendance >= 95) {
                print("Excellent performance - Honor Roll!\n");
            } else if (score >= 80) {
                print("Very good performance!\n");
            }
        } else {
            print("Warning: Low attendance may affect promotion\n");
        }
    } else {
        print("Failing score\n");
        if (attendance < 50) {
            print("Critical: Both score and attendance are poor\n");
        } else {
            print("Consider retaking exams\n");
        }
    }
}
```

### Loop with Conditionals
```aelang
func number_analysis(): void {
    let count: i32 = 0;
    let positive_count: i32 = 0;
    let negative_count: i32 = 0;
    let zero_count: i32 = 0;
    
    print("Enter 10 numbers:\n");
    
    while (count < 10) {
        print("Number %d: ", count + 1);
        let number: i32 = read();
        
        if (number > 0) {
            positive_count = positive_count + 1;
        } else if (number < 0) {
            negative_count = negative_count + 1;
        } else {
            zero_count = zero_count + 1;
        }
        
        count = count + 1;
    }
    
    print("\nResults:\n");
    print("Positive numbers: %d\n", positive_count);
    print("Negative numbers: %d\n", negative_count);
    print("Zeros: %d\n", zero_count);
}
```

## Interactive Control Flow Examples

### Menu-Driven Program
```aelang
func calculator_menu(): void {
    let choice: u8 = 1;
    
    while (choice != 0) {
        print("\n=== Calculator ===\n");
        print("1. Addition\n");
        print("2. Subtraction\n");
        print("3. Multiplication\n");
        print("4. Division\n");
        print("0. Exit\n");
        print("Enter choice: ");
        
        choice = read();
        
        if (choice >= 1 && choice <= 4) {
            print("Enter first number: ");
            let a: f64 = read();
            print("Enter second number: ");
            let b: f64 = read();
            
            if (choice == 1) {
                print("Result: %f + %f = %f\n", a, b, a + b);
            } else if (choice == 2) {
                print("Result: %f - %f = %f\n", a, b, a - b);
            } else if (choice == 3) {
                print("Result: %f * %f = %f\n", a, b, a * b);
            } else if (choice == 4) {
                if (b != 0.0) {
                    print("Result: %f / %f = %f\n", a, b, a / b);
                } else {
                    print("Error: Division by zero!\n");
                }
            }
        } else if (choice != 0) {
            print("Invalid choice! Please try again.\n");
        }
    }
    
    print("Goodbye!\n");
}
```

### Input Validation Loop
```aelang
func get_valid_age(): u8 {
    let age: u8 = 0;
    let valid: bool = false;
    
    while (!valid) {
        print("Enter your age (1-120): ");
        age = read();
        
        if (age >= 1 && age <= 120) {
            valid = true;
        } else {
            print("Invalid age! Please enter a value between 1 and 120.\n");
        }
    }
    
    return age;
}

func get_valid_grade(): char {
    let grade: char = ' ';
    let valid: bool = false;
    
    while (!valid) {
        print("Enter grade (A, B, C, D, F): ");
        grade = read();
        
        if (grade == 'A' || grade == 'B' || grade == 'C' || 
            grade == 'D' || grade == 'F') {
            valid = true;
        } else {
            print("Invalid grade! Please enter A, B, C, D, or F.\n");
        }
    }
    
    return grade;
}
```

## Architecture-Specific Control Flow

### 32-bit Optimized Loops
```aelang
// Optimized for 32-bit integer operations
func process_32bit_array(): void {
    let size: u32 = 1000;
    let sum: u32 = 0;
    let i: u32 = 0;
    
    while (i < size) {
        // Simulated array processing
        sum = sum + i;
        i = i + 1;
    }
    
    print("Sum of first %u numbers: %u\n", size, sum);
}
```

### 64-bit Extended Operations
```aelang
// Utilizing 64-bit capabilities
func large_number_processing(): void {
    let large_limit: u64 = 1000000;
    let accumulator: u64 = 0;
    let current: u64 = 1;
    
    while (current <= large_limit) {
        if ((current % 1000) == 0) {
            accumulator = accumulator + current;
        }
        current = current + 1;
    }
    
    print("Sum of multiples of 1000 up to %lu: %lu\n", large_limit, accumulator);
}
```

## Best Practices

### Condition Clarity
```aelang
// Use parentheses for complex conditions
if ((age >= 18 && age < 65) && (income > 30000 || has_savings)) {
    // Clear grouping of logical operations
}

// Use meaningful variable names
let is_eligible: bool = (age >= 18) && (income >= 25000);
if (is_eligible) {
    // More readable than complex inline condition
}
```

### Avoiding Common Pitfalls
```aelang
// Floating point comparison - avoid exact equality
let value: f32 = 0.1 + 0.2;  // May not exactly equal 0.3
// Instead of: if (value == 0.3)
let tolerance: f32 = 0.0001;
if (value >= (0.3 - tolerance) && value <= (0.3 + tolerance)) {
    // Safe floating point comparison
}

// Integer overflow awareness
let large_num: u32 = 4294967295;  // Max u32
if (large_num < 4294967295) {  // Check before increment
    large_num = large_num + 1;
} else {
    print("Warning: Integer overflow would occur\n");
}
```

### Efficient Loop Design
```aelang
// Count down when possible (may be more efficient)
func countdown_loop(): void {
    let i: u32 = 100;
    while (i > 0) {
        // Process item i
        print("Processing item %u\n", i);
        i = i - 1;
    }
}

// Early exit conditions
func find_first_even(): void {
    let found: bool = false;
    let i: u32 = 1;
    
    while (i <= 100 && !found) {
        if ((i % 2) == 0) {
            print("First even number: %u\n", i);
            found = true;  // Exit early
        }
        i = i + 1;
    }
}
```

---

*Control flow in ÆLang provides powerful decision-making and iteration capabilities while maintaining performance and readability across different architectures.*
