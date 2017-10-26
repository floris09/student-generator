class Daypair < ApplicationRecord

scope :before_today,  -> {where("date < ?", Date.today)}
scope :after_today,  -> {where("date > ?", Date.today)}
scope :today,  -> {where("date = ?", Date.today)}
end
