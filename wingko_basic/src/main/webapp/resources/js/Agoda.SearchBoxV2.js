//Variables

var agoda_Obj;
var agoda_CityLabel;
var agoda_CheckInLabel;
var agoda_NightLabel;
var agoda_SubmitLabel;
var agoda_CloseTextLabel;
var agoda_DdlNight;
var agoda_UrlResult;
var agoda_LanguageScript;
var agoda_TempCode;
var agoda_LanguageCode;
var agoda_LanguageCodeArr = new Array();
var agoda_RTL = false;
var agoda_MinDigit = 2;
var agoda_ValidateCity = true;
// Optional to show or hide city label when city variable  was fixed.
var agoda_ShowCityLabel = true;
var agoda_msgCheckInOverDue = "";

// Object Properties
var agoda_this_cid;
var agoda_this_filterCityName;
var agoda_this_fixedCityName;
var agoda_this_checkinDay;
var agoda_this_nightDay = 1;
var agoda_this_room = 1;
var agoda_this_adult = 2;
var agoda_this_children = 0;
var agoda_this_language = 1;
var agoda_this_minDate = 1;
var agoda_this_newWindow = false;
var agoda_this_hotelID;
var agoda_this_style;
var agoda_this_header;
var agoda_this_footer;
var agoda_this_cityWatermark;
var agoda_this_fixedCityNameVisible = true;
var agoda_this_currencyCode = "USD";
//End Properties

//Initiallize
function AgodaSearchBox(param) {
    var objHead = document.getElementsByTagName('head');
    var isLoadCheck = false;

    // Check jQuery Main
    function LoadJQueryMain() {
        if (typeof jQuery == "undefined") {
            if (isLoadCheck == false) {
                jQueryEl = document.createElement("script");
                jQueryEl.setAttribute("type", "text/javascript");
                jQueryEl.setAttribute("src", "http://ajaxsearch.partners.agoda.com/js/jquery/jquery-1.4.2.min.js");
                jQueryEl.id = "jquery";
                objHead[0].appendChild(jQueryEl);
            }
            isLoadCheck = true;
            setTimeout(LoadJQueryMain, 50);
        }
        else {
            isLoadCheck = false;
            LoadJQueryUI();
        }
    }
    LoadJQueryMain();

    //Check jQuery Custom UI
    function LoadJQueryUI() {
        if (typeof jQuery.ui == "undefined") {
            if (isLoadCheck == false) {
                jsUI = document.createElement("script");
                jsUI.setAttribute("type", "text/javascript");
                jsUI.setAttribute("src", "http://ajaxsearch.partners.agoda.com/js/jquery/ui/jquery-ui-1.8.12.custom.min.js");
                jsUI.id = "jqueryui";
                objHead[0].appendChild(jsUI);
            }
            isLoadCheck = true;
            setTimeout(LoadJQueryUI, 50);
        }
        else {
            // Add jQuery UI style
            customCss = document.createElement("link");
            customCss.setAttribute("type", "text/css");
            customCss.setAttribute("href", "http://www.agoda.com//partners/Searchbox/Css/jquery-ui-1.8.12.custom.css");
            customCss.setAttribute("rel", "stylesheet");
            objHead[0].appendChild(customCss);

            //Rendering Searchbox Control
            RenderingSearchboxControl();
        }
    }

    function RenderingSearchboxControl() {

        Obj = jQuery("#" + param.Element);
        Obj.html("<center><img src='http://img.agoda.net/images/affiliates/loading_icon.gif' /></center>");

        if ((param.night != null) && (param.night != "")) {
            agoda_this_nightDay = param.night;
        }

        DdlNight = _LoadNightDdl();
        agoda_this_cid = param.cid;
        if ((param.checkInDateBefore != null) && (param.checkInDateBefore != "")) {
            agoda_this_minDate = param.checkInDateBefore;
        }
        agoda_this_filterCityName = param.filterCityName;    // Example "Bangkok", "London" (Default is "")
        agoda_this_fixedCityName = param.fixedCityName; // "true", "false" (Default is "true")
        agoda_this_language = param.language; //1,2,3... (Default  is 1)
        agoda_this_newWindow = param.newWindow; // "true","false" (Default is "true")
        agoda_this_hotelID = param.hotelID; // Example 71656
        agoda_this_style = param.style; //Example "Modern" , "Default"
        agoda_this_header = param.header;  //Default = ""
        agoda_this_footer = param.footer; // Default = ""
        agoda_this_fixedCityNameVisible = param.fixedCityNameVisible; // Default = true
        agoda_this_cityWatermark = param.cityWatermark;

        if ((param.currencyCode != undefined) && (param.currencyCode != '')) {
            agoda_this_currencyCode = param.currencyCode;
        }
        //Old Search label cms id = '3211' new '20465'
        //Load Search Box Environemnt
        _GetLanguageURL();
        _GetDict('22668|22671|22673|22665|22675|22675|44642|22669|22672|22415|22687|44082');
        TempCode = agoda_LanguageCodeArr[7];

        // Load CMS Environment
        agoda_CityLabel = agoda_LanguageCodeArr[0];
        agoda_CheckInLabel = agoda_LanguageCodeArr[1];
        agoda_NightLabel = agoda_LanguageCodeArr[2];
        agoda_SubmitLabel = agoda_LanguageCodeArr[3];
        agoda_CloseTextLabel = agoda_LanguageCodeArr[4];

        var strCss;
        if ((agoda_this_style == undefined) || (agoda_this_style == ""))
            strCss = _GetLanguageURL() + "/partners/SearchBox/Css/Default.css";
        else
            strCss = _GetLanguageURL() + "/partners/SearchBox/Css/" + agoda_this_style + ".css"

        // Add Searchbox style
        customCss = document.createElement("link");
        customCss.setAttribute("type", "text/css");
        customCss.setAttribute("href", strCss);
        customCss.setAttribute("rel", "stylesheet");
        objHead[0].appendChild(customCss);
    };
}

