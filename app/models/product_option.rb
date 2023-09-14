# == Schema Information
#
# Table name: product_options
#
#  id                  :bigint           not null, primary key
#  default_description :boolean
#  description         :string
#  hidden              :boolean
#  name                :string
#  price               :float
#  quantity            :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  product_id          :bigint           not null
#
# Indexes
#
#  index_product_options_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
class ProductOption < ApplicationRecord
  belongs_to :product
  before_create :assign_standard_values
  has_many :images

  validates :default_description, uniqueness: { scope: :product }

  def as_json(options = nil)
    super(except: [:created_at, :updated_at])
  end

  private

  def assign_standard_values
    self.default_description = self.default_description || false
  end

end
