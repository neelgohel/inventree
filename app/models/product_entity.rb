# frozen_string_literal: true

class ProductEntity < ApplicationRecord
  belongs_to :product
  belongs_to :entity

  audited associated_with: :product

  after_commit :add_entity_to_product, on: :create

  def add_entity_to_product
    entity_name = entity.name
    updatable_hash = {}
    if Entity::NON_DELETABLE_ENTITIES.include?(entity_name)
      val = entity_name == 'price' ? value.gsub(/[^\d\.]/, '').to_i : value
      updatable_hash[entity_name] = val
      product.update(updatable_hash)
    end
  end
end
