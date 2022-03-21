class Task < ApplicationRecord
    validates :title, presence:true
    validates :start_date, presence:true
    validates :end_date, presence:true
    validate :date_after_today
    
    def date_after_today
        unless end_date.nil?
            errors.add(:end_date, "は今日以降のものを選択してください") if end_date < Date.current
        end
    end

end