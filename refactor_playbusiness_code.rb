#Refactor using DRY (Dont Repeat Yourself)

class Investment < ApplicationRecord
  def monthly_pb_commission
    if (InvestmentRound::NO_FEE_ROUNDS.include?(investment_round_id) && banned_investments.flatten.include?(id)) ||
      (id.present? && id < 3814)
      0 
    monthly_amount = (amount.to_f / investment_round.periods).round(2)
    monthly_wallet_amount = (wallet_amount.to_f / investment_round.periods).round(2)
    
    elsif code.present?
      if investment_round.pb_player_fee.present?
          discount   = (((investment_round.pb_player_fee.to_f/100) * code.discount) / 100.to_f)
          commission = (monthly_amount - monthly_wallet_amount) * ((investment_round.pb_player_fee.to_f/100) - discount)
      else
          discount   = ((0.05 * code.discount) / 100.to_f)
          commission = (monthly_amount - monthly_wallet_amount) * (0.05 - discount)
      end
    else
      if investment_round.pb_player_fee.present?
        commission = ((monthly_amount - monthly_wallet_amount) * investment_round.pb_player_fee.to_f/100)
      else
        commission = ((monthly_amount - monthly_wallet_amount) * 0.05)
      end
    end

    commission + (commission * 0.16)
  end

  def monthly_pb_commission_discount
    if (InvestmentRound::NO_FEE_ROUNDS.include?(investment_round_id) && banned_investments.flatten.include?(id)) ||
      (id.present? && id < 3814)
      0
    elsif code.present?
      monthly_amount = (amount.to_f / investment_round.periods).round(2)

      if investment_round.pb_player_fee.present?
        discount   = (((investment_round.pb_player_fee.to_f/100) * code.discount) / 100.to_f)
       
      else
        discount   = ((0.05 * code.discount) / 100.to_f)
        #commission_discount = monthly_amount * discount
      end

      commission_discount = monthly_amount * discount
      commission_discount + (commission_discount * 0.16)
    end
  end
end
