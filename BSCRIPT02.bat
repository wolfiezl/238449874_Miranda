@echo off
setlocal enabledelayedexpansion


:SHAPE
echo Select a shape:
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
set /p shape="Enter the number corresponding to your choice: "

if %shape%==1 goto CIRCLE
if %shape%==2 goto TRIANGLE
if %shape%==3 goto QUADRILATERAL
echo Invalid selection. Please try again.
goto SHAPE

:CIRCLE
set /p radius="Enter the radius of the circle: "

setlocal enabledelayedexpansion
set "pi=3.14159"
set /a "area=radius*radius"
set /a "area=area*pi"
echo The area of the circle is: !area!
goto END

:TRIANGLE
set /p a="Enter the length of side a: "
set /p b="Enter the length of side b: "
set /p c="Enter the length of side c: "

set /a "s=(a+b+c)/2"

set /a "area=s*(s-a)*(s-b)*(s-c)"

for /F "delims=" %%G IN ('powershell -command "[math]::Sqrt(%area%)"') do set area_float=%%G
echo The area of the triangle is: !area_float!

if %a%==%b% if %b%==%c% (
    echo The triangle is equilateral.
) else if %a%==%b% if not %b%==%c% (
    echo The triangle is isosceles.
) 
if not %a%==%b% (
    echo The triangle is scalene.
)
goto END

:QUADRILATERAL
set /p length="Enter the length: "
set /p width="Enter the width: "
set /a area=%length%*%width%
echo The area of the quadrilateral is: %area%

if %length%==%width% ( echo The quadrilateral is a square.
) else (echo The quadrilateral is a rectangle.)

goto END

:END
echo Script completed.
pause