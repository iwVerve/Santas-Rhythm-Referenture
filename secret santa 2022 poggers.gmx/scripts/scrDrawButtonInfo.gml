///scrDrawButtonInfo(optionsText)
///Draws the button control info for menus
///argument0 - sets whether to draw the text for entering the options menu

var optionsText = argument0;

var backButton;
var acceptButton;
var optionsButton;

//check whether to display keyboard or controller buttons
if (!global.controllerMode)
{
    backButton = scrGetKeybind(global.menuBackButton[0]);
    acceptButton = scrGetKeybind(global.menuAcceptButton[0]);
    optionsButton = scrGetKeybind(global.menuOptionsButton[0]);
}
else
{
    backButton = scrGetControllerBind(global.menuBackButton[1]);
    acceptButton = scrGetControllerBind(global.menuAcceptButton[1]);
    optionsButton = scrGetControllerBind(global.menuOptionsButton[1]);
}

//button info
draw_set_font(fDefault12);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
scrDrawTextOutline(34, 556, "["+backButton+"] Back", c_white, c_black);
draw_set_halign(fa_right);
scrDrawTextOutline(766, 556, "["+acceptButton+"] Accept", c_white, c_black);

if (optionsText)
{
    //draw button info for the options menu
    
    draw_set_halign(fa_middle);
    scrDrawTextOutline(400, 556, "["+optionsButton+"] Options", c_white, c_black);
}
