"use strict";
$.prototype.nullChecker=x=>{
	let flag = true;
	let i = 0;
	for(i in x)
		if(x[i] ===''){
			flag = false; break;
		}
	return flag;
}
$.prototype.zeroChecker=x=>{
	let flag = false;
	let i = 0;
	for(i in x)
		if(i == 0){
			flag = true; break;
		}
	return flag;
}
$.prototype.ul=(id,parent)=>{
	return ($("<ul/>")
	.attr({id:id})
	.addClass('list-group').appendTo(parent));
}
$.prototype.li=(id,parent)=>{
	console.log("$.prototype.li"+id+parent);
	return $('<li/>').attr({id:id}).addClass('list-group-item').appendTo(parent);
}
$.prototype.a=(href,html)=>{
	console.log("$.prototype.a"+href+html);
	return $('<a/>').attr({href : href}).html(html);
}
$.prototype.div=(id,parent)=>{
	return $('<div/>').attr({id:id}).appendTo(parent);
}
$.fn.label=(html,parent)=>{
	if(parent === undefined){
		console.log('if',html,parent);
		return $('<label/>').html(html);
	}else{
		console.log('else',html,parent);
		return $('<label/>').html(html).appendTo(parent);
	}
}
$.fn.input=(id,parent)=>{
	if(parent === undefined){
		return $('<input/>').attr({id:id,type:'text'}).addClass('form-control');
	}else{
		return $('<input/>').attr({id:id,type:'text'}).addClass('form-control').appendTo(parent);
	}
}
$.fn.btn=(html,parent)=>{
	if(parent === undefined){
		return $('<button/>').addClass('btn btn-primary')
		.attr({type:'button'}).html(html);
	}else{
		return $('<button/>').addClass('btn btn-primary')
		.attr({type:'button'}).html(html).appendTo(parent);
		
	}
}