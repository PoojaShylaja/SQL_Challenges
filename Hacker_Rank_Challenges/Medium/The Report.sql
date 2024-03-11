--The Report


SELECT concat(Students.Name,' ',Grades.Grade,' ',Students.Marks)
FROM Students
JOIN Grades ON Students.Marks BETWEEN Grades.MIN_MARK AND Grades.MAX_MARK
WHERE Students.Marks >= 70
ORDER BY Grades.Grade DESC,Students.Name ASC;
SELECT concat('NULL',' ',Grades.Grade,' ',Students.Marks)
FROM Students
JOIN Grades ON Students.Marks BETWEEN Grades.MIN_MARK AND Grades.MAX_MARK
WHERE Students.Marks <= 69
ORDER BY Grades.Grade DESC,Students.Marks ASC;
