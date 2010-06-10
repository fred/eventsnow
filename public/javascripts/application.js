// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function confirmJavascript()
{
  
  $.ajax({
    url : "/js_check", // target URL
    type: "GET"
  });
  
}

confirmJavascript();