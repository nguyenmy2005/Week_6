<form action="editjoke.php" method="post">
    <input type="hidden" name="id" value="<?= htmlspecialchars($joke['id'], ENT_QUOTES, 'UTF-8') ?>">
    
    <label for="joketext">Joke Text:</label>
    <textarea id="joketext" name="joketext" rows="5" cols="40"><?= htmlspecialchars($joke['joketext'], ENT_QUOTES, 'UTF-8') ?></textarea>
    
    <input type="submit" value="Update Joke">
</form>