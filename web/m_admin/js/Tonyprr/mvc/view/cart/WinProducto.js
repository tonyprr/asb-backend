var rowEditingProducto = Ext.create('Ext.grid.plugin.RowEditing');

Ext.define('Tonyprr.mvc.view.cart.WinProducto', {
	extend 			: "Ext.Panel",
        alias                   : 'widget.winProducto',
        itemId: 'winProducto',
        title   : "Producto",
//        height: 500,
        autoHeight: true,
        autoWidth: true,
//        region : 'north',
        margin : '3 10 4 5',
        layout: 'fit',
//        modal : true,
//        closable : false,
//        closeAction : 'hide',
        frame : true,
        items : [
            {
                xtype : 'form',
                fileUpload:true,
                monitorValid : true,
                frame : false,
                autoHeight: true,
                autoWidth: true,
                defaultType : 'textfield',
                layout              : 'anchor',
                fieldDefaults	: {
                    labelAlign	: 'left',
                    labelWidth      : 90,
                    msgTarget	: 'side',
                    anchor          : '99%'
                },
                items : [
                    {
                        xtype : 'tabpanel',
//                        autoHeight: true,
                        autoWidth: true,
                        plain:true,
                        activeTab: 0,
//                        height:235,
                        defaults:{bodyStyle:'padding:10px'},
                        items : [
                            {
                                xtype :'panel',
//                                layout : 'form',
                                layout : 'anchor',
                                defaults: {anchor : '98%'},
                                defaultType : 'textfield',
//                                border : false,
                                title : 'Informaci&oacute;n',
                                itemId:'panelInfoWidget',
                                items : [
                                    {
                                        xtype: 'hidden',
                                        name:'idproducto'
                                    },
                                    {
                                        xtype: 'fieldcontainer',
                                        fieldLabel: 'C&oacute;digo',
                                        layout: 'hbox',
                                        items: [
                                            {
                                                xtype: 'textfield',
//                                                fieldLabel: 'C&oacute;digo',
                                                name : 'codigoProducto',
                                                allowBlank:false
                                            },
                                            {
                                                xtype: 'splitter',
                                                width : 15
                                            },
                                            {
                                                xtype: 'numberfield',
                                                fieldLabel: 'Orden',
                                                labelWidth : 50,
                                                name:'orden',
                                                allowBlank:false
                                            }
                                        ]
                                    },            
                                    {
                                        xtype: 'fieldcontainer',
                                        fieldLabel: 'Nombre',
                                        layout: 'hbox',
                                        items: [
                                            {
                                                xtype:'textfield',
                                                name:'nombre_producto',
                                                width : 370
                                            },
                                            {
                                                xtype: 'splitter',
                                                width : 15
                                            },
                                            {
                                                xtype: 'checkbox',
                                                fieldLabel: 'Mostrar?',
                                                labelWidth : 50,
                                                name:'estado'
                                            }
                                        ]
                                    },            
//                                    {
//                                        xtype : 'numberfield',
//                                        name:'pesoConte',
//                                        minValue : 0,
//                                        anchor : '45%',
//                                        fieldLabel: 'Peso'
//                                    },
                                    {
                                        xtype: 'hidden',
                                        name:'idcontcate'
                                    },
                                    {
                                        fieldLabel:'Categoria',
                                        anchor : '95%',
                                        name:'nameCate',
                                        disabled : true,
                                        allowBlank:false 
                                    },
//                                    {
//                                        xtype: 'combobox',
//                                        fieldLabel: 'Marca',
//                                        anchor : '95%',
//                                        itemId: 'cboMarcaProdWinProd',
//                                        name:'idmarca',
//                                        typeAhead: true,
//                                        store: 'Tonyprr.mvc.store.cart.Marca',
//                                        queryMode: 'local',
//                                        displayField: 'nombre',
//                                        valueField: 'idmarca',
//                                        allowBlank:false
//                                    },
//                                    {
//                                        xtype: 'combobox',
//                                        fieldLabel: 'Tipo',
//                                        anchor : '95%',
//                                        itemId: 'cboTipoProdWinProd',
//                                        name:'idTipo',
//                                        typeAhead: true,
//                                        store: 'Tonyprr.mvc.store.cart.ProductoTipo',
//                                        queryMode: 'local',
//                                        displayField: 'descripcion',
//                                        valueField: 'idTipo',
//                                        allowBlank:false
//                                    },
                                    {
                                        xtype : 'numberfield',
                                        name:'precio',
                                        minValue : 0,
                                        fieldLabel: 'Precio',
                                        anchor : '45%',
                                        allowBlank:false 
                                    },
                                    {
                                        xtype : 'numberfield',
                                        name:'precio1',
                                        minValue : 0,
                                        fieldLabel: 'Precio con Chocolate Clásico',
                                        anchor : '45%'
                                    },
                                    {
                                        xtype : 'numberfield',
                                        name:'precio2',
                                        minValue : 0,
                                        fieldLabel: 'Precio con Chocolate montblanc',
                                        anchor : '45%'
                                    },
                                    {
                                        xtype : 'numberfield',
                                        name:'cantidad',
                                        minValue : 0,
                                        fieldLabel: 'Stock',
                                        anchor : '45%',
                                        readOnly : true
                                    },
                                    {
                                        xtype: 'fieldcontainer',
                                        fieldLabel: 'Foto',//(200x130)
                                        layout: 'hbox',
                                        items: [
                                            {
                                                xtype :'textfield',
                                                name :'imagen',
                                                width: 320, disabled : true
                                            },
                                            {xtype: 'splitter'},
                                            {
                                                xtype:'filefield',
                                                name:'file_image',
                                                msgTarget: 'side',
//                                                anchor : '30%',
                                                buttonConfig :{iconCls:'image_edit'},buttonText:''
                                            },
                                            {xtype: 'splitter', width:15},
                                            {
                                                xtype: 'checkbox',
                                                fieldLabel: 'Borrar',
                                                labelWidth : 42,
                                                name:'borrarImg'
                                            }
                                        ]
                                    },
                                    {
                                        xtype: 'fieldcontainer',
                                        fieldLabel: 'Adjunto',
                                        layout: 'hbox',
                                        items: [
                                            {
                                                xtype:'textfield',
                                                name:'adjunto',
                                                width: 220, disabled : true
                                            },
                                            {xtype: 'splitter'},
                                            {
                                                xtype:'filefield',
                                                name:'file_adjunto',
                                                msgTarget: 'side',
                                                buttonConfig :{iconCls:'file_pdf'},buttonText:''
                                            },
                                            {xtype: 'splitter', width:15},
                                            {
                                                xtype: 'checkbox',
                                                fieldLabel: 'Borrar',
                                                labelWidth : 42,
                                                name:'borrarAdj'
                                            }
                                        ]
                                    }
                                ]
                            }
                            
                            ,{
                                xtype :'panel',
                                title: 'Ficha',
                                itemId:'panelProdLanguage',
                                layout : 'anchor',
                                padding : '6 6 6 6', 
                                defaults: {anchor : '98%'},
                                defaultType : 'textfield',
                                items:[
                                    {
                                        xtype: 'tinymcefield',
                                        name: 'ficha',
                                        fieldLabel: 'Detalle',
                                        labelAlign: 'top',
                                        height: 290,
                                        anchor: '100%',
                                        tinymceConfig: {
                                            theme_advanced_buttons1: 'fullscreen,|,undo,redo,|,bold,italic,underline,strikethrough,|,forecolor,backcolor,removeformat,|,justifyleft,justifycenter,justifyright,justifyfull,|,fontselect,|,code',
                                            theme_advanced_buttons2: 'fontsizeselect,|,cut,copy,paste,pastetext,pasteword,|,bullist,numlist,|,outdent,indent,|,undo,redo,|,link,unlink',
                                            theme_advanced_buttons3: '',
                                            theme_advanced_buttons4: '',
                                            skin_variant : 'gray'
                                        }
                                    }

/*                                    {
                                        xtype : 'grid',
                                        itemId:'gridProdLanguage',
                                        frame:true,
                                        columnLines : true,
                                        autoScroll:true,
                                        store: 'Tonyprr.mvc.store.cart.ProductoLanguage',
                                        border:false,
                                        columns : [
                                            {
                                                xtype:'actioncolumn', 
                                                width:40,
                                                items: [
                                                    {
                                                        icon: Tonyprr.Constants.IMAGE_EDIT,
                                                        tooltip: 'Editar el Registro',
                                                        handler: function(grid, rowIndex, colIndex) {
                                                            model = grid.getStore().getAt(rowIndex);
                                                            grid.up('panel[itemId="panelProdLanguage"]').down(('form[itemId="formProdLanguage"]')).loadRecord(model);
                                                        }
                                                    }
                                                ]
                                            },
                                            {dataIndex: 'idProductoLanguage',header : 'ID',width:26, hidden : true},
                                            {dataIndex: 'idproducto',header : 'ID Categoria',width: 80, hidden : true},
                                            {dataIndex: 'idLanguage',header : 'ID Idioma',hidden : true},
                                            {dataIndex: 'idioma',header : 'Idioma', width : 180},
                                            {dataIndex: 'nombre',header : 'Nombre Producto',width: 270}
                                        ]
                                    }
                                    ,{
                                        xtype :'form',
                                        title: 'Idioma',
                                        itemId:'formProdLanguage',
                                        frame : true,
                                        fileUpload:true,
                                        url: Tonyprr.BASE_URL + '/admin/cart-producto/save-language',
                                        border : true, 
                                        defaults: {anchor : '98%', bodyStyle:'padding:7px'},
                                        defaultType : 'textfield',
                                        padding : '6 6 6 6', 
                                        items:[
                                            {
                                                xtype: 'hidden',
                                                name:'idProductoLanguage'
                                            },
                                            {
                                                xtype : 'hidden',
                                                name:'idLanguage',
                                                allowBlank:false
                                            },
                                            {
                                                fieldLabel:'Nombre',
                                                name:'nombre'
            //                                    ,allowBlank:false
                                            }
//                                            ,{
//                                                xtype : 'htmleditor',
//                                                fieldLabel : 'Intro',
//                                                height : 160,
//                                                name:'intro'
//                                            }
                                            ,{
                                                xtype: 'tinymcefield',
                                                name: 'ficha',
                                                fieldLabel: 'Detalle',
                                                labelAlign: 'top',
                                                height: 290,
                                                anchor: '100%',
                                                tinymceConfig: {
                                                    theme_advanced_buttons1: 'fullscreen,|,undo,redo,|,bold,italic,underline,strikethrough,|,forecolor,backcolor,removeformat,|,justifyleft,justifycenter,justifyright,justifyfull,|,fontselect,|,code',
                                                    theme_advanced_buttons2: 'fontsizeselect,|,cut,copy,paste,pastetext,pasteword,|,bullist,numlist,|,outdent,indent,|,undo,redo,|,link,unlink',
                                                    theme_advanced_buttons3: '',
                                                    theme_advanced_buttons4: '',
                                                    skin_variant : 'gray'
                                                }
                                            }
                                            ,{
                                                xtype:'filefield',
                                                name:'file_image_temp',
                                                hidden :  true,
                                                buttonConfig :{iconCls:'image_edit'},buttonText:''
                                            }
                                        ],
                                        tbar: [
                                            '-',
                                            {
                                                text: 'guardar idioma',
                                                formBind: true,
                                                disabled: true,
                                                iconCls : 'save'
                                            }
                                            ,'-'
                                        ]
                                    }
*/                                ]
                            }
                            ,{
                                xtype :'panel',
                                title: 'Stock del Producto',
                                itemId:'panelStockWidget',
                                layout : 'anchor',
                                frame: false,
                                autoHeight:true
                            }
                            ,{
                                xtype :'panel',
                                title: 'Galeria del Producto',
                                itemId:'panelGaleWidget',
                                layout : 'anchor',
                                frame: false,
                                autoHeight:true
                            }

                        ]
                    }
                    
                    
                    
                ]
            }
//            )
        ]
        ,buttons : [
            {
                    text	: "Guardar",
                    iconCls : 'save',
                    formBind : true,
                    scope	: this
            }
//            ,{
//                    text	: "Mostrar Lista",
//                    iconCls : 'cross',
//                    width : 130,
//                    scope : this
//            }
        ]

	,initComponent	: function() {
		this.callParent();
                meWinProducto = this;

                /************************************************************************************************/
                /*************************************  GALERIA DE IMAGENES  **************************************/
                Ext.create('Tonyprr.mvc.store.cart.ProductoGaleriaLanguage', {storeId:'ProductoGaleLanguageStore'});
                meWinProducto.down('panel[itemId="panelGaleWidget"]').add(                
                                    {
                                        xtype : 'form',
                                        fileUpload:true,
                                        frame : false,
                                        autoHeight: true,
                                        padding : '3 3 3 3',
                                        autoWidth: true,
                                        border : false,
                                        defaultType : 'textfield',
                                        layout              : 'anchor',
                                        fieldDefaults	: {
                                            labelAlign	: 'left',
                                            labelWidth      : 90,
                                            msgTarget	: 'side',
                                            anchor          : '96%'
                                        },
                                        items : [
                                            {
                                                xtype: 'hidden',
                                                name:'idcontgale'
                                            },
                                            {
                                                xtype: 'numberfield',
                                                name:'ordenGale',
                                                fieldLabel :'Orden',
                                                anchor:'33%'
                                            },
                                            {
                                                xtype:'filefield',
                                                name:'file_foto_gale',
                                                fieldLabel :'Foto (JPG)',
                                                anchor:'98%',
                                                msgTarget: 'side',
                                                regex: /^.*\.(jpg|JPG|jpeg|JPEG)$/,
                                                regexText: 'Solo imagenes jpg',
                                                buttonConfig :{iconCls:'image_edit'},buttonText:''
                                            }
                                            ,{
                                                xtype : 'grid',
                                                itemId:'gridProdGaleriaLanguage',
                                                plugins: [rowEditingProducto],
                                                height: 120,
                                                frame:true,
                                                columnLines : true,
                                                autoScroll:true,
                                                store: Ext.data.StoreManager.lookup('ProductoGaleLanguageStore'),
                                                border:false,
                                                columns : [
                                                    {dataIndex: 'idProductogaleLanguage',header : 'ID',width:26, hidden : true},
                                                    {dataIndex: 'idcontgale',header : 'ID Categoria',width: 80, hidden : true},
                                                    {dataIndex: 'idLanguage',header : 'ID Idioma',hidden : true},
                                                    {dataIndex: 'idioma',header : 'Idioma', width : 110},
                                                    {
                                                        dataIndex: 'titulo',header : 'Titulo',width: 140,
                                                        field: {
                                                            xtype: 'textfield'
                                                        }
                                                    },
                                                    {
                                                        dataIndex: 'descripcion',header : 'Descripci&oacute;n',width: 170,
                                                        field: {
                                                            xtype: 'textarea'
                                                        }
                                                    }
                                                ]
                                            }
                                        ]
                                        ,buttons:[
                                            {
                                                text : 'Subir Foto',iconCls:'save',
                                                formBind: true,
                                                handler: function(btn){
                                                    
                                                    valuesForm=meWinProducto.getComponent(0).getForm().getValues();
                                                    valuesFormFoto = meWinProducto.down('panel[itemId="panelGaleWidget"]').getComponent(0).getForm().getValues();

                                                    if(valuesFormFoto.descripcionGale=='' || valuesFormFoto.file_foto_gale=='') {
                                                        Ext.MessageBox.alert('Alerta','Ingrese los datos de la Foto a agregar.');
                                                        return;
                                                    }
                                                    if(!Ext.isNumeric(valuesForm.idproducto)) {
                                                        Ext.MessageBox.alert('Alerta','No ha seleccionado o creado un Producto para crear su Galeria.');
                                                        return;
                                                    }

                                                    meWinProducto.down('panel[itemId="panelGaleWidget"]').getComponent(0).getForm().submit({
                                                        url : Tonyprr.BASE_URL + '/admin/cart-producto-galeria/save',
                                                        waitMsg:'Guardando, espere por favor...',
                                                        method:'POST',
                                                        params : {
                                                            idproducto: valuesForm.idproducto,
                                                            tipoGale: 1
                                                        },
                                                        timeout: 90000,
                                                        scope:this,
                                                        success: function(request, action) {
                                                            try {
                                                                var json = Ext.JSON.decode(action.response.responseText);
                                                                if(json.success == 1) {
                                                                    viewtemp=meWinProducto.down('dataview[itemId="viewGaleWidget"]');
                                                                    viewtemp.getStore().load( { callback: function() {
//                                                                            viewtemp.refresh();
                                                                            newImage = Ext.fly('gale_prod_img-'+json.idcontgale);
                                                                            newImage.hide().show({duration: 500}).frame("#ffcc33", 3, { duration: 3 });//hide().show({duration: 500}).
//                                                                            winNewFoto.animateTarget = newImage; 
                                                                    }} );
                                                                    
                                                                    storeLanguage = meWinProducto.down('grid[itemId="gridProdGaleriaLanguage"]').getStore();
                                                                    Ext.apply(storeLanguage.getProxy().extraParams, {idcontgale : json.idcontgale});
                                                                    storeLanguage.load();
                                                                }
                                                                Tonyprr.App.showNotification({message:json.msg});
                                                            } catch(Exception) {
                                                                Tonyprr.core.Lib.exceptionAlert(Exception);
                                                            }
                                                        },
                                                        failure: function(request, action) {
                                                            Ext.MessageBox.alert('Error','Error en el servidor.');
                                                        }
                                                    });
                                                }
                                            }
                                        ]
                                    }
                );
            
                Ext.create('Tonyprr.mvc.store.cart.ProductoGaleria', {storeId:'ProductoGaleStore'});
                panelGaleria = Ext.create('Ext.Panel',
                    {
                        itemId:'formGaleWidget',
                        frame: false,
                        autoScroll: true,
                        height:240,
                        margin : '3 3 3 3',
                        autoWidth: true,
                        tbar: [
                            {
                                text:'Borrar',
                                iconCls:'cancel', scope: this,
                                handler: function(btn){
                                    valuesForm=meWinProducto.getComponent(0).getForm().getValues();
                                    if(!Ext.isNumeric(valuesForm.idproducto)) {
                                        Ext.MessageBox.alert('Alerta','No ha seleccionado o creado un Producto para borrar su Galeria.');
                                        return;
                                    }
                                    var viewGal = meWinProducto.down('dataview[itemId="viewGaleWidget"]');
                                    var records = viewGal.getSelectionModel().getSelection();
                                    if(records.length == 0) {
                                        Ext.MessageBox.alert('Alerta','Debe seleccionar una foto para eliminarla.');delete viewGal;return;
                                    }
                                    Ext.MessageBox.confirm('Eliminar Foto', 'Esta seguro que desea eliminar esta foto?', 
                                         function (btn) {
                                            if (btn == 'yes')
                                                Tonyprr.Ajax.request({
                                                    url     : Tonyprr.BASE_URL + '/admin/cart-producto-galeria/delete',
                                                    params	: records[0].data,
                                                    el	: this.el,
                                                    scope	: this,
                                                    success	: function(data,response) {
                                                        Tonyprr.App.showNotification({message:data.msg});
                                                        if(data.success==1) {
                                                            viewGal.getStore().load();
                                                            delete viewGal;delete records;
                                                        }
                                                    },
                                                    failure : function(data,response) {
                                                        Tonyprr.App.showNotification({message:data.msg});
                                                    }
                                                });
                                    });            
                                }
                            },'-'
                        ],
                        items: 
                            Ext.create('Ext.view.View', 
                            {
                                xtype : 'dataview',
                                itemId:'viewGaleWidget',
                                baseCls: 'data-view-gale',
                                store: Ext.data.StoreManager.lookup('ProductoGaleStore'),
                                tpl: [
                                    '<tpl for=".">',
                                        '<div class="thumb-wrap" id="gale_prod-{idcontgale}">',
                                        '<div class="thumb"><img src="'+Tonyprr.Constants.FILES_DATA_CART+'/producto/galeria/thumb_{imagenGale}" title="{descripcionGale}" id="gale_prod_img-{idcontgale}"></div>',
                                        '<span class="x-editable">{shortDescription}</span></div>',
                                    '</tpl>',
                                    '<div class="x-clear"></div>'
                                ],
                                multiSelect: true,
                                autoHeight:true,
                                trackOver: true,
                                overItemCls: 'x-item-over',
                                itemSelector: 'div.thumb-wrap',
                                emptyText: 'No hay imagenes a mostrar',
                                prepareData: function(data) {
                                    Ext.apply(data, {
                                        shortDescription: Ext.util.Format.ellipsis(data.descripcionGale, 19),
                    //                    sizeString: Ext.util.Format.fileSize(data.size),
                                        dateString: Ext.util.Format.date(data.fecharegGale, "d-m-Y H:i:s")
                                    });
                                    return data;
                                },
                                listeners: {
                                    itemdblclick : function(view, model, node, e) {
                                        idImagen = node.id;
//                                        alert(name+ '-' +idImagen);
                                        storeLanguage = meWinProducto.down('grid[itemId="gridProdGaleriaLanguage"]').getStore();
                                        Ext.apply(storeLanguage.getProxy().extraParams, {idcontgale : model.get('idcontgale')});
                                        storeLanguage.load();
                                        meWinProducto.down('panel[itemId="panelGaleWidget"]').getComponent(0).loadRecord(model);
                                    }
                                }
                            }
                        )
                    }
                );          
                meWinProducto.down('panel[itemId="panelGaleWidget"]').add(panelGaleria);
                delete panelGaleria;


                Ext.create('Tonyprr.mvc.store.cart.MovimientoStockProducto', {storeId:'storeMovimientoStock'});
                gridUIMovimientoStock = Ext.create("Ext.grid.Panel", {
                    itemId:'gridWidgetMovimientoStock',
                    frame:true,
                    columnLines : true,
                    autoScroll:true,
                    store: Ext.data.StoreManager.lookup('storeMovimientoStock'),
                    border:false,
                    tbar : [
                        '-',
                        {
                            text:'Nuevo',iconCls:'add',
                            listeners : {
                                click: function() {
                                    data = meWinProducto.getComponent(0).getForm().getValues();

                                    meWinProducto.down('form[itemId="formWidgetMovimientoStock"]').getForm().reset();
                                    meWinProducto.down('form[itemId="formWidgetMovimientoStock"]').getForm().
                                            setValues({idMovimientoStockTipo: 2, idproductostock: data.idproducto});
                                }
                            }
                        },
                         '-'
                    ],
                    columns : [
                        {dataIndex: 'idMovimientoStock',header : 'ID',width:26, sortable : false},
                        {dataIndex: 'cantidad',header : 'Cantidad',width: 80,sortable : false},
                        {dataIndex: 'idMovimientoStockTipo',header : 'ID Tipo Moov',hidden : true},
                        {dataIndex: 'movTipo_nombre',header : 'Tipo Movimiento',width: 170,sortable : false},
                        {dataIndex: 'signo',header : 'Nombre',width: 90, hidden : true},
                        {dataIndex: 'idproducto',header : 'ID Producto',width: 70,hidden : true},
//                        {dataIndex: 'producto_nombre',header : 'Producto',width: 275,sortable : true},
                        {dataIndex: 'idOrden',header : 'Pedido',width: 80,sortable : false},
        //                {dataIndex: 'iduser',header : 'Usuario',width: 100,sortable : false},
                        {dataIndex: 'fechaIngreso',header : 'Fecha Ingreso',width: 100,xtype: 'datecolumn',format:'d-m-Y'},
        //                {dataIndex: 'fechaCaducidad',header : 'Fecha de Caducidad',width: 106,xtype: 'datecolumn',format:'d-m-Y'},
                        {dataIndex: 'fechaRegistro',header : 'Fecha Registro',width: 100,xtype: 'datecolumn',format:'d-m-Y H:i:s'}
                    ],
                    bbar : Ext.create('Ext.toolbar.Paging', {
                        pageSize: 15,
                        store: Ext.data.StoreManager.lookup('storeMovimientoStock'),
                        displayInfo: true
                    })
                });


                meWinProducto.down('panel[itemId="panelStockWidget"]').add({
                    xtype : 'form',
                    itemId:'formWidgetMovimientoStock',
                    autoWidth: true,
                    margin:'0 23 12 1',
                    fileUpload:true,
                    waitMsgTarget: true,
                    frame : false,
                    autoHeight: true,
                    padding : '3 3 3 3',
                    border : false,
                    defaultType : 'textfield',
                    layout              : 'anchor',
                    fieldDefaults	: {
                        labelAlign	: 'left',
                        labelWidth      : 90,
                        msgTarget	: 'side',
                        anchor          : '96%'
                    },
                    items : [
                        {
                            xtype: 'hidden',
                            name:'idMovimientoStock'
                        },
                        {
                            xtype: 'hidden',
                            name:'idMovimientoStockTipo',
                            allowBlank:false
                        },
                        {
                            xtype: 'hidden',
                            name:'idproductostock',
                            allowBlank:false
                        },
                        {
                            xtype :'numberfield',
                            fieldLabel:'Cantidad',
                            anchor : '40%',
                            name:'cantidad',
                            allowBlank:false 
                        }
                        ,{
                            xtype:'filefield',
                            name:'file_temp_stock',
                            hidden : true
                        }
                        ,{
                            xtype :'datefield',
                            fieldLabel:'Fecha Ingreso',
                            anchor:'45%',
                            format : 'd-m-Y',
                            name:'fechaIngreso',
                            allowBlank:false
                        }
                    ]
                    ,
                    buttonsAlign:'right',
                    buttons : [
                        {
                            text:'Guardar Stock',iconCls:'save',
                            formBind: true,
//                            scope: this,
                            handler: function (btn,e) {
                                //idMovimientoStockTipo
                                data = meWinProducto.down('form[itemId="formWidgetMovimientoStock"]').getForm().getValues();
                                if (!data.idproductostock > 0) {
                                    Ext.MessageBox.alert('Alerta','No ha seleccionado un producto o aun no ha sido guardado.');
                                }
                                if (!data.cantidad > 0) {
                                    Ext.MessageBox.alert('Alerta','La cantidad tiene que ser mayor que 0.');
                                }
                                var formStockProd = meWinProducto.down('form[itemId="formWidgetMovimientoStock"]').getForm();
                                formStockProd.submit({
                                    url : Tonyprr.BASE_URL + '/admin/cart-movimiento-stock/save',
                                    waitMsg:'Guardando, espere por favor...',
                                    method:'POST',
                                    timeout: 90000,
//                                    scope:this,
                                    success: function(request, action) {
                                        try{
                                            var json = Ext.JSON.decode(action.response.responseText);
                                            if(json.success == 1) {
                                                meWinProducto.down('grid[itemId="gridWidgetMovimientoStock"]').getStore().load();
                                                formStockProd.reset();
                                                //formProd.getForm().setValues({idMovimientoStock:json.idMovimientoStock});
                                            }
                                            Tonyprr.App.showNotification({message:json.msg});
                                        } catch(Exception) {
                                            Tonyprr.core.Lib.exceptionAlert(Exception);
                                        }
                                    },
                                    failure: function(request, action) {
                                        Ext.MessageBox.alert('Error','Error en el servidor.');
                                    }
                                });
                            }
                        }
                    ]
                });

                meWinProducto.down('panel[itemId="panelStockWidget"]').add(gridUIMovimientoStock);
                delete gridUIMovimientoStock;

	}
	
	
});