// Rendering search box area and controls
function RenderSearchBox(CityLabel, CheckInLabel, NightLabel, SubmitLabel, cal_monthNames, cal_shortDays, cal_shortMonth, title1, title2, msgCheckInDateOverDue, powered) {
    var MonthArray = new Array;
    var DayArray = new Array;
    var ShortMonthArray = new Array;
    var FixedCityStr = "<input type='textbox' class='TextBox City' id='txtCitySearch'  value='" + agoda_this_filterCityName + "' />";
    msgCheckInOverDue = msgCheckInDateOverDue;
    MonthArray = cal_monthNames.toString().split(",");
    DayArray = cal_shortDays.toString().split(",");
    ShortMonthArray = cal_shortMonth.toString().split(",");

    // Filter City Name  null and Fixed City is false
    if (((agoda_this_fixedCityName == '') && (agoda_this_hotelID == '')) || (agoda_this_filterCityName == undefined)) {
        FixedCityStr = "<input type='textbox' class='TextBox City' id='txtCitySearch' />";
    }

    // Filter City Name  is not null and Fixed City is false
    if ((agoda_this_fixedCityName != true) && (agoda_this_filterCityName != '') && (agoda_this_filterCityName != undefined)) {
        FixedCityStr = "<input type='textbox' class='CityTextBox' id='txtCitySearch' value='" + agoda_this_filterCityName + "' />";
    }

    // Rendering Search Box Widget
    var RTLClass = "";
    var RoundConnerStyle = ""
    if (agoda_RTL == true) {
        RTLClass = " class='RTL'";
    }
    var Str = "";
    Str = "<div id='AgodaSearchBoxWrapper' " + RTLClass + ">"
          + "<div id='AgodaSearchBox'>"
          + "<div id='Title1'>" + title1 + "</div><div id='Title2'>" + title2 + "</div>"
          + "<div id='CityRow'><div id='CityLabel'>" + CityLabel + "</div><div id='CityField'>" + FixedCityStr + "</div></div>"
          + "<div id='CheckInRow'><div id='CheckInLabel'>" + CheckInLabel + "</div><div id='CheckInField'><input type='textbox' class='CheckInDateTextBox' id='txtCheckInDate' readonly='readonly' /></div>"
          + "<div id='NightRow'><div id='NightLabel'>" + NightLabel + "&nbsp;&nbsp;</div>" + DdlNight + "</div></div>"
          + "<div id='SearchButtonRow'><div id='ButtonField' style='position:relative;z-index:3;'><input type='button' class='Button' id='SearchButton' value='" + SubmitLabel + "' /></div></div>"
          + "</div><div id='AgodaLogo'><div id='logoDiv'>";
    if (agoda_RTL == true) {
        Str += "<div class='logo'>&nbsp;</div><div class='txt'>" + powered + "</div>";
    }
    else {
        Str += "<div class='txt'>" + powered + "</div><div class='logo'>&nbsp;</div>";
    }
    Str += "</div></div></div>";

    // Rendering Controls
    Obj.html(Str);

    //Set City Search Water Mark
    var xObj = jQuery("#txtCitySearch");
    if (agoda_this_cityWatermark != undefined) {
        xObj.val(agoda_this_cityWatermark);
        xObj.attr("style", "color:#aaaaaa !important;font-size:13px");
    }

    xObj.click(function () {
        if ((xObj.val() == agoda_this_cityWatermark) && (agoda_this_cityWatermark != undefined)) {
            xObj.val('');
            xObj.attr("style", "color:#333333  !important;font-size:13px");
        }
    });

    xObj.focusout(function () {
        if ((xObj.val() == "") && (agoda_this_cityWatermark != undefined)) {
            xObj.val(agoda_this_cityWatermark);
            xObj.attr("style", "color:#aaaaaa !important;font-size:13px");
        }
    });

    // Add Search Event
    jQuery("#SearchButton").click(function () {
        if (_ValidData()) {
            TextSearch = jQuery("#txtCitySearch").val();
            if ((agoda_ValidateCity == false) && (TextSearch != "")) {
                TextSearch = agoda_this_filterCityName;
            }
            var CheckInDate = jQuery.datepicker.formatDate('MM/dd/yy', jQuery("#txtCheckInDate").datepicker("getDate"));
            var d = new Date(jQuery("#txtCheckInDate").datepicker("getDate"));
            var Night = jQuery("#Night").val()
            var CheckOutDateTemp = new Date(d.getFullYear(), d.getMonth(), d.getDate() + parseInt(Night));
            var CheckOutDate = jQuery.datepicker.formatDate('MM/dd/yy', CheckOutDateTemp);
            if (agoda_this_hotelID != "") {
                TextSearch = "bangkok";
            }
            var DestinationUrl = _GetLanguageURL() + "/partners/SearchBox/SearchResult.aspx?Room=" + agoda_this_room + "&Adult=" + agoda_this_adult + "&Children=" + agoda_this_children
                                                    + "&Search=" + encodeURI(TextSearch) + "&Night=" + Night + "&ArrivalDate=" + CheckInDate + "&DepartDate="
                                                    + CheckOutDate + "&LanguageID=" + agoda_this_language + "&HotelID=" + agoda_this_hotelID + "&Header="
                                                    + agoda_this_header + "&Footer=" + agoda_this_footer + "&CID=" + agoda_this_cid + "&CurrencyCode=" + agoda_this_currencyCode + "&radius=36&cityid=0";
            if (agoda_this_newWindow) {
                window.open(DestinationUrl);
            }
            else {
                window.location = DestinationUrl;
            }
        }
    });

    // City Change Event
    jQuery("#txtCitySearch").keyup(function () {
        _ValidData();
    });

    // Check In Calendar Change Event
    jQuery("#txtCheckInDate").change(function () {
        _ValidData();
    });

    jQuery("#txtCheckInDate").click(function () {
        jQuery("img.ui-datepicker-trigger").click();
    });

    // Filter City Name is not null and Fixed City is true or HotelID not null
    if ((agoda_this_fixedCityName == true) && (agoda_this_filterCityName != '') || (agoda_this_hotelID != '')) {
        jQuery("#CityRow").css("display", "none");
        if (agoda_ShowCityLabel) {
            jQuery("#CityRow").css("display", "inline");
            jQuery("#txtCitySearch").css("display", "none");
            jQuery("#CityField").html("<font style='font-weight:bold;margin-top:0px;line-height:normal;padding-top:0px'>" + agoda_this_filterCityName + "</font>");
            TextSearch = agoda_this_filterCityName;
        }

        if ((agoda_this_hotelID != '')) {
            jQuery("#CityRow, #CityLabel").css("display", "none");
            jQuery("#AgodaSearchBox").addClass("HideCityRow");
        }
        agoda_ValidateCity = false;
    }

    //Initialize Calendar UI
    var CanlendarIcon = "http://img.agoda.net/images/affiliates/" + agoda_this_style + "/temp_calendar.gif";
    if ((agoda_this_style.toLowerCase() == "default") || (agoda_this_style.toLowerCase() == "cmslanding") || 
        (agoda_this_style == "") || (agoda_this_style == undefined) || agoda_this_style.toLowerCase() == "style4") {
        CanlendarIcon = "http://img.agoda.net/images/affiliates/calendar.gif";
    }

    jQuery("#txtCheckInDate").datepicker({
        showOn: "button",
        buttonImage: CanlendarIcon,
        buttonImageOnly: true
    });

    // Remove text in button for basic style
    if (agoda_this_style.toLowerCase() == "style1" || agoda_this_style.toLowerCase() == "style2") {
        jQuery("#SearchButton").val("");
    }

    //Check Fixed Visible CityName
    if (agoda_this_fixedCityNameVisible == false && agoda_this_filterCityName != "") {
        jQuery("#CityRow").hide();
    }

    //Set Default Date
    var D = new Date();
    Month = D.getMonth() + 1;
    var Year = D.getFullYear();
    var MinDate;
    var MaxDate;
    if (agoda_this_minDate != 0) {
        MinDate = new Date(Month + '/' + D.getDate() + '/' + D.getFullYear());
        MinDate.setDate(MinDate.getDate() + agoda_this_minDate);
        jQuery("#txtCheckInDate").datepicker("setDate", new Date(MinDate));
    }
    MaxDate = Month + '/' + D.getDate() + '/' + (D.getFullYear() + 1);

    // Override Calendar Text from CMS
    var cal_shortDays = new Array();

    // Date Picker Function
    jQuery("#txtCheckInDate").datepicker("option", jQuery.datepicker.regional[agoda_LanguageCode] =
        {
            closeText: agoda_CloseTextLabel,
            monthNames: MonthArray,
            monthNamesShort: ShortMonthArray,
            dayNamesShort: DayArray,
            dayNamesMin: DayArray,
            weekHeader: 'Wk',
            firstDay: 0,
            isRTL: false,
            showMonthAfterYear: false,
            yearSuffix: '',
            minDate: new Date(),
            maxDate: new Date(MaxDate),
            dateFormat: "D dd M yy"
        }
    );

    if (agoda_this_minDate == 0) {
        jQuery("#txtCheckInDate").datepicker("setDate", "+0d");
    }

}

