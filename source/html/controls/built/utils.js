"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var Enums = require("./enums");
var CalendarSettings = (function () {
    function CalendarSettings() {
    }
    CalendarSettings.getLongDayName = function (dayIndex) {
        if (dayIndex >= 0 && dayIndex < CalendarSettings.longDayNames.length) {
            return CalendarSettings.longDayNames[dayIndex];
        }
        throw new Error("Day index out of range: " + dayIndex);
    };
    CalendarSettings.getShortDayName = function (dayIndex) {
        if (dayIndex >= 0 && dayIndex < CalendarSettings.shortDayNames.length) {
            return CalendarSettings.shortDayNames[dayIndex];
        }
        throw new Error("Day index out of range: " + dayIndex);
    };
    CalendarSettings.getInitialDayName = function (dayIndex) {
        if (dayIndex >= 0 && dayIndex < CalendarSettings.minimalDayNames.length) {
            return CalendarSettings.minimalDayNames[dayIndex];
        }
        throw new Error("Day index out of range: " + dayIndex);
    };
    CalendarSettings.getLongMonthName = function (monthIndex) {
        if (monthIndex >= 0 && monthIndex < CalendarSettings.longMonthNames.length) {
            return CalendarSettings.longMonthNames[monthIndex];
        }
        throw new Error("Month index out of range: " + monthIndex);
    };
    CalendarSettings.getShortMonthName = function (monthIndex) {
        if (monthIndex >= 0 && monthIndex < CalendarSettings.shortMonthNames.length) {
            return CalendarSettings.shortMonthNames[monthIndex];
        }
        throw new Error("Month index out of range: " + monthIndex);
    };
    return CalendarSettings;
}());
CalendarSettings.monthsInYear = 12;
CalendarSettings.daysInWeek = 7;
CalendarSettings.firstDayOfWeek = Enums.DayOfWeek.Sunday;
CalendarSettings.longDayNames = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
CalendarSettings.shortDayNames = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
CalendarSettings.minimalDayNames = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"];
CalendarSettings.longMonthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
CalendarSettings.shortMonthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
exports.CalendarSettings = CalendarSettings;
function daysInMonth(year, month) {
    switch (month) {
        case 1:
            return (year % 4 == 0 && year % 100) || year % 400 == 0 ? 29 : 28;
        case 3:
        case 5:
        case 8:
        case 10:
            return 30;
        default:
            return 31;
    }
}
exports.daysInMonth = daysInMonth;
function addDays(date, days) {
    var result = new Date(date.getTime());
    result.setDate(result.getDate() + days);
    return result;
}
exports.addDays = addDays;
function addMonths(date, months) {
    var result = new Date(date.getTime());
    var newMonth = result.getMonth() + months;
    result.setMonth(newMonth);
    // We want to maintain the same day-of-month, but that may not be possible if the new month doesn't have enough days.
    // Loop until we back up to a day the new month has.
    // (Weird modulo math is due to Javascript's treatment of negative numbers in modulo)
    if (result.getMonth() !== ((newMonth % CalendarSettings.monthsInYear) + CalendarSettings.monthsInYear) % CalendarSettings.monthsInYear) {
        result = addDays(result, -result.getDate());
    }
    return result;
}
exports.addMonths = addMonths;
function areDatesEqual(date1, date2) {
    return date1.getFullYear() == date2.getFullYear() &&
        date1.getMonth() == date2.getMonth() &&
        date1.getDate() == date2.getDate();
}
exports.areDatesEqual = areDatesEqual;
function getScrollX() {
    return window.pageXOffset;
}
exports.getScrollX = getScrollX;
function getScrollY() {
    return window.pageYOffset;
}
exports.getScrollY = getScrollY;
function getAttributeValueAsBool(element, attributeName, defaultValue) {
    var attribute = element.attributes[attributeName];
    if (attribute) {
        return attribute.value === "true";
    }
    return defaultValue;
}
exports.getAttributeValueAsBool = getAttributeValueAsBool;
function getAttributeValueAsString(element, attributeName, defaultValue) {
    var attribute = element.attributes[attributeName];
    if (attribute) {
        return attribute.value;
    }
    return defaultValue;
}
exports.getAttributeValueAsString = getAttributeValueAsString;
function getAttributeValueAsInt(element, attributeName, defaultValue) {
    var attribute = element.attributes[attributeName];
    if (attribute) {
        var n = parseInt(attribute.value);
        if (!isNaN(n)) {
            return n;
        }
    }
    return defaultValue;
}
exports.getAttributeValueAsInt = getAttributeValueAsInt;
//# sourceMappingURL=utils.js.map