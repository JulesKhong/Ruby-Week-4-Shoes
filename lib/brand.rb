class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  before_save(:uppcase_description)

  validates(:name, {:presence => true, :length => {maximum: 20}, :uniqueness => true})

  private
  define_method(:uppcase_description) do
    self.name = (name().capitalize)
  end
end
