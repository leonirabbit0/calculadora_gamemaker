if (animando)
{
    offset_y -= 2;
    if (offset_y <= 0)
    {
        offset_y = 0;
        animando = false;
    }
}