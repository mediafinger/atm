# Exercise: ATM Simulator

## Specifications

### Read initial balance from file, or use constant
- [ ] Write a cli script that starts by reading a customer’s bank balance from a file named `balance.txt`.
- [ ] This file contains a single line with the customer’s starting balance.
- [ ] If the file does not exist, use a starting balance of 100.0, which must be a constant.

### Prompt the customer for input
- [ ] The program will then repeatedly prompt the customer to deposit money, withdraw money, inspect balance, or quit, using the letters D, W, B, and Q.
- [ ] If any other input is given, the program has to remind the customer of the available commands.
- [ ] The program must accept input in uppercase or lowercase.

### Deposit money
- [ ] For deposits, the program prompts for an amount.
- [ ] The amount must be greater than zero.
- [ ] In case of invalid input, the program must give an appropriate error message that tells the customer how to fix it.
- [ ] If the amount is valid, the program will add the deposit amount to the customer’s balance and display the new balance.

### Withdraw money
- [ ] For withdrawals, the program prompts for an amount.
- [ ] The amount must be greater than zero and less than or equal to the current balance.
- [ ] In case of invalid input, the program must give an appropriate error message that tells the customer how to fix it.
- [ ] If the amount is valid, the program will subtract the withdrawal amount from the customer’s balance and display the new balance.

### Inspect balance
- [ ] For a balance inspection, the program simply displays the current balance.

### Write balance to file
- [ ] When the customer chooses to quit, the program will write the current balance back to the balance.txt file.
- [ ] If the file does not yet exist, it will be created.
- [ ] The program will inform about a successful write or give an error message.


## Hints

To read user input from the command line, use `gets.chomp` for Strings and `gets.to_f` for numbers (with decimals).

- You could just write a procedural script to complete this task. But as you want to learn object oriented programming with Ruby, you should write a `class Atm` with several short methods.
- Name the file that contains the class `atm.rb`
- Create a second file `runner.rb` with this content:

```ruby
  load "./atm.rb"
  Atm.new.run
```

- You should now be able to run the program on the command line with: `ruby runner.rb`
- You should also be able to run the program in irb - just enter the same two lines that you find in the runner.rb file.

To be able to call `Atm.new.run` your `class Atm` needs an initializer that has no mandatory arguments and a method called `run` that executes the program.


## Bonus

Write tests to ensure your ATM is performing correctly.

For this exercise do not declare any methods as private and write tests for most of them.

To be able to test the user input parts, extract all `gets` calls into methods and stub this methods in your tests.
