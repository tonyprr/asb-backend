//var rowEditingContent = Ext.create('Ext.grid.plugin.RowEditing');
Ext.define('Tonyprr.mvc.view.web.WinContenido1', {
	extend 			: "Ext.Panel",
        alias                   : 'widget.winContenido1',
        itemId: 'winContenido1',
        title   : "Proyecto",
//        height: 500,
        autoHeight: true,
        autoWidth: true,
//        region : 'north',
        margin : '3 25 4 5',
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
                                items : [
                                    {
                                        xtype: 'hidden',
                                        name:'idcontent'
                                    },
                                    {
                                        xtype: 'fieldcontainer',
                                        fieldLabel: 'Descripción',
                                        layout: 'hbox',
                                        items: [
                                            {
                                                xtype:'textfield',
                                                name:'adicional1',
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
                                    {
                                        fieldLabel:'Video YouTube',
                                        anchor : '90%',
                                        name:'url',
                                        vtype: 'url' 
                                    },
                                    {
                                        fieldLabel:'Distrito',
                                        anchor : '90%',
                                        name:'adicional5',
                                        allowBlank:false 
                                    },
                                    {
                                        xtype : 'numberfield',
                                        name:'orden',
                                        minValue : 0,
                                        fieldLabel: 'Orden',
                                        anchor : '45%',
                                        allowBlank:false 
                                    },
                                    {
                                        xtype: 'hidden',
                                        name:'idTipo'
                                    },
/*                                    {
                                        xtype: 'hidden',
                                        name:'idcontcate'
                                    },

                                    {
                                        fieldLabel:'Categoria',
                                        anchor : '90%',
                                        name:'nameCate',
                                        disabled : true,
                                        allowBlank:false 
                                    },
*/                                    {
                                        xtype: 'combobox',
                                        fieldLabel: 'Categoría',
                                        anchor : '90%',
                                        itemId: 'cboCategoriaContenido1',
                                        name:'idcontcate',
                                        typeAhead: true,
                        //                readOnly : true,
                                        store: 'Tonyprr.mvc.store.web.ContentCategoria',
                                        queryMode: 'local',
                                        displayField: 'nameCate',
                                        valueField: 'idcontcate'
                                    },
                                    {
                                        xtype: 'fieldcontainer',
                                        fieldLabel: 'Foto',//(200x130)
                                        layout: 'hbox',
                                        items: [
                                            {
                                                xtype :'textfield',
                                                name :'imagen',
                                                width: 300, disabled : true
                                            },
                                            {xtype: 'splitter'},
                                            {
                                                xtype:'filefield',
                                                name:'file_image',
                                                msgTarget: 'side',
//                                                anchor : '30%',
                                                buttonConfig :{iconCls:'image_edit'},buttonText:''
                                            }
                                        ]
                                    },
                                    {
                                        xtype: 'fieldcontainer',
                                        fieldLabel: 'Mapa Ubicación',
                                        layout: 'hbox',
                                        items: [
                                            {
                                                xtype :'textfield',
                                                name :'imagen2',
                                                width: 300, disabled : true
                                            },
                                            {xtype: 'splitter'},
                                            {
                                                xtype:'filefield',
                                                name:'file_image2',
                                                msgTarget: 'side',
//                                                anchor : '30%',
                                                buttonConfig :{iconCls:'image_edit'},buttonText:''
                                            }
                                        ]
                                    },
                                    {
                                        xtype: 'fieldcontainer',
                                        fieldLabel: 'Foto Grande',
                                        layout: 'hbox',
                                        items: [
                                            {
                                                xtype:'textfield',
                                                name:'adjunto',
                                                width: 300, disabled : true
                                            },
                                            {xtype: 'splitter'},
                                            {
                                                xtype:'filefield',
                                                name:'file_adjunto',
                                                msgTarget: 'side',
                                                buttonConfig :{iconCls:'image_edit'},buttonText:''
                                            }
//                                            {xtype: 'splitter', width:15},
//                                            {
//                                                xtype: 'checkbox',
//                                                fieldLabel: 'Borrar',
//                                                labelWidth : 42,
//                                                name:'borrarAdj'
//                                            }
                                        ]
                                    }
                                ]
                            }
                            ,{
                                xtype :'panel',
                                title: 'Desc. General',
//                                itemId:'panelContenido1Language',
                                layout : 'anchor',
                                padding : '2 2 2 2', 
                                defaults: {anchor : '98%'},
                                defaultType : 'textfield',
                                items:[
                                    {
                                        xtype: 'tinymcefield',
                                        name: 'adicional2',
//                                        fieldLabel: '',
                                        labelAlign: 'top',
                                        height: 390,
                                        anchor: '100%',
                                        tinymceConfig: {
                                            theme_advanced_buttons1: 'fullscreen,|,undo,redo,|,bold,italic,underline,strikethrough,|,forecolor,backcolor,removeformat,|,justifyleft,justifycenter,justifyright,justifyfull,|,fontselect,|,code',
                                            theme_advanced_buttons2: 'fontsizeselect,|,cut,copy,paste,pastetext,pasteword,|,bullist,numlist,|,outdent,indent,|,undo,redo,|,link,unlink',
                                            theme_advanced_buttons3: '',
                                            theme_advanced_buttons4: '',
                                            skin_variant : 'gray'
                                        }
                                    }
                                ]
                            }
                            ,{
                                xtype :'panel',
                                title: 'Desc. Departamento',
                                layout : 'anchor',
                                padding : '2 2 2 2', 
                                defaults: {anchor : '98%'},
                                defaultType : 'textfield',
                                items:[
                                    {
                                        xtype: 'tinymcefield',
                                        name: 'adicional3',
//                                        fieldLabel: '',
                                        labelAlign: 'top',
                                        height: 390,
                                        anchor: '100%',
                                        tinymceConfig: {
                                            theme_advanced_buttons1: 'fullscreen,|,undo,redo,|,bold,italic,underline,strikethrough,|,forecolor,backcolor,removeformat,|,justifyleft,justifycenter,justifyright,justifyfull,|,fontselect,|,code',
                                            theme_advanced_buttons2: 'fontsizeselect,|,cut,copy,paste,pastetext,pasteword,|,bullist,numlist,|,outdent,indent,|,undo,redo,|,link,unlink',
                                            theme_advanced_buttons3: '',
                                            theme_advanced_buttons4: '',
                                            skin_variant : 'gray'
                                        }
                                    }
                                ]
                            }
                            ,{
                                xtype :'panel',
                                title: 'Acabados',
                                layout : 'anchor',
                                padding : '2 2 2 2', 
                                defaults: {anchor : '98%'},
                                defaultType : 'textfield',
                                items:[
                                    {
                                        xtype: 'tinymcefield',
                                        name: 'adicional4',
//                                        fieldLabel: 'Acabados',
                                        labelAlign: 'top',
                                        height: 390,
                                        anchor: '100%',
                                        tinymceConfig: {
                                            theme_advanced_buttons1: 'fullscreen,|,undo,redo,|,bold,italic,underline,strikethrough,|,forecolor,backcolor,removeformat,|,justifyleft,justifycenter,justifyright,justifyfull,|,fontselect,|,code',
                                            theme_advanced_buttons2: 'fontsizeselect,|,cut,copy,paste,pastetext,pasteword,|,bullist,numlist,|,outdent,indent,|,undo,redo,|,link,unlink',
                                            theme_advanced_buttons3: '',
                                            theme_advanced_buttons4: '',
                                            skin_variant : 'gray'
                                        }
                                    }
                                ]
                            }
                            ,{
                                xtype :'panel',
                                title: 'Proy. Terminados',
                                layout : 'anchor',
                                padding : '2 2 2 2', 
                                defaults: {anchor : '98%'},
                                defaultType : 'textfield',
                                items:[
                                    {
                                        xtype: 'tinymcefield',
                                        name: 'adicional8',
//                                        fieldLabel: '',
                                        labelAlign: 'top',
                                        height: 390,
                                        anchor: '100%',
                                        tinymceConfig: {
                                            theme_advanced_buttons1: 'fullscreen,|,undo,redo,|,bold,italic,underline,strikethrough,|,forecolor,backcolor,removeformat,|,justifyleft,justifycenter,justifyright,justifyfull,|,fontselect,|,code',
                                            theme_advanced_buttons2: 'fontsizeselect,|,cut,copy,paste,pastetext,pasteword,|,bullist,numlist,|,outdent,indent,|,undo,redo,|,link,unlink',
                                            theme_advanced_buttons3: '',
                                            theme_advanced_buttons4: '',
                                            skin_variant : 'gray'
                                        }
                                    }
                                ]
                            }
                            ,{
                                xtype :'panel',
                                title: 'Galeria del Imagenes',
                                itemId:'panelGaleWidget',
                                layout : 'anchor',
                                frame: false,
                                autoHeight:true
                            }
                            
                            ,{
                                xtype :'panel',
                                title: 'Planos',
                                itemId:'panelGale2Widget',
                                layout : 'anchor',
                                frame: false,
                                autoHeight:true
                            }                        ]
                    }
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
            }
        ]

	,initComponent	: function() {
//		this.buttons = this.createButtons();
		this.callParent();
                meWinContenido1 = this;//var storeContenido1Lang = 
                

                /************************************************************************************************/
                /*************************************  GALERIA DE IMAGENES  **************************************/
//                Ext.create('Tonyprr.mvc.store.web.ContentGaleriaLanguage', {storeId:'Contenido1GaleLanguage1Store'});
                meWinContenido1.down('panel[itemId="panelGaleWidget"]').add(                
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
//                                            ,{
//                                                xtype : 'grid',
//                                                itemId:'gridContenido1GaleriaLanguage',
//                                                plugins: [rowEditingContent],
//                                                height: 120,
//                                                frame:true,
//                                                columnLines : true,
//                                                autoScroll:true,
//                                                store: Ext.data.StoreManager.lookup('Contenido1GaleLanguage1Store'),
//                                                border:false,
//                                                columns : [
//                                                    {dataIndex: 'idContentLanguage',header : 'ID',width:26, hidden : true},
//                                                    {dataIndex: 'idcontgale',header : 'ID Categoria',width: 80, hidden : true},
//                                                    {dataIndex: 'idLanguage',header : 'ID Idioma',hidden : true},
//                                                    {dataIndex: 'idioma',header : 'Idioma', width : 110},
//                                                    {
//                                                        dataIndex: 'titulo',header : 'Titulo',width: 140,
//                                                        field: {
//                                                            xtype: 'textfield'
//                                                        }
//                                                    },
//                                                    {
//                                                        dataIndex: 'descripcion',header : 'Descripci&oacute;n',width: 170,
//                                                        field: {
//                                                            xtype: 'textarea'
//                                                        }
//                                                    }
//                                                ]
//                                            }
                                        ]
                                        ,buttons:[
                                            {
                                                text : 'Subir Foto',iconCls:'save',
                                                formBind: true,
                                                handler: function(btn){
                                                    
                                                    valuesForm=meWinContenido1.getComponent(0).getForm().getValues();
                                                    valuesFormFoto = meWinContenido1.down('panel[itemId="panelGaleWidget"]').getComponent(0).getForm().getValues();

                                                    if(valuesFormFoto.descripcionGale=='' || valuesFormFoto.file_foto_gale=='') {
                                                        Ext.MessageBox.alert('Alerta','Ingrese los datos de la Foto a agregar.');
                                                        return;
                                                    }
                                                    if(!Ext.isNumeric(valuesForm.idcontent)) {
                                                        Ext.MessageBox.alert('Alerta','No ha seleccionado o creado un Content para crear su Galeria.');
                                                        return;
                                                    }

                                                    meWinContenido1.down('panel[itemId="panelGaleWidget"]').getComponent(0).getForm().submit({
                                                        url : Tonyprr.BASE_URL + '/admin/web-content-galeria/save',
                                                        waitMsg:'Guardando, espere por favor...',
                                                        method:'POST',
                                                        params : {
                                                            idcontent: valuesForm.idcontent,
                                                            tipoGale: 1
                                                        },
                                                        timeout: 90000,
                                                        scope:this,
                                                        success: function(request, action) {
                                                            try {
                                                                var json = Ext.JSON.decode(action.response.responseText);
                                                                if(json.success == 1) {
                                                                    viewtemp=meWinContenido1.down('dataview[itemId="viewGaleWidget"]');
                                                                    viewtemp.getStore().load( { callback: function() {
//                                                                            viewtemp.refresh();
                                                                            newImage = Ext.fly('gale_prod_img-'+json.idcontgale);
                                                                            newImage.hide().show({duration: 500}).frame("#ffcc33", 3, { duration: 3 });//hide().show({duration: 500}).
//                                                                            winNewFoto.animateTarget = newImage; 
                                                                    }} );
                                                                    
//                                                                    storeLanguage = meWinContenido1.down('grid[itemId="gridContenido1GaleriaLanguage"]').getStore();
//                                                                    Ext.apply(storeLanguage.getProxy().extraParams, {idcontgale : json.idcontgale});
//                                                                    storeLanguage.load();
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
            
                Ext.create('Tonyprr.mvc.store.web.ContentGaleria', {storeId:'Contenido1GaleStore'});
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
                                    valuesForm=meWinContenido1.getComponent(0).getForm().getValues();
                                    if(!Ext.isNumeric(valuesForm.idcontent)) {
                                        Ext.MessageBox.alert('Alerta','No ha seleccionado o creado un Content para crear su Galeria.');
                                        return;
                                    }
                                    var viewGal = meWinContenido1.down('dataview[itemId="viewGaleWidget"]');
                                    var records = viewGal.getSelectionModel().getSelection();
                                    if(records.length == 0) {
                                        Ext.MessageBox.alert('Alerta','Debe seleccionar una foto para eliminarla.');delete viewGal;return;
                                    }
                                    Ext.MessageBox.confirm('Eliminar Foto', 'Esta seguro que desea eliminar esta foto?', 
                                         function (btn) {
                                            if (btn == 'yes')
                                                Tonyprr.Ajax.request({
                                                    url     : Tonyprr.BASE_URL + '/admin/web-content-galeria/delete',
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
                                store: Ext.data.StoreManager.lookup('Contenido1GaleStore'),
                                tpl: [
                                    '<tpl for=".">',
                                        '<div class="thumb-wrap" id="gale_prod-{idcontgale}">',
                                        '<div class="thumb"><img src="'+Tonyprr.Constants.FILES_DATA+'/content/galeria/thumb_{imagenGale}" title="{descripcionGale}" id="gale_prod_img-{idcontgale}"></div>',
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
//                                        storeLanguage = meWinContenido1.down('grid[itemId="gridContenido1GaleriaLanguage"]').getStore();
//                                        Ext.apply(storeLanguage.getProxy().extraParams, {idcontgale : model.get('idcontgale')});
//                                        storeLanguage.load();
                                        meWinContenido1.down('panel[itemId="panelGaleWidget"]').getComponent(0).loadRecord(model);
                                    }
                                }
                            }
                        )
                    }
                );          
                meWinContenido1.down('panel[itemId="panelGaleWidget"]').add(panelGaleria);
                
                
                
                
                /************************************************************************************************/
                /*************************************  GALERIA DE PLANOS  **************************************/
//                Ext.create('Tonyprr.mvc.store.web.ContentGaleriaLanguage', {storeId:'Contenido1GaleLanguage2Store'});
                meWinContenido1.down('panel[itemId="panelGale2Widget"]').add(                
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
//                                            ,{
//                                                xtype : 'grid',
//                                                itemId:'gridContenido1Galeria2Language',
//                                                plugins: [rowEditingContent2],
//                                                height: 120,
//                                                frame:true,
//                                                columnLines : true,
//                                                autoScroll:true,
//                                                store: Ext.data.StoreManager.lookup('Contenido1GaleLanguage2Store'),
//                                                border:false,
//                                                columns : [
//                                                    {dataIndex: 'idContentLanguage',header : 'ID',width:26, hidden : true},
//                                                    {dataIndex: 'idcontgale',header : 'ID Categoria',width: 80, hidden : true},
//                                                    {dataIndex: 'idLanguage',header : 'ID Idioma',hidden : true},
//                                                    {dataIndex: 'idioma',header : 'Idioma', width : 110},
//                                                    {
//                                                        dataIndex: 'titulo',header : 'Titulo',width: 140,
//                                                        field: {
//                                                            xtype: 'textfield'
//                                                        }
//                                                    },
//                                                    {
//                                                        dataIndex: 'descripcion',header : 'Descripci&oacute;n',width: 170,
//                                                        field: {
//                                                            xtype: 'textarea'
//                                                        }
//                                                    }
//                                                ]
//                                            }
                                        ]
                                        ,buttons:[
                                            {
                                                text : 'Subir Foto',iconCls:'save',
                                                formBind: true,
                                                handler: function(btn){
                                                    
                                                    valuesForm=meWinContenido1.getComponent(0).getForm().getValues();
                                                    valuesFormFoto = meWinContenido1.down('panel[itemId="panelGale2Widget"]').getComponent(0).getForm().getValues();

                                                    if(valuesFormFoto.descripcionGale=='' || valuesFormFoto.file_foto_gale=='') {
                                                        Ext.MessageBox.alert('Alerta','Ingrese los datos de la Foto a agregar.');
                                                        return;
                                                    }
                                                    if(!Ext.isNumeric(valuesForm.idcontent)) {
                                                        Ext.MessageBox.alert('Alerta','No ha seleccionado o creado un Content para crear su Galeria.');
                                                        return;
                                                    }

                                                    meWinContenido1.down('panel[itemId="panelGale2Widget"]').getComponent(0).getForm().submit({
                                                        url : Tonyprr.BASE_URL + '/admin/web-content-galeria/save',
                                                        waitMsg:'Guardando, espere por favor...',
                                                        method:'POST',
                                                        params : {
                                                            idcontent: valuesForm.idcontent,
                                                            tipoGale: 2
                                                        },
                                                        timeout: 90000,
                                                        scope:this,
                                                        success: function(request, action) {
                                                            try {
                                                                var json = Ext.JSON.decode(action.response.responseText);
                                                                if(json.success == 1) {
                                                                    viewtemp=meWinContenido1.down('dataview[itemId="viewGale2Widget"]');
                                                                    viewtemp.getStore().load( { callback: function() {
//                                                                            viewtemp.refresh();
                                                                            newImage = Ext.fly('gale_prod_img-'+json.idcontgale);
                                                                            newImage.hide().show({duration: 500}).frame("#ffcc33", 3, { duration: 3 });//hide().show({duration: 500}).
//                                                                            winNewFoto.animateTarget = newImage; 
                                                                    }} );
                                                                    
//                                                                    storeLanguage = meWinContenido1.down('grid[itemId="gridContenido1Galeria2Language"]').getStore();
//                                                                    Ext.apply(storeLanguage.getProxy().extraParams, {idcontgale : json.idcontgale});
//                                                                    storeLanguage.load();
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
            
                Ext.create('Tonyprr.mvc.store.web.ContentGaleria', {storeId:'Contenido1Gale2Store'});
                panelGaleria2 = Ext.create('Ext.Panel',
                    {
                        itemId:'formGale2Widget',
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
                                    valuesForm=meWinContenido1.getComponent(0).getForm().getValues();
                                    if(!Ext.isNumeric(valuesForm.idcontent)) {
                                        Ext.MessageBox.alert('Alerta','No ha seleccionado o creado un Content para crear su Galeria.');
                                        return;
                                    }
                                    var viewGal = meWinContenido1.down('dataview[itemId="viewGaleWidget"]');
                                    var records = viewGal.getSelectionModel().getSelection();
                                    if(records.length == 0) {
                                        Ext.MessageBox.alert('Alerta','Debe seleccionar una foto para eliminarla.');delete viewGal;return;
                                    }
                                    Ext.MessageBox.confirm('Eliminar Foto', 'Esta seguro que desea eliminar esta foto?', 
                                         function (btn) {
                                            if (btn == 'yes')
                                                Tonyprr.Ajax.request({
                                                    url     : Tonyprr.BASE_URL + '/admin/web-content-galeria/delete',
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
                                itemId:'viewGale2Widget',
                                baseCls: 'data-view-gale',
                                store: Ext.data.StoreManager.lookup('Contenido1Gale2Store'),
                                tpl: [
                                    '<tpl for=".">',
                                        '<div class="thumb-wrap" id="gale_prod-{idcontgale}">',
                                        '<div class="thumb"><img src="'+Tonyprr.Constants.FILES_DATA+'/content/galeria/thumb_{imagenGale}" title="{descripcionGale}" id="gale_prod_img-{idcontgale}"></div>',
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
//                                        storeLanguage = meWinContenido1.down('grid[itemId="gridContenido1Galeria2Language"]').getStore();
//                                        Ext.apply(storeLanguage.getProxy().extraParams, {idcontgale : model.get('idcontgale')});
//                                        storeLanguage.load();
                                        meWinContenido1.down('panel[itemId="panelGale2Widget"]').getComponent(0).loadRecord(model);
                                    }
                                }
                            }
                        )
                    }
                );          
                meWinContenido1.down('panel[itemId="panelGale2Widget"]').add(panelGaleria2);
                
                delete panelGaleria;
                delete panelGaleria2;

	}
	
	
});