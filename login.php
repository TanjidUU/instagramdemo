<?php
include_once 'connect.php';

// Start the session if needed
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username']);
    $password = trim($_POST['password']);

    // Prepare statement to prevent SQL injection
    $stmt = $conn->prepare("SELECT password FROM users WHERE username = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows === 1) {
        // User exists
        $stmt->bind_result($dbPassword);
        $stmt->fetch();

        // Option 1: Plaintext comparison (not secure)
        if ($password === $dbPassword) {
            header("Location: feed.php?username=" . urlencode($username));
            exit();
        }

        // Option 2: Hashed password check (secure - if passwords are hashed in DB)
        // if (password_verify($password, $dbPassword)) {
        //     header("Location: feed.php?username=" . urlencode($username));
        //     exit();
        // }
    }

    // Invalid login
    header("Location: index.php?error=1");
    exit();
} else {
    // Invalid request method
    header("Location: index.php");
    exit();
}
?>
