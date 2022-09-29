class Article < ApplicationRecord
    validates_presence_of :body
    validates_presence_of :title
end
