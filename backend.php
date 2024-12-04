<?php
$host = 'localhost';
$user = 'root';
$password = '';
$dbname = 'cat_facts';

$conn = new mysqli($host, $user, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Handle requests
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);

    if (isset($data['fact']) && isset($data['length'])) {
        $fact = $data['fact'];
        $length = $data['length'];

        $stmt = $conn->prepare("INSERT INTO facts (fact, length) VALUES (?, ?)");
        $stmt->bind_param("si", $fact, $length);
        $stmt->execute();
        echo json_encode(["message" => "Fact saved"]);
    } elseif (isset($data['numeroregistros'])) {
        $numRecords = $data['numeroregistros'];

        $stmt = $conn->prepare("INSERT INTO log (numeroregistros) VALUES (?)");
        $stmt->bind_param("i", $numRecords);
        $stmt->execute();
        echo json_encode(["message" => "Log recorded"]);
    }
} elseif ($_SERVER['REQUEST_METHOD'] === 'GET') {
    if (isset($_GET['action']) && $_GET['action'] === 'logs') {
        $result = $conn->query("SELECT * FROM log ORDER BY datahora DESC");
        $logs = [];
        while ($row = $result->fetch_assoc()) {
            $logs[] = $row;
        }
        echo json_encode($logs);
    } else {
        $result = $conn->query("SELECT * FROM facts");
        $facts = [];
        while ($row = $result->fetch_assoc()) {
            $facts[] = $row;
        }
        echo json_encode($facts);
    }
}

$conn->close();
?>
