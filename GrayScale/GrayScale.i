/*****************************************************************************

                        Copyright (c) 2014 My Company

******************************************************************************/

interface grayScale
    open core
predicates
    toGray:().
    setPixel:(integer X, integer Y).
    goLine:(integer X, integer Y).
    goImage:(integer Y).
    toInt:(real R, unsigned N[out]).
end interface grayScale