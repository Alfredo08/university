const express = require( 'express' );
const app = express();
const knex = require( 'knex' );
const bodyParser = require( 'body-parser' );
const jsonParser = bodyParser.json();

const database = knex({
    client : 'pg',
    connection : 'postgresql://alfredosalazar@localhost/university'
})

app.get( '/api/getStudentInfo', ( req, res ) => {
    /*
    SELECT s.firstname, s.lastname, c.name, g.grade
    FROM grades g, students s, courses c
    WHERE g.studentid = s.id AND c.id = g.course AND s.id = 12345

    */

    database()
        .select('s.firstname AS StudentName', 'c.name AS CourseName', 'g.grade AS Grade')
        .from('students AS s')
        .join('grades AS g',  {'g.studentid' : 's.id'})
        .join('courses AS c', {'c.id' : 'g.course'})
        .then( students => {
            return res.status(200).json(students);
        })
        .catch( error => {
            res.statusMessage = "Check your DB!";
            return res.sendStatus(500).send(error);
        });

});

app.listen( 8080, () => {
    console.log( "Your server is running in port 8080." );
});