/*****************************************************************************

                        Copyright (c) 2014 My Company

******************************************************************************/

implement grayScale
    open core
facts
    bmp:bitmap.
clauses
    new(Bmp):-
        bmp:=Bmp.
clauses
    toGray():-goImage(0), stdio::write(bmp:getPixel(0,0):redPart).
clauses
    goImage(Y):-
        Y<bmp:height,
        goLine(0,Y),
        NY = Y + 1,
        goImage(NY), !.
    goImage(_).
clauses
    goLine(X,Y):-
        X<bmp:width,
        setPixel(X,Y),
        NX = X+1,
        goLine(NX, Y), !.
    goLine(_,_).
clauses
    toInt(R,I):-
        I = math::roundToUnsigned(R).
clauses
    setPixel(X,Y):-
        Color = bmp:getPixel(X,Y),
        L = Color:redPart * 0.299 + Color:greenPart * 0.587 +Color:bluePart * 0.114,

        toInt(L, Lightness),

        NewColor = color::create(Lightness,Lightness,Lightness),
        bmp:setPixel(X,Y,NewColor).
end implement grayScale