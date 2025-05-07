<?php
include_once 'connect.php';

if (isset($_POST['submit'])) {
    $username    = $_POST['user_name'];
    $description = $_POST['discription'];
    $file        = $_FILES['fileToUpload'];

    $fileName       = $file['name'];
    $fileTmpName    = $file['tmp_name'];

// Check actual MIME type
    $mimeType = mime_content_type($fileTmpName);
    $fileType = pathinfo($fileName, PATHINFO_EXTENSION);


// For debugging only:
// echo $mimeType; exit;

    $allowedMimes = ['image/jpeg', 'image/png', 'image/gif', 'video/mp4', 'video/quicktime', 'video/webm'];

    if (!in_array($mimeType, $allowedMimes)) {
    echo "Unsupported MIME type.";
    exit();
}

// Determine media type
if (str_starts_with($mimeType, 'image/')) {
    $media_type = 'image';
} elseif (str_starts_with($mimeType, 'video/')) {
    $media_type = 'video';
} else {
    echo "Invalid media type.";
    exit();
}


    // Generate a safe unique file name
    $newFileName = uniqid('', true) . '.' . $fileType;
    $targetDir = "media/";
    $targetPath = $targetDir . $newFileName;

    // Insert into database
    $query = "INSERT INTO posts (username, photo, description, media_type)
              VALUES (?, ?, ?, ?)";

    $stmt = $conn->prepare($query);
    $stmt->bind_param("ssss", $username, $targetPath, $description, $media_type);

    if ($stmt->execute()) {
        move_uploaded_file($fileTmpName, $targetPath);
        $conn->query("UPDATE users SET posts = posts + 1 WHERE username = '$username'");
        $stmt->close();
        $conn->close();
        header("Location: feed.php?username=$username");
        exit();
    } else {
        echo "Error inserting post into database.";
    }
}
?>
