class Status < ApplicationRecord
    # belongs_to :order

    validates :content, inclusion: {in: %w(Pending  Progress  Delivered)}

end
