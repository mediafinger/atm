# ATM by Eric Anderson for evaluation
class Atm
  def initialize(filename = 'balance.txt')
    @filename = filename
  end

  def run
    balance = 100
    if File.exist?(@filename)
      @account = File.open("#{@filename}", 'r+')
      balance = @account.to_a.last.to_f
    end
    menu(balance)
  end

  def menu(balance)
    while !menu_display && (selection = gets.chomp.to_s.downcase) != 'q'
      case selection
      when 'd' then print_balance(balance = deposit(balance))
      when 'w' then print_balance(balance = withdraw(balance))
      when 'b' then print_balance(balance)
      when 'h' then account_history(balance)
      when 'q' then quit(balance)
      else puts 'Please select one of the valid options'
      end
    end
  end

  def menu_display
    puts "Please make one of the folwing selections\nD to Deposit money\n"\
    "W to Withdraw money\nB to Inspect Balance\nH to Account History\nQ to Quit"
  end

  def print_balance(balance)
    printf "Your balance is $%.2f\n", balance
  end

  def deposit(balance)
    puts 'Please enter the amount to be deposited'
    while (deposit = gets.to_f) < 0
      puts 'Please enter a positive amount greater than 0 to deposit'
    end
    balance + deposit
  end

  def withdraw(balance)
    puts 'Please enter the amount to be withdraw'
    while (withdraw = gets.to_f) < 0 || withdraw > balance
      puts 'Please enter a positive amount less or equal to your balance'
    end
    balance - withdraw
  end

  def account_history(balance)
    puts File.open(@filename, 'r').to_a.push("#{balance}\n").chunk { |n| n }.map(&:first)
  end

  def quit(balance)
    @account = File.new(@filename, 'w') unless File.exist?("#{@filename}")
    puts 'Thank you for your business'
    @account.write("#{balance}\n")
    @account.close
  end
end
