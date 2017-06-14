def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year
    FROM series
    INNER JOIN books
    ON books.series_id = series.id
    WHERE series.id = 1
    ORDER BY books.year;
  "
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto
    FROM characters
    ORDER BY LENGTH(motto) DESC
    LIMIT 1;
  "
end

def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species) as count
    FROM characters
    GROUP BY species
    ORDER BY count DESC
    LIMIT 1;
  "
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
    FROM authors
    JOIN series ON authors.id = series.author_id
    JOIN subgenres ON series.subgenre_id = subgenres.id;
  "
end

def select_series_title_with_most_human_characters
  "SELECT series.title
    FROM series
    JOIN characters
    ON characters.series_id = series.id
    GROUP BY characters.series_id
    ORDER BY COUNT(characters.species) DESC
    LIMIT 1;
  "
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(character_books.book_id) as count
    FROM characters
    JOIN character_books ON characters.id = character_books.character_id
    JOIN books ON character_books.book_id = books.id
    GROUP BY character_books.character_id
    ORDER BY count DESC, characters.name
  "
end
