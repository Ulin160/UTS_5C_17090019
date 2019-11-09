<?php
session_start();
if(isset($_SESSION['id'])){
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Laundry E-Sport</title>
    <?php
      include "include/header.php";
    ?>
  </head>
  <body>
    <nav class="navbar navbar-default">
      <div class="container-fluid">
        <div class="navbar-header">
      <a class="navbar-brand" href="#">Laundry E-Sport</a>
    </div>
    <ul class="nav navbar-nav">
      <?php
        include "include/list.php"
      ?>
    </ul>

    <ul class="nav navbar-nav navbar-right">
      <li><a href="logout.php"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
    </ul>
  </div>
</nav>
<div class="container">
  <h3>Data Pelanggan</h3>
  <hr>
  <div class="tombol" >
    <a href="tambahdatapelanggan.php"><button type="button" class="btn btn-success btn-md " >Tambah Data </button></a>
  </div>
  <br>
  <table id="table" class="table table-striped table-bordered table-responsive" >
    <thead>
      <tr>
        <th style="text-align: center;">No</th>
        <th>No. Identitas</th>
        <th>Nama</th>
        <th>Alamat</th>
        <th>No. Hp</th>
        <th style="text-align: center;" >Aksi</th>
      </tr>
    </thead>

    <tbody>
      <?php
        include "./include/koneksi.php";
        $i = 0 + 1;
        $sql = mysqli_query($conn, "SELECT * FROM pelanggan ORDER BY `No_Identitas`");
        while ($hasil = mysqli_fetch_array($sql)) {
     ?>
  <tr>
      <td style="text-align: center;"><?php echo $i; ?></td>
      <td><?php echo $hasil['No_Identitas']; ?></td>
      <td><?php echo $hasil['Nama']; ?></td>
      <td><?php echo $hasil['Alamat']; ?></td>
      <td><?php echo $hasil['No_Hp']; ?></td>
      <td style="text-align: center;"><a href="editdatapelanggan.php?edit=<?php echo $hasil['No_Identitas']; ?>" class="btn btn-warning">Edit</a>
      <a href="proses-hapus-pelanggan.php?hapus=<?php echo $hasil['No_Identitas']; ?>" class="btn btn-danger">Hapus</a></td>
  </tr>
  <?php
      $i++;
      }
    ?>

  </tbody>
  </table>
  <br>
  <br>
</div>

<script>
    $(document).ready(function() {
	   $('#table').DataTable();
	} );
</script>
</body>
</html>
<?php
}else{
	header("location:login/index.php");
}
