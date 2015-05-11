class Atm
  STARTING_BALANCE = 100.0

  def initialize(filename = "balance.txt")
    @filename = filename
  end

  def run
    balance = STARTING_BALANCE

    printf "Your balance is $%.2f\n", balance
  end
end
