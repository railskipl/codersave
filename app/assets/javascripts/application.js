// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
  $("#signup").validate({
	errorElement:'div',
	rules: {
		
		"user[email]":{
						required:true,
						email:true,
						remote:"/users/validations/check_email"
		},
		
		"user[password]":{
						required:true,
						minlength:4,
						maxlength:20
		},
		"user[password_confirmation]":{
						required:true,
						minlength:4,
						maxlength:20,
						equalTo: "#user_password"
		}
		},
		
	messages: {
		
		"user[email]":{
						            required: "Please enter email address",
						            email: "Please enter valid email id",
												remote:"email id already exists"
						
		},
		"user[password]":{
						            required: "Please enter password",
						            minlength:jQuery.format("Please enter at least 4 characters."),
						            maxlength:jQuery.format("Can not exceed 20 characters")
		},
		
		"user[password_confirmation]":{
						            required: "Please enter password confirmation",
						            minlength:jQuery.format("Please enter at least 4 characters."),
						            maxlength:jQuery.format("Can not exceed 20 characters"),
												equalTo: "Password does not match"
		}
		
		}
	});
});


$(document).ready(function() {
  $("#signin").validate({
	errorElement:'div',
	rules: {
		
		"session[email]":{
						required:true,
						email:true
		},
		
		"session[password]":{
						required:true,
						
		}
		},
		
	messages: {
		
		"session[email]":{
						            required: "Please enter email address",
						            email: "Please enter valid email id"
						
		},
		"session[password]":{
						            required: "Please enter password",
						            password: "Please enter valid password"
		}
		}
	});
});
