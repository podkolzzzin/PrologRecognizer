/*****************************************************************************

                        Copyright (c) 2014 My Company

******************************************************************************/

implement taskWindow
    inherits applicationWindow
    open core, vpiDomains


constants
    mdiProperty : boolean = true.
clauses
    new():-
        applicationWindow::new(),
        generatedInitialize().

predicates
    onShow : window::showListener.
clauses
    onShow(_, _CreationData):-
        _MessageForm = messageForm::display(This).

predicates
    onDestroy : window::destroyListener.
clauses
    onDestroy(_).

predicates
    onHelpAbout : window::menuItemListener.
clauses
    onHelpAbout(TaskWin, _MenuTag):-
        _AboutDialog = aboutDialog::display(TaskWin).

predicates
    onFileExit : window::menuItemListener.
clauses
    onFileExit(_, _MenuTag):-
        close().

predicates
    onSizeChanged : window::sizeListener.
clauses
    onSizeChanged(_):-
        vpiToolbar::resize(getVPIWindow()).

predicates
    onActivate : documentWindow::activateListener.
clauses
    onActivate(_Source):-!,
        stdio::write("Activate"), stdio::nl,
    !.

predicates
    onFileOpen : window::menuItemListener.
clauses
    onFileOpen(_Source, _MenuTag):-
        stdio::write("OnFileOpen"),stdio::nl,
        Picture = vpi::pictLoad(@"Screenshot.bmp"),
        _ = gdiplus::startup(),
        Bmp = bitmap::createFromFile("Screenshot.bmp"),
        C = Bmp:getPixel(0,0),
        R = C:redPart,
        G = C:greenPart,
        B= C:bluePart,
        stdio::writef("r=%d, g=%d, b=%d",R,G,B),stdio::nl,

        WGdi = getWindowGDI(),
        Pnt = pnt(0,0),
        WGdi:pictDraw(Picture, Pnt,rop_SrcCopy).

% This code is maintained automatically, do not update it manually. 18:44:45-24.4.2014
predicates
    generatedInitialize : ().
clauses
    generatedInitialize():-
        setText("RGZ7"),
        setDecoration(titlebar([closebutton(),maximizebutton(),minimizebutton()])),
        setBorder(sizeBorder()),
        setState([wsf_ClipSiblings]),
        whenCreated({ :- projectToolbar::create(getVpiWindow()), statusLine::create(getVpiWindow()) }),
        addSizeListener({ :- vpiToolbar::resize(getVpiWindow()) }),
        setMdiProperty(mdiProperty),
        menuSet(resMenu(resourceIdentifiers::id_TaskMenu)),
        addShowListener(onShow),
        addSizeListener(onSizeChanged),
        addDestroyListener(onDestroy),
        addActivateListener(onActivate),
        addMenuItemListener(resourceIdentifiers::id_help_about, onHelpAbout),
        addMenuItemListener(resourceIdentifiers::id_file_exit, onFileExit),
        addMenuItemListener(resourceIdentifiers::id_file_open, onFileOpen).
% end of automatic code
end implement taskWindow