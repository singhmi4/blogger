class Article < ApplicationRecord
    has_many :comments
    has_many :taggings
    has_many :tags, through: :taggings

    def tag_list
        tags.join(", ")
      end

    def tag_list=(tags_string)
        # Split the tags_string into an array of strings with leading and trailing whitespace removed
        tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
        new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
        self.tags = new_or_found_tags
    end
    
end
