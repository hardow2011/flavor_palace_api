# == Schema Information
#
# Table name: images
#
#  id                :bigint           not null, primary key
#  order             :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  product_option_id :bigint           not null
#
# Indexes
#
#  index_images_on_product_option_id  (product_option_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_option_id => product_options.id)
#

include Rails.application.routes.url_helpers

class Image < ApplicationRecord
  belongs_to :product_option
  has_one_attached :media

  attr_readonly :media_url, :small_media_url

  def as_json(options = nil)
    super(except: [:created_at, :updated_at], methods: [:media_url])
  end

  def media_url
    return url_for(self.media)
  end

  def small_media_url
    return url_for(self.media.variant(resize_to_limit: [400, 400]))
  end

  private

end
