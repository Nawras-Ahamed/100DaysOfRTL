# IEEE 754 ADD/SUB RTL

[source](https://www.geeksforgeeks.org/ieee-standard-754-floating-point-numbers)

The Sign of Mantissa – This is as simple as the name. 0 represents a positive number while 1 represents a negative number <br>
The Biased exponent – The exponent field needs to represent both positive and negative exponents. A bias is added to the actual exponent in order to get the stored exponent <br>
The Normalised Mantissa – The mantissa is part of a number in scientific notation or a floating-point number, consisting of its significant digits. Here we have only 2 digits, i.e. O and 1. So a normalised mantissa is one with only one 1 to the left of the decimal <br>

![image](https://github.com/Nawras-Ahamed/100DaysOfRTL/assets/50738659/806bf065-337f-4690-9a07-f66e3f66fae3)

## IEEE_754_ADD_SUB Module

### Overview
The `IEEE_754_ADD_SUB` module performs IEEE 754 floating-point addition or subtraction based on the `add_sub_select` input. It handles normalization, exponent alignment, sign determination, and exception flagging as per IEEE 754 standards.

### Inputs
- `A_in`, `B_in`: 32-bit inputs representing the operands in IEEE 754 format.
- `add_sub_select`: 1-bit input that selects between addition (1) and subtraction (0).
  
### Outputs
- `exception`: 1-bit output indicating an exception condition (exponent overflow).
- `result_o`: 32-bit output representing the result of the addition or subtraction operation.

### Internal Signals
- `operation_add_sub_select_internalwire`: Internal signal to determine whether to perform addition or subtraction based on sign bits.
- `enable`: Determines operand order based on the magnitude of `A_in` and `B_in`.
- `output_sign`: Determines the sign of the output result based on `add_sub_select`.
- `op_a`, `op_b`: 32-bit wires representing normalized operands.
- `significand_i_a`, `significand_i_b`: 24-bit wires representing significands with hidden bit for operands.
- `exp_diff`: 8-bit wire representing the difference in exponents.
- `shifted_significand_b`: 24-bit wire representing the shifted significand of operand B for subtraction.
- `adjusted_exponent_b`: 8-bit wire representing the adjusted exponent of operand B after alignment.
- `computed_significand`: 25-bit wire representing the computed significand during addition or subtraction.
- `sum_result_temp`: 31-bit wire representing the temporary sum result during addition.
- `complemented_significand_b`: 24-bit wire representing the complemented significand of operand B for subtraction.
- `adjusted_significand_b`: 25-bit wire representing the adjusted significand of operand B during subtraction.
- `difference_result_temp`: 31-bit wire representing the temporary difference result during subtraction.
- `sub_shifted_result`: 25-bit wire representing the shifted result during subtraction.
- `exp_o`: 8-bit wire representing the output exponent after normalization.

### Functional Details

#### Operand Selection and Exponent Handling
- `enable`, `op_a`, `op_b`: Determines the order of operands (`A_in` and `B_in`) based on their magnitudes.
- `exp_i`, `exp_b`: Extracts the exponents from operands `A_in` and `B_in`.
- `exception`: Sets the exception flag if either operand has an exponent of 255, indicating a special floating-point value.

#### Sign Determination
- `output_sign`: Determines the sign of the output based on `add_sub_select` and the sign bit of operand A.

#### Significand Extraction
- `significand_i_a`, `significand_i_b`: Extracts the significands from operands `A_in` and `B_in`, including the hidden bit if the exponent is non-zero.

#### Exponent Difference Calculation
- `exp_diff`: Calculates the difference in exponents between operands `A_in` and `B_in`.

#### Addition and Subtraction Logic
- **Addition**: Computes the sum of `significand_i_a` and `shifted_significand_b` if `temp` and `operation_add_sub_select_internalwire` conditions are met. Handles normalization of the sum and sets the temporary sum result (`sum_result_temp`).

- **Subtraction**: Computes the adjusted significand of operand B (`adjusted_significand_b`) and shifts it using the `Shifter` module. Calculates the difference result (`difference_result_temp`) and handles normalization.

#### Output Assignment
- `result_o`: Assigns the final result based on whether an exception condition is flagged (`exception`) and whether addition or subtraction was selected (`operation_add_sub_select_internalwire`). Combines the sign and result to form the final output.

[REFERENCE](https://github.com/sudhamshu091/32-Verilog-Mini-Projects/tree/main/Floating%20Point%20IEEE%20754%20Addition%20Subtraction)
