SELECT studentID, sName, marks, RANK() OVER (ORDER BY marks DESC) AS `rank`
FROM student;
