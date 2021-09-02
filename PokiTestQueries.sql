--What grades are stored in the database?

--SELECT
--	Name
--FROM
--	Grade;


--What emotions may be associated with a poem?

--SELECT
--	Name
--FROM
--	Emotion;


--How many poems are in the database?

--SELECT
--	COUNT(Id) 'NumOfPoems'
--FROM
--	Poem;


--Sort authors alphabetically by name. What are the names of the top 76 authors?

--SELECT DISTINCT TOP 76
--	a.Name
--FROM Author a
--ORDER BY a.Name;


--Starting with the above query, add the grade of each of the authors.

--SELECT DISTINCT TOP 76
--	a.Name, g.Name
--FROM Author a
--JOIN
--	Grade g
--ON
--	a.GradeId = g.Id
--ORDER BY a.Name;


--Starting with the above query, add the recorded gender of each of the authors.

--SELECT DISTINCT TOP 76
--	a.Name, 
--	gn.Name 'Gender', 
--	g.Name 'Grade'
--FROM Author a
--JOIN
--	Grade g
--ON
--	a.GradeId = g.Id
--JOIN
--	Gender gn
--ON
--	a.GenderId = gn.Id
--ORDER BY a.Name;


--What is the total number of words in all poems in the database?

--SELECT
--	SUM(WordCount)
--FROM
--	Poem;


--Which poem has the fewest characters?

--SELECT
--	CharCount
--FROM
--	Poem
--WHERE
--	CharCount = (
--		SELECT
--			MIN(CharCount)
--		FROM
--			Poem);


--How many authors are in the third grade?

--SELECT
--	COUNT(DISTINCT a.Id)
--FROM
--	Author a
--JOIN
--	Grade g
--ON 
--	a.GradeId = g.Id
--WHERE
--	g.Id = 3;


--How many total authors are in the first through third grades?

--SELECT
--	COUNT(DISTINCT a.Id)
--FROM
--	Author a
--JOIN
--	Grade g
--ON 
--	a.GradeId = g.Id
--WHERE
--	g.Id = 1
--OR
--	g.Id = 2
--OR
--	g.Id = 3;


--What is the total number of poems written by fourth graders?

--SELECT
--	COUNT(p.Id)
--FROM
--	Poem p
--JOIN
--	Author a
--ON
--	p.AuthorId = a.Id
--WHERE
--	a.GradeId = 4;


--How many poems are there per grade?

--SELECT
--	COUNT(p.Id),
--	g.Name 'Grade'
--FROM
--	Poem p
--JOIN
--	Author a
--ON
--	p.AuthorId = a.Id
--JOIN
--	Grade g
--ON
--	a.GradeId = g.Id
--GROUP BY
--	g.Name;


--How many authors are in each grade? (Order your results by grade starting with 1st Grade)

--SELECT
--	g.Name 'Grade',
--	COUNT(a.Id) 'Kids in Grade'
--FROM
--	Author a
--JOIN
--	Grade g
--ON
--	a.GenderId = g.Id
--GROUP BY
--	g.Name;


--What is the title of the poem that has the most words?

--SELECT
--	p.Title,
--	p.WordCount
--FROM
--	Poem p
--WHERE
--	p.WordCount = (
--		SELECT
--			MAX(p.WordCount)
--		FROM
--			Poem p);


--Which author(s) have the most poems? (Remember authors can have the same name.)

SELECT c1.Name, c1.NumOfPoems
FROM (SELECT 
		a.Name,
		COUNT(p.Id) 'NumOfPoems'
	FROM
		Author a
	JOIN
		Poem p ON a.Id = p.AuthorId
	GROUP BY
		a.Id, a.Name) AS c1
WHERE
	c1.NumOfPoems = 
		(SELECT
			MAX(c.NumOfPoems)
		FROM
			(SELECT
				a.Name,
				COUNT(p.Id) 'NumOfPoems'
			FROM
				Author a
			JOIN
				Poem p ON a.Id = p.AuthorId
			GROUP BY
				a.Id, a.Name) as c);


--How many poems have an emotion of sadness?

--SELECT
--	p.Title
--FROM
--	Poem p
--JOIN
--	PoemEmotion pe ON p.Id = pe.PoemId
--JOIN
--	Emotion e ON pe.EmotionId = e.Id
--WHERE
--	e.Id = 3;


--How many poems are not associated with any emotion?

--SELECT
--	p.Title
--FROM
--	Poem p
--LEFT JOIN
--	PoemEmotion pe ON p.ID = pe.PoemId
--WHERE
--	pe.Id IS NULL;


--Which emotion is associated with the least number of poems?

--SELECT c1.Name, c1.NumOfPoems
--    FROM (SELECT
--			e.Name,
--			COUNT(p.Id) 'NumOfPoems'
--		FROM
--			Emotion e
--		LEFT JOIN
--			PoemEmotion pe ON e.Id = pe.EmotionId
--		LEFT JOIN
--			Poem p ON pe.PoemId = p.Id
--		GROUP BY
--			e.Name) AS c1
--            WHERE c1.NumOfPoems =
--    	(SELECT
--		MIN(c.NumOfPoems)
--	FROM
--		(SELECT
--			e.Name,
--			COUNT(p.Id) 'NumOfPoems'
--		FROM
--			Emotion e
--		LEFT JOIN
--			PoemEmotion pe ON e.Id = pe.EmotionId
--		LEFT JOIN
--			Poem p ON pe.PoemId = p.Id
--		GROUP BY
--			e.Name) as c);
		


--Which grade has the largest number of poems with an emotion of joy?

--SELECT TOP 1
--	g.Name 'Grade',
--	COUNT(e.Id) 'Joyful Poems'
--FROM
--	Grade g
--JOIN
--	Author a ON g.Id = a.GradeId
--JOIN
--	Poem p ON a.Id = p.AuthorId
--JOIN
--	PoemEmotion pe ON p.Id = pe.PoemId
--JOIN
--	Emotion e ON e.Id = pe.EmotionId
--WHERE
--	e.Id = 4
--GROUP BY
--	g.Name
--ORDER BY
--	'Joyful Poems' DESC;


--Which gender has the least number of poems with an emotion of fear?

--SELECT TOP 1
--	g.Name 'Gender',
--	COUNT(e.Id) 'Fearful Poems'
--FROM
--	Gender g
--JOIN
--	Author a ON g.Id = a.GenderId
--JOIN
--	Poem p ON a.Id = p.AuthorId
--JOIN
--	PoemEmotion pe ON p.Id = pe.PoemId
--JOIN
--	Emotion e ON e.Id = pe.EmotionId
--WHERE
--	e.Id = 4
--GROUP BY
--	g.Name
--ORDER BY
--	'Fearful Poems';
