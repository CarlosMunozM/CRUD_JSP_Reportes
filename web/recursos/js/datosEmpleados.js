
$(document).ready(function ()
{

    listarEmpleados();
    llenarEmpresa();
    
    toastr.options = {
        "positionClass": "toast-bottom-right",
        "showMethod": "show",
        "hideMethod": "hide"
    };
    
    $('#btnAgregar').click(function () {
        insertarEmpleado($('#sltEmpresa').val(),$('#txtNombres').val(), $('#txtApellidos').val(), $('#txtCedula').val(), $('#sltGenero').val(), $('#txtCargaFamiliar').val(), $('#txtTelefono').val(), $('#txtDireccion').val(), $('#txtNivelEstudios').val());
    });

    $('#btnModificar').click(function () {
        modificarEmpleado($('#txtIdEmpleado').val(), $('#sltEmpresa').val(),$('#txtNombres').val(), $('#txtApellidos').val(), $('#txtCedula').val(), $('#sltGenero').val(), $('#txtCargaFamiliar').val(), $('#txtTelefono').val(), $('#txtDireccion').val(), $('#txtNivelEstudios').val());
    });
    
 
    $('#btnEliminar').click(function () {
        eliminarEmpleado($('#txtIdEmpleado').val());
    });
    
});

function listarEmpleados()
{
    $.ajax({
        async: true,
        type: "POST",
        data: {"accion": "listarEmpleados"},
        url: 'srvEmpleados',
        success: function (responseText)
        {
            var obj = jQuery.parseJSON(responseText);
            $('#tabla_empleados tbody').html('');
            for (var i in obj) {
                var empleado = obj[i];

                var htmlTags = '<tr>' +
                        '<th>' + empleado.empresa.nombre + '</th>' +
                        '<th>' + empleado.nombres + '</th>' +
                        '<th>' + empleado.apellidos + '</th>' +
                        '<th>' + empleado.cedula + '</th>' +
                        '<th>' + empleado.sexo + '</th>' +
                        '<th>' + empleado.carga_familiar + '</th>' +
                        '<th>' + empleado.telefono + '</th>' +
                        '<th>' + empleado.direccion + '</th>' +
                        '<th>' + empleado.nivel_estudios + '</th>' +
                        '<th><a href="javascript:empleadoSeleccionado( ' + empleado.id_empleado + ',' + empleado.empresa.id_empresa + ', \'' + empleado.empresa.nombre + '\',\'' + empleado.nombres + '\', \'' + empleado.apellidos + '\', \'' + empleado.cedula + '\', \'' + empleado.sexo + '\', \'' + empleado.carga_familiar + '\', \'' + empleado.telefono + '\', \'' + empleado.direccion + '\', \'' + empleado.nivel_estudios + '\')">Escoger</a></th>' +
                        '</tr>';
                $('#tabla_empleados tbody').append(htmlTags);
            }
            //limpiar();
        }
    });
}

 function llenarEmpresa() {
        $.ajax({
            async: true,
        type: "POST",
        data: {"accion": "listarEmpresaCombo"},
        url: 'srvEmpleados',
        success: function (responseText){
                var obj = jQuery.parseJSON(responseText);
                for (var i in obj) {
                    var empresa = obj[i];
                    $("#sltEmpresa").append('<option value="' + empresa.id_empresa + '">' + empresa.nombre + ' </option>');
                }
            }
        });
    }

function empleadoSeleccionado(idEmpleado, idEmpresa, nombreEmpresa, nombres, apellidos, cedula, genero, carga_familiar, telefono, direccion, nivel_estudios) {
    $('#txtIdEmpleado').val(idEmpleado);
    //$('#txtIdEmpresa').val(idEmpresa);
    $('#sltEmpresa').val(idEmpresa);
    $('#txtNombreEmpresa').val(nombreEmpresa);
    $('#txtNombres').val(nombres);
    $('#txtApellidos').val(apellidos);
    $('#txtCedula').val(cedula);
    $('#sltGenero').val(genero);
    $('#txtCargaFamiliar').val(carga_familiar);
    $('#txtTelefono').val(telefono);
    $('#txtDireccion').val(direccion);
    $('#txtNivelEstudios').val(nivel_estudios);
    
}

function insertarEmpleado(idEmpresa,nombres, apellidos, cedula, genero, carga_familiar, telefono, direccion, nivel_estudios) 
{
    $.ajax({
        async: true,
        type: "POST",
        data: {"accion": "insertarEmpleado",
            "idEmpresa": idEmpresa,
            "nombres": nombres,
            "apellidos": apellidos,
            "cedula": cedula,
            "genero": genero,
            "cargaFamiliar": carga_familiar,
            "telefono": telefono,
            "direccion": direccion,
            "nivelEstudios": nivel_estudios},
        url: 'srvEmpleados',
        success: function (responseText)
        {
            if (responseText == 'ok')
            {
                listarEmpleados();
                limpiar();
                toastr.success("Empleado agregado");
            } else
            {
                toastr.error("Error al agregar empleado");
            }
        }
    });
}

function modificarEmpleado(idEmpleado, idEmpresa, nombres, apellidos, cedula, genero, carga_familiar, telefono, direccion, nivel_estudios) 
{
    $.ajax({
        async: true,
        type: "POST",
        data: {"accion": "modificarEmpleado",
            "idEmpleado": idEmpleado,
            "idEmpresa": idEmpresa,
            "nombres": nombres,
            "apellidos": apellidos,
            "cedula": cedula,
            "genero": genero,
            "cargaFamiliar": carga_familiar,
            "telefono": telefono,
            "direccion": direccion,
            "nivelEstudios": nivel_estudios},
        url: 'srvEmpleados',
        success: function (responseText)
        {
            if (responseText == 'ok')
            {
                listarEmpleados();
                limpiar();
                toastr.success("Empleado modificado");
            } else
            {
                toastr.error("Error al modificar empleado");
            }
        }
    });
}

function eliminarEmpleado(idEmpleado) 
{
    $.ajax({
        async: true,
        type: "POST",
        data: {"accion": "eliminarEmpleado",
            "idEmpleado": idEmpleado},
        url: 'srvEmpleados',
        success: function (responseText)
        {
            if (responseText == 'ok')
            {
                listarEmpleados();
                limpiar();
                toastr.success("Empleado eliminado");
            } else
            {
                toastr.error("Error al eliminar empleado");
            }
        }
    });
}



function limpiar() {
    $('#txtIdEmpleado').val('');
    $('#sltEmpresa').val('');
    //$('#txtIdEmpresa').val('');
    //$('#txtNombreEmpresa').val('');
    $('#txtNombres').val('');
    $('#txtApellidos').val('');
    $('#txtCedula').val('');
    $('#sltGenero').val('');
    $('#txtCargaFamiliar').val('');
    $('#txtTelefono').val('');
    $('#txtDireccion').val('');
    $('#txtNivelEstudios').val('');
}

