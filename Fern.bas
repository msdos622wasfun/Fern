' *********************************
'
' Fern Demo
'
' Version 1.01
'
' A Fractal Graphics Demo
'
' Copyleft 2020 by Erich Kohl
'
' *********************************

#CONSOLE OFF
#COMPILE EXE
#DIM ALL

#INCLUDE "Version_Info.inc"

GLOBAL hWinMain AS DWORD
GLOBAL maxWidth AS LONG
GLOBAL maxHeight AS LONG
GLOBAL colors() AS LONG

FUNCTION PBMAIN () AS LONG

    Init
    Title

END FUNCTION

SUB FernLoop

    LOCAL backColor AS LONG
    LOCAL fernColor AS LONG
    LOCAL a, b, c, d, e, f, r AS SINGLE
    LOCAL x, y AS SINGLE
    LOCAL newx, newy AS SINGLE
    LOCAL keyPress AS STRING

    backColor = 0
    fernColor = 2

    GRAPHIC CLEAR colors(backColor)

    GRAPHIC SCALE (-4, 0) - (6, 10)

    DO
        r = RND

        IF (r <= .01) THEN
            a = 0
            b = 0
            c = 0
            d = .16
            e = 0
            f = 0
        ELSEIF r > .01 AND r <= .86 THEN
            a = .85
            b = .04
            c = -.04
            d = .85
            e = 0
            f = 1.6
        ELSEIF r > .86 AND r <= .93 THEN
            a = .2
            b = -.26
            c = .23
            d = .22
            e = 0
            f = 1.6
        ELSE
            a = -.15
            b = .28
            c = .26
            d = .24
            e = 0
            f = .44
        END IF

        newx = (a * x) + (b * y) + e
        newy = (c * x) + (d * y) + f

        x = newx
        y = newy

        GRAPHIC SET PIXEL (x, y), colors(fernColor)

        GRAPHIC INKEY$ TO keyPress

        IF LEN(keyPress) = 2 THEN
            SELECT CASE ASC(RIGHT$(keyPress, 1))
                CASE 80
                    backColor = backColor - 1
                    IF backColor = -1 THEN backColor = 15
                    GRAPHIC CLEAR colors(backColor)
                CASE 72
                    backColor = backColor + 1
                    IF backColor = 16 THEN backColor = 0
                    GRAPHIC CLEAR colors(backColor)
                CASE 75
                    fernColor = fernColor - 1
                    IF fernColor = -1 THEN fernColor = 15
                    GRAPHIC CLEAR colors(backColor)
                CASE 77
                    fernColor = fernColor + 1
                    IF fernColor = 16 THEN fernColor = 0
                    GRAPHIC CLEAR colors(backColor)
            END SELECT
        END IF

    LOOP UNTIL ASC(keyPress) = 27

END SUB

SUB Init

    DIM colors(0 TO 15)

    colors(0) = %RGB_BLACK
    colors(1) = %RGB_MEDIUMBLUE
    colors(2) = %RGB_GREEN
    colors(3) = %RGB_TURQUOISE
    colors(4) = %RGB_DARKRED
    colors(5) = %RGB_DARKMAGENTA
    colors(6) = %RGB_CHOCOLATE
    colors(7) = %RGB_GAINSBORO
    colors(8) = %RGB_GRAY
    colors(9) = %RGB_BLUE
    colors(10) = %RGB_LIME
    colors(11) = %RGB_CYAN
    colors(12) = %RGB_RED
    colors(13) = %RGB_MAGENTA
    colors(14) = %RGB_YELLOW
    colors(15) = %RGB_WHITE

    DESKTOP GET SIZE TO maxWidth, maxHeight
    GRAPHIC WINDOW "Fern", -50, -50, maxWidth + 50, maxHeight + 50 TO hWinMain
    GRAPHIC ATTACH hWinMain, 0

END SUB

SUB Title

    LOCAL hFont60 AS DWORD
    LOCAL hFont20 AS DWORD
    LOCAL w, h AS SINGLE
    LOCAL s AS STRING
    LOCAL keyPress AS STRING

    FONT NEW "Calibri", 60 TO hFont60
    FONT NEW "Calibri", 20 TO hFont20

    GRAPHIC CLEAR %RGB_BLACK
    GRAPHIC COLOR %RGB_WHITE, %RGB_BLACK

    DO
        GRAPHIC SET FONT hFont60

        s = "FERN DEMO"
        GRAPHIC TEXT SIZE s TO w, h
        GRAPHIC SET POS ((maxWidth / 2) - (w / 2), (maxHeight / 2) - 200)
        GRAPHIC PRINT s

        GRAPHIC SET FONT hFont20

        s = "Fern Demo v1.01"
        GRAPHIC TEXT SIZE s TO w, h
        GRAPHIC SET POS ((maxWidth / 2) - (w / 2), (maxHeight / 2))
        GRAPHIC PRINT s
        s = "A Fractal Graphics Demo"
        GRAPHIC TEXT SIZE s TO w, h
        GRAPHIC SET POS ((maxWidth / 2) - (w / 2), (maxHeight / 2) + h)
        GRAPHIC PRINT s
        s = "Copyleft 2020 by Erich Kohl"
        GRAPHIC TEXT SIZE s TO w, h
        GRAPHIC SET POS ((maxWidth / 2) - (w / 2), (maxHeight / 2) + (h * 2))
        GRAPHIC PRINT s
        's = "All Rights Reserved"
        'GRAPHIC TEXT SIZE s TO w, h
        'GRAPHIC SET POS ((maxWidth / 2) - (w / 2), (maxHeight / 2) + (h * 3))
        'GRAPHIC PRINT s

        s = "During the demo, use all four arrow keys to change colors."
        GRAPHIC TEXT SIZE s TO w, h
        GRAPHIC SET POS ((maxWidth / 2) - (w / 2), (maxHeight / 2) + (h * 5))
        GRAPHIC PRINT s
        s = "Press Enter to start the demo, or Esc to quit."
        GRAPHIC TEXT SIZE s TO w, h
        GRAPHIC SET POS ((maxWidth / 2) - (w / 2), (maxHeight / 2) + (h * 7))
        GRAPHIC PRINT s

        GRAPHIC LINE (0, (maxHeight / 2) - 50) - (maxWidth + 50, (maxHeight / 2) - 50), %RGB_LIME

        GRAPHIC INKEY$ TO keyPress

        IF ASC(keyPress) = 13 THEN
            FernLoop
            GRAPHIC SCALE PIXELS
            GRAPHIC CLEAR %RGB_BLACK
            GRAPHIC COLOR %RGB_WHITE, %RGB_BLACK
        END IF

    LOOP UNTIL ASC(keyPress) = 27

END SUB
