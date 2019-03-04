class UpdateBetsGains
  def initialize(resource)
    @resource = resource
  end

  def process
    return unless @resource.status == "closed"

    @resource.bets.each do |bet|
      bet.gains = calculate_gains(bet, @resource)
      Bet.skip_callback(:save, :after, :update_resource_odds)
      bet.save!
      Bet.set_callback(:save, :after, :update_resource_odds)
    end
  end

  private

  def calculate_gains(bet)
    if @resource.choice_win == 1 && bet.choice == 1
      bet.gains = bet.amount * @resource.odds_choice_one
    elsif choice_win == 2 && bet.choice == 2
      bet.gains = bet.amount * @resource.odds_choice_two
    else
      bet.gains = 0
    end
  end
end
