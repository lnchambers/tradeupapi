class ProgramSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :institutions
end
