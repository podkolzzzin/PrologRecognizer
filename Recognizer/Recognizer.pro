﻿/*****************************************************************************

                        Copyright (c) 2014 My Company

******************************************************************************/

implement recognizer
    open core
facts
    bitmap bmp.
clauses
    new(bitmap Bmp):-
        bmp = Bmp.
clauses
    getBitmap()=bmp.
end implement recognizer