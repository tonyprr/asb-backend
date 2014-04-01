Ext.define("Tonyprr.mvc.model.cart.Orden",{
    extend		: "Tonyprr.abstract.Model",
    fields		: [
        {name:"idOrden", type:"integer"},
        {name:"tipoDocumento", type:"integer"},
        "direccionEnvio",
        "personaRecepcion",
        "direccionPago",
        {name:"subTotal", type:"float"},
        {name:"totalImpuesto", type:"float"},
        {name:"impuestoRatio", type:"float"},
        {name:"total", type:"float"},
        {name:"totalDescuento", type:"float"},
        {name:"totalFinal", type:"float"},
        "cuentaBanco",
        {name:"costoEnvio", type:"float"},
        {name:"fechaProcesado", type:"date", dateFormat:'Y-m-d H:i:s'},
        {name:"fechaEnvio", type:"date", dateFormat:'Y-m-d'},
        "horaEnvio",
        {name:"fechaModificado", type:"date", dateFormat:'Y-m-d H:i:s'},
        "codigoVoucher",
        "nroFactura",
        {name:"fechaDeposito", type:"date", dateFormat:'Y-m-d H:i:s'},
        "horaDeposito",
        "rucCliente",
        "razonSocial",
        
        {name:"idMoneda", type:"integer"},
        "signo",
        {name:"idOrdenEstado", type:"integer"},
        "nombre_estado",
        {name:"idCliente", type:"integer"},
        "nombre_cliente",
        "distritoEnvio",
        
        {name:"tipoPago", type:"integer"},
        "codigoTransaccion"
    ]
});