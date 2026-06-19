<?php
if(isset($_POST["joketext"])){
    try{
        include "includes/DatabaseConnection.php";
        $imageName = "";
        if (isset($_FILES["jokeimage"]) && $_FILES["jokeimage"]["error"] === UPLOAD_ERR_OK) {
            $ext = pathinfo($_FILES["jokeimage"]["name"], PATHINFO_EXTENSION);
            $imageName = uniqid() . "." . $ext;
            move_uploaded_file($_FILES["jokeimage"]["tmp_name"], "images/" . $imageName);
        }
        $sql = "INSERT INTO joke SET joketext = :joketext, jokedate = CURDATE(), jokeimage = :jokeimage";
        $stmt = $pdo->prepare($sql);
        $stmt->bindValue(":joketext", $_POST["joketext"]);
        $stmt->bindValue(":jokeimage", $imageName);
        $stmt->execute();
        header("location: jokes.php");
    } catch (PDOException $e){
        $title = "An error has occurred";
        $output = "Database error: " . $e->getMessage();
        include "templates/layout.html.php";
    }
} else {
    $title = "Add a new joke";
    ob_start();
    include "templates/addjoke.html.php";
    $output = ob_get_clean();
    include "templates/layout.html.php";
}
