class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  validates(:name, {:presence => true, :length => {maximum: 20}})
  validates(:location, {:presence => true, :length => {maximum: 20}})
  before_save(:uppcase_description)

  private
  define_method(:uppcase_description) do
    self.name = (name().capitalize)
    self.location = (location().capitalize)
  end
end
