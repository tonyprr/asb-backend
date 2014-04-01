Ext.define("Tonyprr.core.Ajax",{
    extend 		: "Ext.data.Connection",
    mixins		: {
        observable	: "Ext.util.Observable"
    },
    singleton	: true,
    
    
	constructor	: function(){
		this.addEvents({
			"sessionexpired"	: true,
			"showerror"			: true
		});
		
		this.callParent.apply(this,arguments);
		
		this.on("beforerequest",this.onBeforeRequest,this);
		this.on("requestcomplete",this.onRequestComplete,this);
		this.on("requestexception",this.onRequestError,this);
	},
	
	request : function(options) {
	        options = options || {};
	        var me = this,
	            scope = options.scope || window,
	            username = options.username || me.username,
	            password = options.password || me.password || '',
	            async,
	            requestOptions,
	            request,
	            headers,
	            xhr;
			if(options.success){
				options.onSuccessCallback = options.success;
				delete options.success;
			}
			
			if(options.failure){
				options.onFailureCallback = options.failure;
				delete options.failure;
			}
	        if (me.fireEvent('beforerequest', me, options) !== false) {

	            requestOptions = me.setOptions(options, scope);

	            if (this.isFormUpload(options) === true) {
	                this.upload(options.form, requestOptions.url, requestOptions.data, options);
	                return null;
	            }

	            // if autoabort is set, cancel the current transactions
	            if (options.autoAbort === true || me.autoAbort) {
	                me.abort();
	            }

	            // create a connection object
	            xhr = this.getXhrInstance();

	            async = options.async !== false ? (options.async || me.async) : false;

	            // open the request
	            if (username) {
	                xhr.open(requestOptions.method, requestOptions.url, async, username, password);
	            } else {
	                xhr.open(requestOptions.method, requestOptions.url, async);
	            }

	            headers = me.setupHeaders(xhr, options, requestOptions.data, requestOptions.params);

	            // create the transaction object
	            request = {
	                id: ++Ext.data.Connection.requestId,
	                xhr: xhr,
	                headers: headers,
	                options: options,
	                async: async,
	                timeout: setTimeout(function() {
	                    request.timedout = true;
	                    me.abort(request);
	                }, options.timeout || me.timeout)
	            };
	            me.requests[request.id] = request;

	            // bind our statechange listener
	            if (async) {
	                xhr.onreadystatechange = Ext.Function.bind(me.onStateChange, me, [request]);
	            }

	            // start the request!
	            xhr.send(requestOptions.data);
	            if (!async) {
	                return this.onComplete(request);
	            }
	            return request;
	        } else {
	            Ext.callback(options.callback, options.scope, [options, undefined, undefined]);
	            return null;
	        }
	},
	
	onBeforeRequest		: function(conn,options){
		if(options.el){
			options.el.mask(options.msg || "Loading...","x-mask-loading");
		}
		if(options.statusBar){
			options.statusBar.showBusy(options.msg || "Loading...");
		}
		options.method = "POST";
		options.scope = options.scope || this;
		options.params = options.params || {};
		options.params.ajax_request = true;
	},
	
	onRequestComplete 	: function(conn,response,options){
		if(options.el){
			options.el.unmask();
		}
		
		if(response.status === 200){
			var data = {success:false};
			try{
				data = Ext.decode(response.responseText);
			}catch(e){}

			if(data.success){
				if(options && options.onSuccessCallback){
					options.onSuccessCallback.call(options.scope,data,options);
				}
//				if(options.statusBar){
//					options.statusBar.setStatus({
//						text	: data.msg || "Action completed",
//						iconCls	: 'x-status-valid'
//					});
//				}
			}else{
				delete data;
				this.onRequestError(conn,response,options);
			}
		}else{
			this.onRequestError(conn,response,options);
		}
		
	},
	
	onRequestError	: function(conn,response,options){
		if(options.el){
			options.el.unmask();
		}
		
		var data;
		try{
			data = Ext.decode(response.responseText);
		}catch(e){
			response.statusText = "Unknow server response, please try again.";
		}
		
		if(data && data.msg){	
			if(data.code == 403){
				this.fireEvent("sessionexpired",data); //show login form here!!
			}
		}else{
			data = {success:false,msg:response.statusText};
			switch(response.status){
				case 0	: 	//timeout
							data.msg = "There was an error, please try it again later.";
							break;
				case 404: 	//not foud
							data.msg = "Resource not found, please resport this issue to the administrator.";
							break;
				case 403: 	//session expired
							data.msg = "Session expired, please login again.";
							this.fireEvent("sessionexpired",data); //show login form here!!
							break;
				case 401: 	//access denied
							data.msg = "Access denied, you don't have the rights to get this resource.";
							break;
				case 500: 	//system error
							data.msg = "An error ocurred in this request, please try again later";
							break;
				default	:
							data.msg = response.statusText;
							break;
			}
		}
		//show notification!
		this.fireEvent("showerror",data);
		
		if(options.statusBar){
			options.statusBar.setStatus({
				text	: data.msg || "There was an error",
				iconCls	: 'x-status-error'
			});
		}
		
		if(options && options.onFailureCallback){
			options.onFailureCallback.call(options.scope,data,options);
		}
	}
});
Tonyprr.Ajax = Tonyprr.core.Ajax;