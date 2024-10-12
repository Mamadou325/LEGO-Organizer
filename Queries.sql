/* Find sets that have a word or phrase in their description */
SELECT * FROM lego_sets WHERE description IS NOT NULL AND description != '';

/* Sort by sets with the highest piece count */
SELECT * FROM lego_sets ORDER BY piecesCount DESC;

/* Show only sets that belong to a specific theme */
SELECT l.* FROM lego_sets AS l JOIN set_categories AS s ON l.categoryID = s.categoryID WHERE categoryName = 'City';

/* For the viewing of the sets, make a query that “paginates” the list, giving 4 at a time
and not repeating. */
SELECT *  FROM lego_sets ORDER BY setID LIMIT 4 OFFSET 0;



