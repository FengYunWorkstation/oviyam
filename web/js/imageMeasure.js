// This file contains the handlers called when the user clicks on the measure toolbar button.
var measureEnabled = false;
var lb = null;

function measureOn(measureDiv){
    if(!measureEnabled) {
    	lb = lightBox("picture");
		lb.measureOn();
		measureEnabled = true;
	    jQuery(measureDiv).addClass('toggleOff');
        jQuery(measureDiv).children().attr('class', 'imgOn');   
    } else {
		measureEnabled = false;
        lb.measureOff();
        lb.destroy();
        jQuery(measureDiv).removeClass('toggleOff');
        jQuery(measureDiv).children().attr('class', 'imgOff');
    }
        
}