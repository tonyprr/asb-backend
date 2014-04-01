/**
 * @class tonyprr.desktop.Notification
 * @extends Ext.Component
 * @autor Crysfel Villa
 * @date Sun Jul 17 22:52:13 CDT 2011
 *
 * Description
 *
 *
 **/

Ext.define("Tonyprr.core.Message",{
	extend		: "Ext.Component",
	config		: {
		message	: "Notificacion!",
		time	: 3700
	},
	statics			: {
		Manager: {
			notifications: [],
			el: null
		}
	},
	
	cls				: "tonyprr-notification",
	floating		: true,
	width			: 250,
	height			: 80,
	bodyPadding		: 10,
	closable		: true,
	
	corner			: "br",	//br, bl, tr, tl
	slideInFx		: "easeIn",
	slideOutFx		: 'bounceOut',
	
	data			: {message:"This is a message!"},
	tpl				: [
		'<div class="tonyprr-notification-content">',
			'{message}',
		'</div>',
		'<div class="tonyprr-notification-close"></div>',
		'<div class="tonyprr-notification-background"></div>'
	],
	renderSelectors	: {
	    closeBtn	: 'div.tonyprr-notification-close'
	},
	
	constructor: function(config) { 
		this.initConfig(config); 
		this.callParent(arguments); 
		return this; 
	},
	
	initComponent	: function() {
		var me = this, 
			size = Ext.getBody().getViewSize();
		
        
		me.renderTo= Ext.getBody();
		me.x = size.width - me.width - 15;
		me.y = 15;
		me.callParent();
		me.doClose = function ()  {
                    me.doClose = Ext.emptyFn; // dblclick can call again...
                    me.el.disableShadow();
                    me.el.fadeOut({
                        listeners: {
                            afteranimate: function () {
                                me.destroy();
                            }
                        }
                    });
                };

		setTimeout(function(){
			me.close();
		},me.getTime());
	},
	
	close	: function(){
		var me = this;
		
		me.el.remove();
	}
});