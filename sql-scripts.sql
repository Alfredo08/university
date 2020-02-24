CREATE TABLE students(
	id INTEGER NOT NULL PRIMARY KEY,
	firstname TEXT NOT NULL,
	lastname TEXT NOT NULL,
	semester INTEGER NOT NULL,
	degree TEXT NOT NULL
);


INSERT INTO students VALUES(12345, 'Daniel', 'Di Venere', 4, 'Computer Science');
INSERT INTO students VALUES(72635, 'Angel', 'Miller', 6, 'Computer Science');
INSERT INTO students VALUES(29384, 'Michael', 'Gibson', 4, 'Biology');
INSERT INTO students VALUES(27632, 'Julia', 'Waters', 2, 'Computer Science');
INSERT INTO students VALUES(55265, 'Alexzander', 'Potter', 3, 'Chemistry');

CREATE TABLE directors(
	id INTEGER NOT NULL PRIMARY KEY,
	firstname TEXT NOT NULL,
	lastname TEXT NOT NULL
);

INSERT INTO directors VALUES( 12, 'Maria', 'Danielson');
INSERT INTO directors VALUES( 90, 'Scott', 'Miller');
INSERT INTO directors VALUES( 23, 'William', 'Walcott');

CREATE TABLE teachers(
	id INTEGER NOT NULL PRIMARY KEY,
	firstname TEXT NOT NULL,
	lastname TEXT NOT NULL,
	department VARCHAR(5) NOT NULL,
	boss INTEGER,
	FOREIGN KEY(boss) REFERENCES directors(id)
);

INSERT INTO teachers VALUES(997987, 'Alfredo', 'Salazar', 'CS-01', 12);
INSERT INTO teachers VALUES(873923, 'Vincent', 'Thompson', 'BI-01', 90);
INSERT INTO teachers VALUES(318232, 'Barbara', 'Garcia', 'CH-01', 23);
INSERT INTO teachers VALUES(827382, 'Anthony', 'Williams', 'CS-01', 12);

CREATE TABLE courses(
	id VARCHAR(6) NOT NULL PRIMARY KEY,
	name TEXT NOT NULL
);

INSERT INTO courses VALUES('CS-001', 'Programming Fundamentals');
INSERT INTO courses VALUES('CS-002', 'Databases');
INSERT INTO courses VALUES('CS-003', 'Web Development Applications');
INSERT INTO courses VALUES('BI-001', 'Environmental Studies');
INSERT INTO courses VALUES('BI-002', 'Health and Nutrition');
INSERT INTO courses VALUES('CH-001', 'Chemical Reactions');


CREATE TABLE givescourse(
	teacherid INTEGER NOT NULL,
	courseid VARCHAR(6) NOT NULL,
	PRIMARY KEY (teacherid, courseid),
	FOREIGN KEY (teacherid) REFERENCES teachers(id),
	FOREIGN KEY (courseid) REFERENCES courses(id)
);

INSERT INTO givescourse VALUES(997987, 'CS-001');
INSERT INTO givescourse VALUES(997987, 'CS-002');
INSERT INTO givescourse VALUES(997987, 'CS-003');
INSERT INTO givescourse VALUES(318232, 'CH-001');
INSERT INTO givescourse VALUES(873923, 'BI-001');
INSERT INTO givescourse VALUES(873923, 'BI-002');
INSERT INTO givescourse VALUES(827382, 'CS-001');
INSERT INTO givescourse VALUES(827382, 'CS-002');

CREATE TABLE groups(
	id VARCHAR(2) NOT NULL,
	teacherid INTEGER NOT NULL,
	studentid INTEGER,
	courseid VARCHAR(6) NOT NULL, 
	PRIMARY KEY (id, teacherid, studentid, courseid),
	FOREIGN KEY (teacherid) REFERENCES teachers(id),
	FOREIGN KEY (studentid) REFERENCES students(id),
	FOREIGN KEY (courseid) REFERENCES courses(id)
);

INSERT INTO groups VALUES('D1', 997987, 12345, 'CS-002');
INSERT INTO groups VALUES('W1', 997987, 12345, 'CS-003');
INSERT INTO groups VALUES('W1', 997987, 27632, 'CS-003');
INSERT INTO groups VALUES('D1', 997987, 72635, 'CS-002');
INSERT INTO groups VALUES('D1', 997987, 27632, 'CS-002');
INSERT INTO groups VALUES('C1', 827382, 27632, 'CS-001');
INSERT INTO groups VALUES('C1', 827382, 72635, 'CS-001');
INSERT INTO groups VALUES('C2', 997987, 12345, 'CS-001');
INSERT INTO groups VALUES('W2', 997987, 12345, 'CS-003');
INSERT INTO groups VALUES('W2', 997987, 72635, 'CS-003');
INSERT INTO groups VALUES('E1', 873923, 29384, 'BI-001');
INSERT INTO groups VALUES('H1', 873923, 29384, 'BI-002');
INSERT INTO groups VALUES('R1', 318232, 55265, 'CH-001');


CREATE TABLE grades(
	grade INTEGER NOT NULL,
	course VARCHAR(6) NOT NULL,
	studentid INTEGER,
	PRIMARY KEY (grade, course, studentid),
	FOREIGN KEY (studentid) REFERENCES students(id),
	FOREIGN KEY (course) REFERENCES courses(id)
);

INSERT INTO grades VALUES(98, 'CS-002', 12345);
INSERT INTO grades VALUES(100, 'CS-003', 12345);
INSERT INTO grades VALUES(86, 'CS-003', 27632);
INSERT INTO grades VALUES(70, 'CS-002', 72635);
INSERT INTO grades VALUES(56, 'CS-002', 27632);
INSERT INTO grades VALUES(92, 'CS-001', 27632);
INSERT INTO grades VALUES(100, 'CS-001', 72635);
INSERT INTO grades VALUES(96, 'CS-001', 12345);
INSERT INTO grades VALUES(97, 'CS-003', 12345);
INSERT INTO grades VALUES(87, 'CS-003', 72635);
INSERT INTO grades VALUES(71, 'BI-001', 29384);
INSERT INTO grades VALUES(66, 'BI-002', 29384);
INSERT INTO grades VALUES(95, 'CH-001', 55265);





