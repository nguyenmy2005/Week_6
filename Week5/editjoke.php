<?php
try {
    include 'includes/DatabaseConnection.php';

    if (isset($_POST['joketext'])) {
        $sql = 'UPDATE joke SET joketext = :joketext WHERE id = :id';
        $stmt = $pdo->prepare($sql);
        $stmt->bindValue(':joketext', $_POST['joketext']);
        $stmt->bindValue(':id', $_POST['id']);
        $stmt->execute();

        header('location: jokes.php');
    } else {
        $sql = 'SELECT * FROM joke WHERE id = :id';
        $stmt = $pdo->prepare($sql);
        $stmt->bindValue(':id', $_GET['id']);
        $stmt->execute();

        $joke = $stmt->fetch();

        $title = 'Edit Joke';
        ob_start();
        include 'templates/editjoke.html.php';
        $output = ob_get_clean();
    }
} catch (PDOException $e) {
    $title = 'An error has occurred';
    $output = 'Database Error: ' . $e->getMessage();
}

include 'templates/layout.html.php';