--SELECT
--	Name
--FROM
--	Grade;

--SELECT
--	Name
--FROM
--	Emotion;

--SELECT
--	COUNT(Id) 'NumOfPoems'
--FROM
--	Poem;

--SELECT DISTINCT TOP 76
--	a.Name
--FROM Author a
--ORDER BY a.Name;

--SELECT DISTINCT TOP 76
--	a.Name, g.Name
--FROM Author a
--JOIN
--	Grade g
--ON
--	a.GradeId = g.Id
--ORDER BY a.Name;

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