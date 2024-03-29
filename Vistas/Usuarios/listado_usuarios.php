<?php
include("../../Share/header.php");
?>
    <title>Usuarios</title>
    
<!-- Main content -->
<section class="content">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-lg-10 col-md-7">
                        <h4 class="text-center">Usuarios Registrados</h4>
                    </div>
                    
                    <div class="col-lg-2 col-md-2">
                        <a href="agregar_usuario.php" class="btn-success btn" ><i class="fas fa-plus"></i>Agregar</a>
                    </div>
                </div>
            </div>

            <!-- Consulta a la base de datos -->
            <?php
            include '../../Share/conexion.php';
            $conn =OpenCon();
            $sql="SELECT u.idUsuario, u.usuario, u.clave, r.rol, u.idRol FROM tblusuarios u
                    INNER JOIN tblRoles r ON u.idRol = r.idRol";
            ?>
            <div class="card-body table-responsive">
                <table class="table  table-hover table-striped ">
                    <thead class="bg-dark text-center">
                        <tr>
                            <th>Codigo</th>
                            <th>Usuario</th>
                            <th>Password</th>
                            <th>Rol</th>
                            <th>Opciones</th>
                        </tr>
                    </thead>

                    <tbody class="text-center">
                        <?php
                        foreach( $conn->query($sql) as $row){
                                echo "<tr>";
                                    echo "<td>".$row["idUsuario"]."</td>";
                                    echo "<td>".$row["usuario"]."</td>";
                                    echo "<td>*******</td>"; 
                                    echo "<td>".$row["rol"]."</td>";
                                    echo "<td>";
                                        echo "<a class='btn btn-sm btn-warning' href=\"../Usuarios/editar_usuario.php?codigo=". $row["idUsuario"]."\" ><i class='fas fa-edit'></i></a> \n";
                                        echo "<a class=\"btn btn-sm btn-danger\" href=\"./eliminar_usuario.php?codigo=". $row["idUsuario"]."\"><i class=\"far fa-trash-alt\"></i></a>";
                                    echo "</td>";
                                echo "</tr>";
                            }
                        ?>
                    </tbody>
                </table>
            
                
                <?php
                
                    CloseCon($conn);
                   
                    //VALIDACION DE ELIMINACION
                    if (isset($_GET['result'])){
                        if($_GET['result'] == 1){
                            Print"<script>
                            Swal.fire({
                              icon: 'success',
                              title: 'Hecho!',
                              text: 'Se Ha Eliminado el registro!',
                            })
                            </script>";
                        }elseif($_GET['result'] == 2){
                            Print"<script>
                            Swal.fire({
                              icon: 'error',
                              title: 'UPPS!',
                              text: 'No se puede eliminar el Usuario esta vinculado a terceros!',
                            })
                            </script>";
                        }else{
                            Print"<script>
                            Swal.fire({
                              icon: 'error',
                              title: 'OPPS!',
                              text: 'No se ha podido eliminar!',
                            })
                            </script>";
                        }
                    }
                ?>
            </div>
        </div>
        
    <?php
    //incluimos footer
    include "../../Share/footer.php";
    ?>