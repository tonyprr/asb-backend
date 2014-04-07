Ext.define('Tonyprr.mvc.controller.web.Contenido2', {
    extend	: 'Ext.app.Controller',
    stores	: [
                    'Tonyprr.abstract.Store','Tonyprr.mvc.store.web.Content','Tonyprr.mvc.store.web.ContentLanguage'
                    ,'Tonyprr.mvc.store.web.ContentCategoriaTree','Tonyprr.mvc.store.web.ContentGaleriaLanguage',
                    'Tonyprr.mvc.store.web.ContentGaleria'
                  ],
    models	: [
                    'Tonyprr.abstract.Model','Tonyprr.mvc.model.web.Content','Tonyprr.mvc.model.web.ContentLanguage'
                    ,'Tonyprr.mvc.model.web.ContentCategoria','Tonyprr.mvc.model.web.ContentGaleriaLanguage'
                    ,'Tonyprr.mvc.model.web.ContentGaleria'
                  ],

    views	: [
                    'Tonyprr.mvc.view.web.Contenido2'
                    ,'Tonyprr.mvc.view.web.WinContenido2'
//                    ,'Tonyprr.mvc.view.web.ContentCategoriaTree'
                  ],
    refs: [
        {
            ref: 'listContenido2',
            selector: 'panel[itemId="viewListContenido2"]'
        }
        ,{
            ref: 'treeCateContenido2',
            selector: 'treepanel[itemId="treeCateContenido2"]'
        }
        ,{
            ref: 'panelRegContenido2',
            selector: 'panel[itemId="viewRegContenido2"]'
        }
        ,{
            ref: 'winContenido2',
            selector: 'panel[itemId="winContenido2"]'
        }
    ],
    init	: function(app) {
        this.callParent(null);
        this.control({
            'grid[itemId="gridContenido2"]': {
                afterrender : this.onGridAfterRender
            }
            ,'grid[itemId="gridContenido2"] button[text="Agregar Servicio"]': {
                click : this.onClickAdd
            }

            ,'treepanel[itemId="treeCateContenido2"]': {
                select : this.onSelectCategoria,
                afterrender : this.onTreeAfterRender
            }

            ,'panel[itemId="winContenido2"]': {
                afterrender : this.onWinAfterRender
            }
            ,'panel[itemId="winContenido2"] button[text="Guardar"]': {
                click : this.onClickSave
            }
            ,'panel[itemId="winContenido2"] button[text="guardar idioma"]': {
                click : this.onClickSaveLanguage
            }
        });
    },
    
    initView: function(parent) {
        var viewContenido2 = Ext.widget('viewContenido2'); 
        parent.add(viewContenido2);
        viewContenido2.setHeight(parent.getHeight());
    }
    
    ,onTreeAfterRender: function(grid, opts) {
//        storeTree = this.getListContenido2().getComponent(0).getStore();
//        Ext.apply(storeTree.getProxy().extraParams, {padre : 5});
//        storeTree.load();
    }
    ,onGridAfterRender: function(grid, opts) {
        storeContenido2 = this.getListContenido2().getComponent(0).getStore();
        Ext.apply(storeContenido2.getProxy().extraParams, {idcontcate : 12});
        storeContenido2.load();
    }
    ,onWinAfterRender: function(panel, opts) {
//        this.getCbomarcaprod().getStore().load();
    }

    ,onSelectCategoria: function(tree, model, index) {
    }

    ,onClickAdd: function(button,e) {
        try {
            idCategoria = 12;
            idDescCate = "Servicios";

            this.getWinContenido2().getComponent(0).getForm().reset();
            this.getWinContenido2().getComponent(0).getForm().setValues({idcontcate: idCategoria, nameCate:idDescCate});
            
        } catch(Exception) {
            Tonyprr.core.Lib.exceptionAlert(Exception);
        }
    }
    
    ,onClickSave: function(button,e) {
        controller = this;
        formulario = this.getWinContenido2().getComponent(0).getForm();
        if(formulario.isValid()) {
            formulario.submit({
                url : Tonyprr.BASE_URL + '/admin/web-content/save',
                waitMsg:'Guardando, espere por favor...',
                method:'POST',
                timeout: 900000,
                scope:this,
                success: function(request, action) {
                    try {
                        var json = Ext.JSON.decode(action.response.responseText);
                        if(json.success == 1) {
                            controller.getListContenido2().getComponent(0).getStore().load();
                            formulario.setValues({idcontent:json.idcontent});
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
    
    ,onClickSaveLanguage: function(button,e) {
        data = this.getWinContenido2().getComponent(0).getForm().getValues();
        if (data.ididcontent == "") {
            return;
        }
        controller = this;
        var form = this.getWinContenido2().getComponent(0).down('form').getForm();
        if (form.isValid()) {
            form.submit({
                clientValidation: true,
                params: {
                    idcontent: data.idcontent
                },
                success: function(form, action) {
                    Tonyprr.App.showNotification({message:action.result.msg});
                    controller.getWinContenido2().down('grid[itemId="gridContenido2Language"]').getStore().load();
                    controller.getListContenido2().getComponent(0).getStore().load();
                }
                ,failure: function(form, action) {
                    Ext.Msg.alert('Fallido', action.result.msg);
                }
            });
        }
    }
});