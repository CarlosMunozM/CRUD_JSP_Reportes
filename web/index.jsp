<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>

        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"></link>
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

        <script src="<%=request.getContextPath()%>/recursos/librerias/jquery-3.6.0.min.js" type="text/javascript"></script>

        <script src="<%=request.getContextPath()%>/recursos/librerias/toastr/toastr.js" type="text/javascript"></script>
        <link href="<%=request.getContextPath()%>/recursos/librerias/toastr/toastr.min.css" rel="stylesheet" type="text/css"/>

        <script src="<%=request.getContextPath()%>/recursos/librerias/alertify/alertify.min.js" type="text/javascript"></script>
        <link href="<%=request.getContextPath()%>/recursos/librerias/alertify/css/alertify.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%=request.getContextPath()%>/recursos/librerias/alertify/css/themes/default.min.css" rel="stylesheet" type="text/css"/>

        <script src="<%=request.getContextPath()%>/recursos/js/datosEmpleados.js" type="text/javascript"></script>

    </head>
    <body>
        <div class="container">

            <a href="empresa.jsp" class="btn btn-secondary ">Empresa</a>
            <a href="reporteEmpleados.jsp?idEmpresa=1" target="_blank" class="btn btn-warning ">Reporte Empleados</a>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <div id="divClientes">

                        <div class="form-group">
                            <h3 class="text-center"> Empleados </h3>
                        </div>

                        <!--
                        <div class="form-group row">
                            <label class="col-form-label col-sm-3">Empresa</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="txtNombreEmpresa">
                            </div>
                        </div>
                        -->
         
                        
                        <div class="form-group row" hidden="">
                            <label class="col-form-label col-sm-3">ID Empleado</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="txtIdEmpleado">
                            </div>
                        </div>
                        
                        <div class="form-group row" >
                            <label class="col-form-label col-sm-3">Empresa</label>
                            <div class="col-sm-5">
                                <!--<input type="text" class="form-control" id="txtIdEmpresa">-->
                                 <div class="col-sm-5">
                                <select class="form-control" id="sltEmpresa">
                                    <option></option>
                                </select>
                            </div>
                            </div>
                        </div>


                        <div class="form-group row">
                            <label class="col-form-label col-sm-3">Nombres</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="txtNombres">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-3">Apellidos</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="txtApellidos">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-3">Cedula</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="txtCedula">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-3">Género</label>
                            <div class="col-sm-5">
                                <select class="form-control" id="sltGenero">
                                    <option></option>
                                    <option value="Masculino">Masculino</option>
                                    <option value="Femenino">Femenino</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-3">Carga Familiar</label>
                            <div class="col-sm-5">
                                <input type="number" class="form-control" id="txtCargaFamiliar">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-3">Teléfono</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="txtTelefono">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-3">Dirección</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="txtDireccion">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-3">Nivel de Estudios</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="txtNivelEstudios">
                            </div>
                        </div>
                        <br>
                        <button class="btn btn-success pull-right" type="button" id="btnAgregar">
                            Agregar
                        </button>
                        <button class="btn btn-info pull-right" type="button" id="btnModificar">
                            Modificar
                        </button>
                        <button class="btn btn-danger pull-right" type="button" id="btnEliminar">
                            Eliminar
                        </button>
                        <br /><br />
                        <table id="tabla_empleados" class="table table-bordered">
                            <thead style="background-color: black; color: white">
                                <tr>
                                    <th>Empresa</th>
                                    <th>Nombres</th>
                                    <th>Apellidos</th>
                                    <th>Cédula</th>
                                    <th>Sexo</th>
                                    <th>Carga Familiar</th>
                                    <th>Teléfono</th>
                                    <th>Dirección</th>
                                    <th>Nivel de Estudios</th>
                                    <th></th>
                                </tr>

                            </thead>
                            <tbody >



                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>


    </body>
    <footer>
        <center>
            Desarrollado por Carlos Muñoz
        </center>
    </footer>
</html>
