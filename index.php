<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Input Mata Kuliah dan SKS</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffe6f2;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        h2 {
            color: #ff66b2;
            text-shadow: 2px 2px 5px rgba(255, 105, 180, 0.5);
        }

        form {
            background-color: #ffb3d9;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(255, 105, 180, 0.4);
            width: 320px;
        }

        label {
            display: block;
            margin: 10px 0;
            color: #fff;
            font-weight: bold;
        }

        select, input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border: 1px solid #ff66b2;
            border-radius: 5px;
            background: #fff;
        }

        input[type="submit"] {
            background-color: #ff66b2;
            color: white;
            cursor: pointer;
            border: none;
            transition: background-color 0.3s ease-in-out;
        }

        input[type="submit"]:hover {
            background-color: #ff3385;
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            text-decoration: none;
            color: white;
            background-color: #ff66b2;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #ff3385;
        }
    </style>
</head>
<body>

<br>
    <h2>Input Mata Kuliah dan SKS</h2>
    <form action="" method="post">
        <label for="nama">Nama Mahasiswa:</label>
        <select name="nama" required>
            <?php
            // Ambil data matkul dari database
            include 'koneksi.php';
            $result = $koneksi->query("SELECT * FROM mahasiswa");

            while ($row = $result->fetch_assoc()) {
                echo "<option value='{$row['id']}'>{$row['nama']}</option>";
            }

            $koneksi->close();
            ?>
            </select>
            <br>
            <label for="matkul">Mata Kuliah:</label>
            <select name="matkul" id="matkulSelect" required onchange="updateSks()">
                <?php
                // Ambil data matkul dari database
                include 'koneksi.php';
                $result = $koneksi->query("SELECT matkul.id, matkul.nama, matkul.id_sks 
                                            FROM matkul ");

                while ($row = $result->fetch_assoc()) {
                    echo "<option value='{$row['id']}' data-sks='{$row['id_sks']}'>{$row['nama']}</option>";
                }

                $koneksi->close();
                ?>
            </select>
            <br>
            <label for="jml_sks">Jumlah SKS:</label>
            <input type="text" name="jml_sks" id="jmlSks" readonly>

            <script>
                function updateSks() {
                    var matkulSelect = document.getElementById("matkulSelect");
                    var jmlSksInput = document.getElementById("jmlSks");

                    // Mengambil nilai SKS dari atribut data-sks option yang dipilih
                    var selectedOption = matkulSelect.options[matkulSelect.selectedIndex];
                    var sks = selectedOption.getAttribute("data-sks");

                    // Menyimpan nilai SKS ke dalam input "Jumlah SKS"
                    jmlSksInput.value = sks;
                }
            </script>

        <br>
        <input type="submit" value="Submit">
         </form>
         <br>
         <div class="button-container">
        <a href="list_data.php" class="button">Lihat Daftar Data Mahasiswa</a>
    </div>

    <?php
    // Periksa apakah formulir telah disubmit
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Koneksi ke database
        include 'koneksi.php';

        // Periksa koneksi
        if ($koneksi->connect_error) {
            die("Connection failed: " . $koneksi->connect_error);
        }

        // Ambil data dari formulir
        $nama = $_POST['nama'];
        $matkul_id = $_POST['matkul'];
        $jml_sks = $_POST['jml_sks'];

        // Simpan data ke dalam tabel mhs_mtkl
        $sql = "INSERT INTO mhs_mtkl (nama, id_mtkul, id_sks) VALUES (?, ?, ?)";
        $stmt = $koneksi->prepare($sql);
        $stmt->bind_param("sii", $nama, $matkul_id, $jml_sks);

        if ($stmt->execute()) {
            echo "<script>alert('Data berhasil disimpan.');</script>";
            header("Location: list_data.php");
            exit();
        } else {
            echo "<script>alert('Error: " . $stmt->error . "');</script>";
        }

        $stmt->close();
        $koneksi->close();
    }
    ?>
</body>
</html>