class Catalog < ApplicationRecord
  belongs_to :institution
  belongs_to :program
end
