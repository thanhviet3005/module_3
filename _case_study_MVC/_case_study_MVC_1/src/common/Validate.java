package common;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validate {
    private static Pattern pattern;
    private static Matcher matcher;

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private static final String REGEX_ID_CARD = "^(\\d{9}|\\d{12})$";
    private static final String REGEX_PHONE = "^(09|\\(84\\)\\+9)[01]\\d{7}$";
    private static final String REGEX_CUSTOMER_ID ="^(KH-)\\d{4}$";
    private static final String REGEX_DATE = "^\\d{4}(\\/|-)\\d{2}(\\/|-)\\d{2}$";
    private static final String REGEX_EMAIL = "^\\w{3,}(\\.?\\w+)*@[a-z]{2,7}(.[a-z]{2,5}){1,3}$";

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public static boolean checkCustomerIDCard(String string){
        pattern = Pattern.compile(REGEX_ID_CARD);
        matcher = pattern.matcher(string);
        return matcher.matches();
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public static boolean checkPhoneNumber(String string){
        pattern = Pattern.compile(REGEX_PHONE);
        matcher = pattern.matcher(string);
        return matcher.matches();
    }



//__+__+__+__+__+__+__+__+__+__+__+__+__
//__+__+__+__+__+__+__+__+__+__+__+__+__
}
