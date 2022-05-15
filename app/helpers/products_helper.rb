module ProductsHelper
  def entity_name(id)
    Entity.find(id).name.titleize
  end

  def product_image(img)
    img.present? ? img : image_path('logo.png', class: logo)
  end

  def price_for_product(price)
    number_to_currency(price, precision: 2, unit: t('currency'))
  end

  def marketplaces
    Marketplace.all.map do |marketplace|
      [marketplace.name.titleize, marketplace.id]
    end
  end
end
