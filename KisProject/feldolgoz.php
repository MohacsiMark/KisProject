<?php

if ($_SERVER["REQUEST_METHOD"] != "POST") {
    exit("Hibás kérés!");
}

$nev = trim($_POST["nev"] ?? "");
$loginnev = trim($_POST["loginnev"] ?? "");
$jelszo = $_POST["jelszo"] ?? "";
$szerepkor = $_POST["szerepkor"] ?? "";
$auto = isset($_POST["auto"]) ? (int)$_POST["auto"] : 0;
$pc = isset($_POST["pc"]) ? (int)$_POST["pc"] : 0;
$mobil = trim($_POST["mobil"] ?? "");
$email = trim($_POST["email"] ?? "");

$hibak = [];

if ($nev === "" || preg_match("/[0-9]/", $nev)) {
    $hibak[] = "A név hibás!";
}

if ($loginnev === "") {
    $hibak[] = "A login név nincs megadva!";
}

if ($jelszo === "") {
    $hibak[] = "A jelszó nincs megadva!";
}

if (!in_array($szerepkor, ["felhasznalo", "admin", "karbantarto"])) {
    $hibak[] = "Hibás szerepkör!";
}

if (!preg_match('/^[0-9+\-\/ ]+$/', $mobil)) {
    $hibak[] = "Hibás telefonszám!";
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $hibak[] = "Hibás email cím!";
}

if (count($hibak) > 0) {

    echo "<h1>Hibás adatok!</h1>";

    foreach ($hibak as $hiba) {
        echo "<p>$hiba</p>";
    }

    exit;
}

echo "<h1>Megadott adatok</h1>";

echo "Név: " . htmlspecialchars($nev) . "<br>";
echo "Login név: " . htmlspecialchars($loginnev) . "<br>";
echo "Szerepkör: " . htmlspecialchars($szerepkor) . "<br>";
echo "Autó: " . ($auto ? "Van" : "Nincs") . "<br>";
echo "PC: " . ($pc ? "Van" : "Nincs") . "<br>";
echo "Mobil: " . htmlspecialchars($mobil) . "<br>";
echo "Email: " . htmlspecialchars($email) . "<br>";

$conn = new mysqli(
    "localhost",
    "root",
    "",
    "kisprojekt"
);

if ($conn->connect_error) {
    die("Adatbázis kapcsolódási hiba: " . $conn->connect_error);
}

$conn->set_charset("utf8mb4");

$hash = password_hash($jelszo, PASSWORD_DEFAULT);

$stmt = $conn->prepare(
    "INSERT INTO reg
    (nev, loginnev, jelszo, szerepkor, auto, pc, mobil, email)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
);

$stmt->bind_param(
    "ssssiiss",
    $nev,
    $loginnev,
    $hash,
    $szerepkor,
    $auto,
    $pc,
    $mobil,
    $email
);

if ($stmt->execute()) {
    echo "<h2>Sikeres mentés!</h2>";
}
else {
    echo "<h2>Hiba történt a mentés során!</h2>";
}

$stmt->close();
$conn->close();

?>