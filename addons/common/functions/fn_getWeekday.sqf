#include "../script_component.hpp"

/*
* Author: Zorn
* 
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call cvo_fnc_sth
*
* Public: Yes
*/

params [
    ["_systemTime",     systemTime,     []  ]
];

_systemTime params ["_year", "_month", "_day", "_hour", "_minute", "_second", "_millisecond"];

private _date = [_year,_month,_day,0,0];
private _yearBefore = ((_date select 0)-1) max 0;
private _qttLeapYears = floor (_yearBefore/4);
private _qttNormalYears = _yearBefore-_qttLeapYears;
private _days = _qttNormalYears+_qttLeapYears*(366/365);
_days = _days+dateToNumber _date;

private _num = (round (_days/(1/365))) mod 7;
private _string = ["MONDAY", "TUESDAY", "WEDNESDAY","THURSDAY", "FRIDAY", "SATURDAY", "SUNDAY"] select (_num -1);

[_num, _string]