//Load night drop down list value
function _LoadNightDdl() {
    var CheckStr = "";
    var Str = "<select id='Night'>";
    for (i = 1; i <= 30; i++) {
        CheckStr = ""
        if (i == agoda_this_nightDay) {
            CheckStr = 'selected = true';
        }
        Str += "<option value='" + i + "'" + CheckStr + ">" + i + "</option>";
    }
    Str += "</select>";
    return Str;
}

// Get CMS 

function _GetDict(CmsID) {
    var objHead = document.getElementsByTagName('head');
    jsLanguage = document.createElement("script");
    jsLanguage.setAttribute("language", "javascript");
    jsLanguage.setAttribute("type", "text/javascript");
    jsLanguage.setAttribute("charset", "UTF-8");
    jsLanguage.setAttribute("src", _GetLanguageURL() + "/partners/Searchbox/Default.aspx?CmsID=" + CmsID + "&CId=" + agoda_this_cid + "&LanguageID=" + agoda_this_language);
    jsLanguage.id = "SearchBox";
    objHead[0].appendChild(jsLanguage);
}

// Script to detect the URL to be used for all scripts
function _GetScrURL() {
    var objScripts = document.getElementsByTagName("SCRIPT");
    var retVal = "";
    for (i = 0; i < objScripts.length; i++) {
        var tstval = new String(objScripts[i].src.toLowerCase());
        if (tstval.indexOf("agoda.searchboxv2.js") != -1) {
            retVal = tstval.substring(0, tstval.indexOf("/partners/searchbox/scripts/agoda.searchboxv2.js"));
        }
    }
    return retVal.replace(".com", ".");
}


