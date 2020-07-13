"use strict";var _typeof="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t};!function(t,e,a){var s="https://maps.monomaps.com/styles/{style}/{z}/{x}/{y}.png",o=function(s,o){var n={address:"New York, NY, USA",extraAddress:[],zoom:12,disableDirections:!1,clickEvent:"click"},r=this;e.touchevents&&(n.clickEvent=a.navigator.userAgent.match(/(iPad|iPhone|iPod)/g)?n.clickEvent+" touchstart":n.clickEvent+" tap"),this.el=s,this.$element=t(s),this.$window=t(a),this.isInTool=document.body.hasAttribute("data-istool"),this.options=t.extend({},n,o),this.markers=[],this.getModuleAddress(function(t){r.geometry="object"==("undefined"==typeof t?"undefined":_typeof(t))?t:JSON.parse(t),r.init()})};o.prototype={init:function(){if(this.isWebGlSupported=this.detectWebGl(),navigator.userAgent.match(/(iPad|iPhone|iPod|Firefox)/g)&&(this.isWebGlSupported=!1),this.isWebGlSupported){var e="https://maps.monomaps.com/styles/"+this.getStyle(t(this.el).attr("data-mapstyle"))+"/style.json";this.instance=new mapboxgl.Map({container:this.el,style:e,hash:!1,zoom:this.options.zoom,dragPan:!1,scrollZoom:!1}),this.instance.addControl(new mapboxgl.NavigationControl,"top-left"),t(".mapboxgl-ctrl-compass").css("display","none"),this.afterInit()}else this.initLeaflet()},initLeaflet:function(){var t=this;a._monoLoader.utils.waitFor(function(){return"undefined"!=typeof L},function(){t.loadLeaflet(),t.afterInit()},2e4,500)},afterInit:function(){var e=this;this.setEvents(),this.setMapCenter(),this.addMarker(this.options.address),t(this.options.extraAddress).each(function(t,a){e.addMarker(a)}),t(".mapboxgl-marker").attr("role","button"),t(".mapboxgl-marker").attr("tabindex","0")},loadLeaflet:function(){this.instance=L.map(this.el,{zoom:this.options.zoom,scrollWheelZoom:!1,dragging:!1}),this.layer=L.tileLayer(s,{attribution:'&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',style:this.getStyle(t(this.el).attr("data-mapstyle"))}).addTo(this.instance)},getStyle:function(t){switch(t){case"bw":return"mono_bw";case"bluewater":return"mono_blw";case"neutralblue":return"mono_blue";case"lightmonochrome":return"mono_chrome";default:return"mono"}},setMapCenter:function(){var t=this.options.address.replace(/\s+/g,"");if(this.geometry&&this.geometry.hasOwnProperty(t)&&this.geometry[t]!==!1){var e=this.geometry[t],a={lng:e.lon,lat:e.lat};this.instance.panTo(a)}else this.instance.panTo({lat:40.7128,lng:-74.0059})},addMarker:function(e){var s=this,o=e.replace(/\s+/g,""),n=void 0;if(this.geometry&&this.geometry.hasOwnProperty(o)&&this.geometry[o]!==!1){var r=this.geometry[o],i={lng:r.lon,lat:r.lat},d=t.extend({},r.address,{location:i.lat+","+i.lng,formatted_address:r.formatted_address,companyAddress:r.lookup}),l=s.addMarkerEvents(d);if(s.isWebGlSupported){var c=new Image;c.src=a._monoLoader.ASSETSURL+"/css/images/marker-icon-2x.png",c.style.width="25px",c.style.height="41px",c.alt=_monoLang.get("##MODULE_MAP_CURRENT_LOCATION##")+": "+e;var m=new mapboxgl.Popup({offset:[0,1.1*-parseInt(c.style.height)]}).setHTML(l.outerHTML);m._closeButton.setAttribute("aria-label","Close"),m._content.setAttribute("role","dialog"),m._content.setAttribute("aria-label",_monoLang.get("##MODULE_MAP_ADDRESS##")+": "+e),n=new mapboxgl.Marker(c,{offset:[-parseInt(c.style.width)/2,-parseInt(c.style.height)]}).setLngLat([r.lon,r.lat]).setPopup(m).addTo(s.instance)}else n=L.marker(i,{alt:_monoLang.get("##MODULE_MAP_CURRENT_LOCATION##")+": "+e}).bindPopup(l).addTo(s.instance);s.markers.push(n)}else console.warn('Address: "'+e+'" is not a valid address')},addMarkerEvents:function(e){var s=this,o=e.companyAddress,n=e.formatted_address?e.formatted_address.replace(/<(?:.|\n)*?>/gm,""):"",r=o;o.match(/[a-zA-Z]+/)&&(n=o,r=n+" "+e.city+" "+e.country_code);var i='<span class="address">'+n+"<br></span>",d=_monoLang.get("##MODULE_MAP_DIRECTIONS_LINK##")+" "+n,l='<a href="https://maps.google.com/maps?&daddr='+r+'" target="_blank" class="directions" aria-label="'+d+'" role="button">'+_monoLang.get("##MODULE_MAP_DIRECTIONS_LINK##")+"</a>",c=t('<div class="infoWindow" role="tooltip" aria-hidden="false" aria-labelledby="address"></div>');return c.append(i),s.options.disableDirections||(c.append(l),c.find("a.directions").click(function(){if(a._mtr&&!s.options.notracking){var t=s.$element.attr("data-trackingnamespace")?s.$element.attr("data-trackingnamespace")+"directions_clicked":"directions_clicked";a._mtr.track(t)}})),c[0]},setEvents:function(){var e=this,s=this.isWebGlSupported?this.instance.scrollZoom:this.instance.scrollWheelZoom,o=this.isWebGlSupported?this.instance.dragPan:this.instance.dragging;t(this.instance.getContainer()).on(this.options.clickEvent,function(n){if(o.enable(),s.enable(),n.stopPropagation(),t(".leaflet-popup-close-button")&&t(".leaflet-popup-close-button").attr("aria-label","Close"),t(".directions").length&&t(".directions").focus(),a._mtr&&!e.options.notracking){var r=e.$element.attr("data-trackingnamespace")?e.$element.attr("data-trackingnamespace")+"map_interaction":"map_interaction";a._mtr.track(r)}t("body").on(e.options.clickEvent+".osmaps",function(a){t(a.target).parents().is(e.instance.getContainer())||(o.disable(),s.disable(),t("body").off("mousedown.osmaps"))})})},setLocation:function(t){(t.address||t.extraAddress)&&(this.$element.attr("data-address",t.address||""),this.$element.attr("data-extraaddress",t.extraAddress||""),this.reinit())},reinit:function(){var e=this,a={address:this.$element.attr("data-address")&&this.$element.attr("data-address").length>0?t.trim(this.$element.attr("data-address")):"New York, NY, USA",extraAddress:this.$element.attr("data-extraaddress")?this.$element.attr("data-extraaddress").split("|"):[],zoom:this.$element.attr("data-zoom")?parseInt(this.$element.attr("data-zoom")):10,style:this.getStyle(t(this.el).attr("data-mapstyle"))};a.zoom!==this.options.zoom&&(this.options.zoom=a.zoom,this.instance.setZoom(a.zoom)),(a.address!==this.options.address||a.extraAddress.toString()!==this.options.extraAddress.toString())&&this.getModuleAddress(function(s){e.geometry="object"==("undefined"==typeof s?"undefined":_typeof(s))?s:JSON.parse(s),t(e.markers).each(function(t,a){e.isWebGlSupported?a.remove():e.instance.removeLayer(a)}),e.options.address=a.address,e.options.extraAddress=a.extraAddress,e.setMapCenter(),e.addMarker(e.options.address),t(e.options.extraAddress).each(function(t,a){e.addMarker(a)})},!0),a.style!==this.options.style&&(e.isWebGlSupported||(this.layer.options.style=a.style,this.layer.redraw()))},getModuleAddress:function(e){var a=arguments.length>1&&void 0!==arguments[1]?arguments[1]:!1,s=this.$element.parents(".osmap"),o={getGeometry:!0,mch:!0};a&&(o.addresses=[],this.$element.attr("data-address")&&(o.addresses=this.$element.attr("data-address")+"|"),this.$element.attr("data-address")&&(o.addresses+=this.$element.attr("data-extraaddress")+"|")),t.ajax({type:"GET",url:s.attr("data-url"),data:t.param(o),success:function(t){var a=Object.keys(t);a.forEach(function(e){var a=/^(\-?\d+\.\d+?),\s*(\-?\d+\.\d+?)$/.exec(t[e].lookup);if(a){var s=t[e].lookup.split(",");t[e].lat=s[0],t[e].lon=s[1]}}),"function"==typeof e&&e(t)}})},detectWebGl:function(){for(var t=document.createElement("canvas"),e=["webgl","experimental-webgl","webkit-3d","moz-webgl"],s=null,o=a.navigator.userAgent,n=0;n<e.length;n++)try{if(s=t.getContext(e[n])&&o.indexOf("MSIE ")<0&&mapboxgl.supported())break}catch(r){}return!!s}},t.fn.monoosmap=function(e){return this.each(function(){t.data(this,"monoosmap")||t.data(this,"monoosmap",new o(this,e))})}}(jQuery,Modernizr,window),window._monoOsmaps={init:function(){$(".osmap .map-container").each(function(t,e){if($(e).data("monoosmap"))return!0;var a={};$(e).attr("data-address")&&$.trim($(e).attr("data-address")).length>0&&(a.address=$.trim($(e).attr("data-address"))),$(e).attr("data-extraaddress")&&(a.extraAddress=$(e).attr("data-extraaddress").split("|")),$(e).attr("data-zoom")&&(a.zoom=parseInt($(e).attr("data-zoom"))),$(e).attr("data-mapstyle")&&(a.mapstyle=$(e).attr("data-mapstyle")),$(e).is("[data-disabledirections]")&&(a.disableDirections=!0),$(e).is("[data-notracking]")&&(a.notracking=!0),$(e).monoosmap(a)})}},window._monoOsmaps.init();