UPDATE student s
JOIN (
  SELECT p.studentID, p.courseID, p.collegeID, p.preferenceNo
  FROM student_preferences p
  JOIN (
    SELECT studentID, MAX(marks) as max_marks
    FROM student
    GROUP BY studentID
  ) m ON p.studentID = m.studentID
  JOIN courses c ON p.courseID = c.courseID
  ORDER BY m.max_marks DESC, p.preferenceNo ASC
) a ON s.studentID = a.studentID
SET s.collegeAllocated = 1;
