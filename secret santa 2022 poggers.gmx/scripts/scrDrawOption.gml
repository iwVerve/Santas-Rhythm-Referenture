///scrDrawOption(name, value)
                        
if (argument_count >= 1)
{
    draw_set_halign(fa_left);
    scrDrawTextOutline(xMargin, yStart + yStep * currentSlot, argument[0], c_white, c_black);
}

if (argument_count >= 2)
{
    draw_set_halign(fa_right);
    scrDrawTextOutline(view_wview - xMargin, yStart + yStep * currentSlot, argument[1], c_white, c_black);
}

currentSlot += 1;
