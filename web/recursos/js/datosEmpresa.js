
$(document).ready(function ()
{

    listarEmpresa();

    toastr.options = {
        "positionClass": "toast-bottom-right",
        "showMethod": "show",
        "hideMethod": "hide"
    };

    $('#btnAgregar').click(function () {
        insertarEmpresa($('#txtNombre').val(), $('#txtRazonSocial').val(), $('#txtRuc').val(), $('#txtDireccion').val(), $('#txtTelefono').val());
    });

    $('#btnModificar').click(function () {
        modificarEmpresa($('#txtIdEmpresa').val(), $('#txtNombre').val(), $('#txtRazonSocial').val(), $('#txtRuc').val(), $('#txtDireccion').val(), $('#txtTelefono').val());
    });
    
 
    $('#btnEliminar').click(function () {
        eliminarEmpresa($('#txtIdEmpresa').val());
    });

});

function listarEmpresa()
{
    $.ajax({
        async: true,
        type: "POST",
        data: {"accion": "listarEmpresas"},
        url: 'srvEmpresa',
        success: function (responseText)
        {
            var obj = jQuery.parseJSON(responseText);
            $('#tabla_empresa tbody').html('');
            for (var i in obj) {
                var empresa = obj[i];

                var htmlTags = '<tr>' +
                        //'<th>' + empresa.id_empresa + '</th>' +
                        '<th>' + empresa.nombre + '</th>' +
                        '<th>' + empresa.razon_social + '</th>' +
                        '<th>' + empresa.ruc + '</th>' +
                        '<th>' + empresa.direccion + '</th>' +
                        '<th>' + empresa.telefono + '</th>' +
                        '<th><a href="javascript:empresaSeleccionado( ' + empresa.id_empresa + ',\'' + empresa.nombre + '\', \'' + empresa.razon_social + '\',\'' + empresa.ruc + '\', \'' + empresa.direccion + '\', \'' + empresa.telefono + '\')">Escoger</a>' +
                        '<br><a href="reporteEmpleados.jsp?idEmpresa=' + empresa.id_empresa + '" target="_blank">Reporte</a></th>' +
                        '</tr>';
                $('#tabla_empresa tbody').append(htmlTags);
            }
            //limpiar();
        }
    });
}

function empresaSeleccionado(idEmpresa, nombre, razonSocial, ruc, direccion, telefono) {
    $('#txtIdEmpresa').val(idEmpresa);
    $('#txtNombre').val(nombre);
    $('#txtRazonSocial').val(razonSocial);
    $('#txtRuc').val(ruc);
    $('#txtDireccion').val(direccion);
    $('#txtTelefono').val(telefono);
}

function insertarEmpresa(nombre, razonSocial, ruc, direccion, telefono) {

    $.ajax({
        async: true,
        type: "POST",
        data: {"accion": "insertarEmpresa",
            "nombre": nombre,
            "razonSocial": razonSocial,
            "ruc": ruc,
            "direccion": direccion,
            "telefono": telefono},
        url: 'srvEmpresa',
        success: function (responseText)
        {
            if (responseText == 'ok')
            {
                listarEmpresa();
                limpiar();
                toastr.success("Empresa agregado");
            } else
            {
                toastr.error("Error al agregar empresa");
            }
        }
    });
}

function modificarEmpresa(idEmpresa, nombre, razonSocial, ruc, direccion, telefono) 
{
    $.ajax({
        async: true,
        type: "POST",
        data: {"accion": "modificarEmpresa",
            "idEmpresa": idEmpresa,
            "nombre": nombre,
            "razonSocial": razonSocial,
            "ruc": ruc,
            "direccion": direccion,
            "telefono": telefono},
        url: 'srvEmpresa',
        success: function (responseText)
        {
            if (responseText == 'ok')
            {
                listarEmpresa();
                limpiar();
                toastr.success("Empleado modificado");
            } else
            {
                toastr.error("Error al modificar empleado");
            }
        }
    });
}

function eliminarEmpresa(idEmpresa) 
{
    $.ajax({
        async: true,
        type: "POST",
        data: {"accion": "eliminarEmpresa",
            "idEmpresa": idEmpresa},
        url: 'srvEmpresa',
        success: function (responseText)
        {
            if (responseText == 'ok')
            {
                listarEmpresa();
                limpiar();
                toastr.success("Empresa eliminada");
            } else
            {
                toastr.error("Error al eliminar empresa");
            }
        }
    });
}

function limpiar() {
    $('#txtIdEmpresa').val('');
    $('#txtNombre').val('');
    $('#txtRazonSocial').val('');
    $('#txtRuc').val('');
    $('#txtDireccion').val('');
    $('#txtTelefono').val('');
}
