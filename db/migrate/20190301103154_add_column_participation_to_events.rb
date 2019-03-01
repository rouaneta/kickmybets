class AddColumnParticipationToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :participation, index: true
  end
end
