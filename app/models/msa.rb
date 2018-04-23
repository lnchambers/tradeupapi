class Msa < ApplicationRecord
  has_many :uas
  has_many :zips, through: :uas
end