//Get Language URL
function _GetLanguageURL() {
    var EnvironmentString = _GetScrURL();
    switch (agoda_this_language) {
        case 2:
            UrlResult = "fr";
            agoda_LanguageCode = "fr";
            break;
        case 3:
            UrlResult = "de";
            agoda_LanguageCode = "de";
            break;
        case 4:
            UrlResult = "it";
            agoda_LanguageCode = "it";
            break;
        case 5:
            UrlResult = "es";
            agoda_LanguageCode = "es";
            break;
        case 6:
            UrlResult = "jp";
            agoda_LanguageCode = "ja";
            break;
        case 7:
            UrlResult = "com.hk";
            agoda_LanguageCode = "zh-TW";
            break;
        case 8:
            UrlResult = "com.cn";
            agoda_LanguageCode = "zh-CN";
            break;
        case 9:
            UrlResult = "co.kr";
            agoda_LanguageCode = "ko";
            MinDigit = 1;
            break;
        case 10:
            UrlResult = "gr";
            agoda_LanguageCode = "gr";
            break;
        case 11:
            UrlResult = "ru";
            break;
        case 12:
            UrlResult = "com.pt";
            break;
        case 13:
            UrlResult = "nl";
            break;
        case 20:
            UrlResult = "com.tw";
            break;
        case 22:
            UrlResult = "co.th";
            break;
        case 23:
            UrlResult = "com.my";
            break;
        case 24:
            UrlResult = "vn";
            break;
        case 25:
            UrlResult = "se";
            break;
        case 26:
            UrlResult = "web.id";
            break;
        case 27:
            UrlResult = "pl";
            break;
        case 28:
            UrlResult = "no";
            break;
        case 29:
            UrlResult = "dk";
            break;
        case 30:
            UrlResult = "fi";
            break;
        case 31:
            UrlResult = "cz";
            break;
        case 32:
            UrlResult = "com.tr";
            break;
        case 33:
            UrlResult = "cat";
            break;
        case 34:
            UrlResult = "hu";
            break;
        case 35:
            UrlResult = "in";
            break;
        case 36:
            UrlResult = "bg";
            break;
        case 37:
            UrlResult = "ro";
            break;
        case 38:
            UrlResult = "si";
            break;
        case 39:
            UrlResult = "co.il";
            agoda_RTL = true;
            break;
        case 40:
            UrlResult = "ae";
            agoda_RTL = true;
            break;
        case 46:
            UrlResult = "lt";
            break;
        case 47:
            UrlResult = "lv";
            break;
        case 48:
            UrlResult = "co.cr";
            break;
        case 49:
            UrlResult = "co.ee";
            break;
        case 50:
            UrlResult = "ua";
            break;
        default:
            UrlResult = "com";
            break;
    }

    if (_GetScrURL() == "http://localhost") {
        return "http://localhost-tw";
    } else {
        return EnvironmentString + UrlResult;
    }
}

function _ValidData() {
    var ValidateTextBox = false;
    var ValidateCalendar = false;

    if (agoda_ValidateCity) {
        if (jQuery("#txtCitySearch").val().length < agoda_MinDigit) {
            jQuery("#txtCitySearch").addClass("Invalid");
            jQuery("#txtCitySearch").focus();
        }
        else {
            jQuery("#txtCitySearch").removeClass("Invalid");
            ValidateTextBox = true;
        }
    }
    else {
        ValidateTextBox = true;
    }
    var D = new Date(jQuery.datepicker.formatDate('MM/dd/yy', jQuery("#txtCheckInDate").datepicker("getDate")));
    var x = new Date();
    x.setFullYear(D.getFullYear(), D.getMonth(), D.getDate());
    //x.setFullYear(2012,5,31);
    var today = new Date();

    if ((jQuery("#txtCheckInDate").val() == "") || (x < today)) {
        jQuery("#txtCheckInDate").addClass("Invalid");
        if (x < today) {
            alert(msgCheckInOverDue);
        }
    }
    else {
        jQuery("#txtCheckInDate").removeClass("Invalid");
        ValidateCalendar = true;
    }
    return ValidateTextBox & ValidateCalendar;
}