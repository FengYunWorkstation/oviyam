<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>

        <script type="text/javascript" src="js/lib/jquery-latest.js"></script>
        <script type="text/javascript" src="js/lib/jquery-ui-latest.js"></script>
        <script type="text/javascript" src="js/lib/themeswitchertool.js"></script>
        <script type="text/javascript" src="js/lib/jaaulde.cookies.js"></script>
        <script type="text/javascript" src="js/lib/jquery.cookies.min.js"></script>
        
        <script type="text/javascript">
	        //if(navigator.platform.indexOf('iPad') != -1) {
    	    if( /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ) {
    	    	$.get("do/IOviyamContext", function(data) {
	        		var loc = window.location.toString();
    	        	loc = loc.substring(0, loc.indexOf('/', loc.lastIndexOf(':')));
        	    	window.location = loc + data;
            		//window.stop();
	   	        });
        	}
  
        	var lang = $.cookies.get( 'language' );
        	var bundleName = '';
			if (lang == null || lang.trim() == '' || lang.trim() == 'en_GB') {
    			bundleName = 'js/i18n/Bundle.js'; 
			} else {
    			bundleName = 'js/i18n/' + "Bundle_" + lang + ".js";
			}
			
			document.write('<script type="text/javascript" src="' + bundleName + '"><\/script>');
        </script>

        <link rel="stylesheet" href="css/login.css" type="text/css" />
        <link rel="stylesheet" type="text/css" href="css/jquery.ui.all.css" />


        <script type="text/javascript">
            $(document).ready(function() {
                var theme = $.cookies.get( 'theme' );
            	if(theme == null) {
                    theme = 'Dark Hive';
            	}
            	
            	var browserVersion= navigator.userAgent.match(/(opera|chrome|safari|firefox|msie)\/?\s*(\.?\d+(\.\d+)*)/i);
				var browserName = browserVersion[1].toUpperCase();
            	if( !(browserName != 'CHROME' && browserName != 'SAFARI') ) {
            		$('footer').remove();
            	}
            	
		$('#switcher').themeswitcher({
                    loadTheme: theme,
                    cookieName:'',
                    width: 160,
                    jqueryuiversion: "1.10.3"
                });

		$('#loginButton').button();
			$(document).attr('title', languages['PageTitle']);
			$("#loginButton").val(languages['Login']);
            });

        </script>
        
    </head>
    <body class="ui-widget-content" style="border:none;" onload="document.login.j_username.focus()">
    <section>
        <form name="login" id="login" action="j_security_check" method="POST">
            <fieldset>
                <legend><font>Login</font></legend>
                <h1><script>document.write(languages['PageTitle'])</script></h1> <h4>DICOM Web Workstation</h4>
                <label><font><script>document.write(languages['UserName'])</script> </font><span class="mandatory"><font>*</font></span><font> :</font></label>
                <input type="text" name="j_username" class="textInput" required>

                <label><font><script>document.write(languages['Password'])</script> </font><span class="mandatory"><font>*</font></span><font> :</font></label>
                <input type="password" name="j_password" class="textInput" required>

                <input type="submit" name="submit" id="loginButton" value="" class="button disabled">
            </fieldset>
        </form>
    </section>
    <footer align="center"><script>document.write(languages['Footer'])</script></footer>

<div style="width: 100%; position: absolute; bottom: 0px;">
<table style="width:100%">
<tr>
<td><a href="http://dcm4che.org" target="_blank"><img src="images/dcm4che.gif" alt="dcm4che.org" style="width: 132px; background: #FFF;" /></a></td> 
<td style="text-align: center"><img src="images/html5.png" alt="" style="width: 132px" /> </td>
<td style="text-align: right"><a href="http://oviyam.raster.in" target="_blank"><img src="images/raster.png" alt="Raster Images" style="width: 132px" /></a></td>
</tr>
</table>
</div>

</body>
</html>
