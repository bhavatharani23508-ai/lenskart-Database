-- RATING TABLE

SQL> CREATE TABLE Rating (
  2      Rating_ID NUMBER PRIMARY KEY,
  3      Review_ID NUMBER,
  4      Rating NUMBER(1) CHECK (Rating BETWEEN 1 AND 5),
  5      FOREIGN KEY (Review_ID) REFERENCES Review(Review_ID)
  6  );

Table created.

SQL> INSERT INTO Rating VALUES (701, 601, 5);

1 row created.

SQL> INSERT INTO Rating VALUES (702, 602, 4);

1 row created.

SQL> INSERT INTO Rating VALUES (703, 603, 5);

1 row created.

SQL> INSERT INTO Rating VALUES (704, 604, 4);

1 row created.

SQL> INSERT INTO Rating VALUES (705, 605, 5);

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM Rating;

RATING_ID REVIEW_ID RATING
--------- --------- ------
701       601       5
702       602       4
703       603       5
704       604       4
705       605       5
