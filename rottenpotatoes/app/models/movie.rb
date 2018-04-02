class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.find_similar(id)
    #raise NotImplementedError  # TODO: check specs...
    m = Movie.find(id)
    Movie.where(director: m.director)
  end
end
