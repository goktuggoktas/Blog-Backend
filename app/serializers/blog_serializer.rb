class BlogSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :tag_list
end
