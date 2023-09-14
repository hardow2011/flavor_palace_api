# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  name       :string
#  permalink  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_products_on_permalink  (permalink) UNIQUE
#
class Product < ApplicationRecord
  before_save :generate_permalink

  attr_accessor :quantity, :price, :description, :hidden
  attr_readonly :product_options_attributes

  has_many :product_options, dependent: :destroy
  accepts_nested_attributes_for :product_options, allow_destroy: true

  def as_json(options = nil)
    super(except: [:created_at, :updated_at],
          include: { product_options_attributes:
                       { except:
                           [:created_at, :updated_at],
                         include:
                           { images:
                               { except: [:created_at, :updated_at],
                                 methods: [:media_url]
                               }
                           }
                       },
          })
  end

  def add_no_options_error
    errors.add(:product_options, 'There must be at least one product option.')
  end

  private

  def product_options_attributes
    self.product_options
  end

  def generate_permalink
    self.permalink = self.name.parameterize
  end
end
