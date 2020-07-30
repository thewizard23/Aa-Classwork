def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  Movie   
    .select(:id, :title)
    .joins(:actors)
    .where(actors: {name: those_actors } )
end

def golden_age
  # Find the decade with the highest average movie score.
  # 1990 -> 
  # AVG(score)
  #decade column
         
  Movie
    .select('AVG(score), (yr / 10) * 10 AS decade')
    .group('decade')
    .order('AVG(score) desc')
    .first.decade

end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery

      # movie -> join(something) -> where(not_ourselves) -> where(movie: {id: sub}) -> pluck(:name)

  sub = Movie
    .select(:id)
    .joins(:actors)
    .where(actors: {name: name})
    
    Movie
    .joins(:actors)
    .where.not(actors: {name: name})
    .where(movies: {id: sub})
    .distinct
    .pluck(:name)
     
end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
    Actor
      .select(:name)
      .left_outer_joins(:castings)
      .where(castings: {movie_id: nil})
      .count
end

def starri(whazzername)

end