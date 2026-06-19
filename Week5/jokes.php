<?php
try{
    include 'includes/DatabaseConnection.php';
    $sql = 'SELECT joke.id, joke.joketext, joke.jokedate, joke.jokeimage, 
            author.name AS authorname, author.email AS authoremail,
            category.name AS categoryname
            FROM joke
            LEFT JOIN author ON joke.authorid = author.id
            LEFT JOIN category ON joke.categoryid = category.id';
    $jokes = $pdo->query($sql);
    $title = 'Joke List';

    ob_start();
    include 'templates/jokes.html.php';
    $output = ob_get_clean();
} catch (PDOException $e) {
    $title = 'An error has occured';
    $output = 'Database Error:' . $e->getMessage();
}
include 'templates/layout.html.php';