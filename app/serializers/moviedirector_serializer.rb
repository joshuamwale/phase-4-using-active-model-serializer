class MoviedirectorSerializer < ActiveModel::Serializer
  attributes :director

  def director
    "#{self.object.title} - #{self.object.director[0..15]}..."
  end
end
