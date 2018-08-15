//
//  LoclizationExConstant.swift
//  Breeze-User
//
//  Created by admin on 12/4/17.
//  Copyright © 2017 CreativeMinds. All rights reserved.
//

import Foundation
 
typealias L0S  =   GetLocalizationValue
enum GetLocalizationValue {
    
    //Hyper
    case Currency
    
    
    //
    
     case Store_Name
    case Dropoff_Location
    case CheckOut
    case Add_Item
    case Pick_Up_Location
     case Delivery_Charges
    case Required_fields_cannot_be_left_Empty
     case SignOut
    case Total
    case Orders
    case Subtotal
    case Contact_Number
     case No_Pending_Requests
    case Fresh
    case Runner
    case Area
     case Cash_Only
    case List_Of_Items
     case Continue
    case Postal_Code
    case Street_Name
    case Edit
    case Country_
    case Submit
    case Please_fill_details
    case Support
    case Picked_Up
    case Pay
    case On_TheWay
    case District_
    case Home
    case Add_Address
    case Accepted
    case Building_Num
    case Floor_Num

    case Cancel_Order
    case Home_
    case City_
    case Apartment
    case Near_Landmark
     case _Add_Subtitution_
    case OK
    case Cancel
    case Favorites
    case Addresses
    case Use_Current_Location
    case Next_Step
    case Show_Password
    case Phone_number
    case E_mail
    case E_mail_
    case Name
    case User_name
    case User_name_
    case Please_Enter_your_location
    case Password
    case  Add_Info
    case Profile
    case UserName_
    case FirstName_
    case PhoneNumber_
    case Your_last_Name
    case Your_First_Name
    case Forgot_Password
    case Login
    case Sign_Up_With_Google
    case Sign_Up_With_Facebook
    case Sign_Up_With_Phone_or_Email
    case Already_have_an_account
    case Shop_now
    case Searching_for_Runner
    case Search
    case items_list_
    case All_copyrights_are_reserved_for_Breeze_app
    case Call_us
    case SMS
    case LastName_
    case Change_Password
 case Enter_your_Old_Password
    case Enter_yourـNew_Password
    case Old_Password
    case New_Password
    case Confirm_New_Password
    case Place_your_Order
    case You_have_no_Orders_History
    case No_Favorites_Places_yet_
    case No_Items_in_Cart
    case Add_To_Cart
    
    
    case Delivered
case  Phone_number_
    case Delivery_Address
    case No_Data_Found
    case NO_Data_Found
    case On_The_Way
    case Enter_Your_Text_Here
    case Transportation_
    case Register
    case Past_Orders
    case State
    case Your_Order_Status
    case Work_Hours_Per_Weel_
    case Call_Customer
    case View_Details
    case Profile_Photo
    case Mode_Of_Transportation_
    case Order_Details
    case Upload
    case Current_Orders
    case Upload_Photo
    case Availability_of_Start
    case View_More
    case Vehicle_Insurance
    case Time_Slots
    case Pending
    case Acceptedـ
    case One_The_Way
    case Arrived
    case Cancelled
    case NotAccepted
    case Car
    case Bike
    case Moped
    case MotorCycle
    case Truck
    case Today
    case This_Week
    case This_Month
    case Under_10_Hours
    case _10_to_20_Hours
    case _20_to_30_Hours
    case _30_to_40_Hours
    case moreThan_40_Hours
    case Go_Offline
    case Go_Online
    case _Code_
    case LicenseID_NationalID
    case VehicleID
    case Location_Type
    case preferedTimeDelTF
    case Done_Arrived
    case mobile_Number
    case landLineNumTF
    case shippingNotesTF
  
    func stringValue() -> String {
        switch self {
        case .shippingNotesTF:
            return  L102Language.currentAppleLanguage() == "ar" ? "تفاصيل أخري للنقل (إختيارى)": "Shipping Notes (Optional) "
        case .preferedTimeDelTF:
            return  L102Language.currentAppleLanguage() == "ar" ? "وقت التوصيل المفضل (إختيارى)": "Prefered Time (Optional)"
        case .mobile_Number:
            return  L102Language.currentAppleLanguage() == "ar" ? "رقم الجوال": "Mobile Number"
        case .landLineNumTF:
            return  L102Language.currentAppleLanguage() == "ar" ? "رقم الخط الأرضي (إختيارى)": "landline Number (Optional)"
        case .Currency:
            return  L102Language.currentAppleLanguage() == "ar" ? "جنيه": "EGP"
        case .Near_Landmark:
            return  L102Language.currentAppleLanguage() == "ar" ? "أماكن يستدل بها قريبة (إختيارى)": "Near Landmarks (Optional)"
        case .Location_Type:
            return  L102Language.currentAppleLanguage() == "ar" ? "نوع المكان": "Location Type"

        case .LicenseID_NationalID:
            return  L102Language.currentAppleLanguage() == "ar" ? "رقم الهويه/رقم الرخصه": "* National ID/ License ID"
        case .VehicleID:
            return  L102Language.currentAppleLanguage() == "ar" ? "* رقم المركبه": "* Vehicle ID"
        case ._Code_:
            return  L102Language.currentAppleLanguage() == "ar" ? "الكود": "*Code"
        case .Go_Offline:
            return  L102Language.currentAppleLanguage() == "ar" ? "إيقاف الخدمه": "Go OFFLINE"
        case .Go_Online:
            return  L102Language.currentAppleLanguage() == "ar" ? "تفعيل الخدمه": "Go Online"
        case .Under_10_Hours:
            return  L102Language.currentAppleLanguage() == "ar" ? "اقل من ١٠ ساعات": "Under 10 Hours"
        case ._10_to_20_Hours:
            return  L102Language.currentAppleLanguage() == "ar" ? "من ١٠ إلي ٢٠ ساعه": "10 to 20 Hours"
        case ._20_to_30_Hours:
            return  L102Language.currentAppleLanguage() == "ar" ? "من ٢٠ إلي ٣٠ ساعه": "20 to 30 Hours"
        case ._30_to_40_Hours:
            return  L102Language.currentAppleLanguage() == "ar" ? "من ٣٠ إلي ٤٠ ساعه": "30 to 40 Hours"
        case .moreThan_40_Hours:
            return  L102Language.currentAppleLanguage() == "ar" ? "اكثر من ٤٠ ساعه":
            "+40 Hours"
        case .Moped:
            return  L102Language.currentAppleLanguage() == "ar" ? "دراجه معدله": "Moped"
        case .MotorCycle:
            return  L102Language.currentAppleLanguage() == "ar" ? "دراجه ناريه": "Motor Cycle"
        case .Truck:
            return  L102Language.currentAppleLanguage() == "ar" ? "سياره نقل": "Truck"
        case .Today:
            return  L102Language.currentAppleLanguage() == "ar" ? "اليوم": "Today"
        case .This_Week:
            return  L102Language.currentAppleLanguage() == "ar" ? "ذلك الإسبوع": "This Week"
            
        case .This_Month:
            return  L102Language.currentAppleLanguage() == "ar" ? "ذلك الشهر": "This Month"
        case .Bike:
            return  L102Language.currentAppleLanguage() == "ar" ? "دراجه": "Bike"
            
        case .Done_Arrived:
            return  L102Language.currentAppleLanguage() == "ar" ? "سُلمت": "Delivered"
        case .Arrived:
            return  L102Language.currentAppleLanguage() == "ar" ? "إستُلمت": "Arrived"
        case .Cancelled:
            return  L102Language.currentAppleLanguage() == "ar" ? "إلغاء": "Cancelled"
        case .Acceptedـ:
            return  L102Language.currentAppleLanguage() == "ar" ? "مقبوله": "Accepted"
        case .One_The_Way:
            return  L102Language.currentAppleLanguage() == "ar" ? "في الطريق": "One_The_Way"
        case .NotAccepted:
            return  L102Language.currentAppleLanguage() == "ar" ? "مرفوضه": "NotAccepted"
         case .Pending:
            return  L102Language.currentAppleLanguage() == "ar" ? "معلقه": "Pending"
        case .Current_Orders:
            return  L102Language.currentAppleLanguage() == "ar" ? "الطلب الحالي": "Current Orders"
        case .Upload_Photo:
            return  L102Language.currentAppleLanguage() == "ar" ? "رفع الصوره": "Upload Photos"
        case .Availability_of_Start:
            return  L102Language.currentAppleLanguage() == "ar" ? "*الإستعداد للعمل": "*Availability of Start"
        case .View_More:
            return  L102Language.currentAppleLanguage() == "ar" ? "إظهار المزيد": "View More"
        case .Vehicle_Insurance:
            return  L102Language.currentAppleLanguage() == "ar" ? "تأمين المركبه": "Vehicle Insurance"
        case .Time_Slots:
            return  L102Language.currentAppleLanguage() == "ar" ? "جديده": "Time Slots:"
      
            
            
            
            
            
            
            
        case  .State :
            return  L102Language.currentAppleLanguage() == "ar" ? "حاله": "State"
        case  .Your_Order_Status :
            return  L102Language.currentAppleLanguage() == "ar" ? "حاله الطلب": "Your Order Status"
        case  .Work_Hours_Per_Weel_ :
            return  L102Language.currentAppleLanguage() == "ar" ? "*ساعات العمل بالإسبوع": "*Work Hours per Week"
        case  .Call_Customer :
            return  L102Language.currentAppleLanguage() == "ar" ? "إتصل بالعميل": "Call Customer"
        case  .View_Details :
            return  L102Language.currentAppleLanguage() == "ar" ? "إتصل بالعميل": "Call Customer"
        case  .Profile_Photo :
            return  L102Language.currentAppleLanguage() == "ar" ? "صوره المستخدم": "Profile Photo"
        case  .Mode_Of_Transportation_ :
            return  L102Language.currentAppleLanguage() == "ar" ? "نوع المواصله*": "*Mode of Transportation"
        case  .Order_Details :
            return  L102Language.currentAppleLanguage() == "ar" ? "تفاصيل الطلب": "Order Details"
        case  .Upload :
            return  L102Language.currentAppleLanguage() == "ar" ? "تحميل": "Upload"
            
            
            
        case  .NO_Data_Found :
            return  L102Language.currentAppleLanguage() == "ar" ? "لا توجد  بيانات": "No Data Found"
        case  .On_The_Way :
            return  L102Language.currentAppleLanguage() == "ar" ? "بالطريق": "On TheWay"
        case  .Enter_Your_Text_Here :
            return  L102Language.currentAppleLanguage() == "ar" ? "قم بالكتابه هنا": "Enter Your Text Here"
        case  .Transportation_ :
            return  L102Language.currentAppleLanguage() == "ar" ? "طريقه النقل:": "Transportation:"
        case  .Register :
            return  L102Language.currentAppleLanguage() == "ar" ? "التسجيل": "Register"
        case  .Past_Orders :
            return  L102Language.currentAppleLanguage() == "ar" ? "الطلبات السابقه": "Past Orders"
       
            
            
            
            
            
            
            
            
        case  .Delivered :
            return  L102Language.currentAppleLanguage() == "ar" ? "مسلَمه": "Delivered"
        case .Phone_number_:
            return  L102Language.currentAppleLanguage() == "ar" ? ":رقم الهاتف": "Phone number: "
        case  .Delivery_Address :
            return  L102Language.currentAppleLanguage() == "ar" ? "مكان التسليم": "Delivery Address"
        case  .No_Data_Found :
            return  L102Language.currentAppleLanguage() == "ar" ? "لا توجد  بيانات": "No Data Found"
            
            
            
            
            
        case  .Add_To_Cart :
            return  L102Language.currentAppleLanguage() == "ar" ? "أضف إلي العربه": "Add To Cart"
        case  .No_Items_in_Cart :
            return  L102Language.currentAppleLanguage() == "ar" ? "لا توجد طلبات بالعربه": "No Items in Cart"

        case  .No_Favorites_Places_yet_ :
            return  L102Language.currentAppleLanguage() == "ar" ? "ليس لديك اماكن مفضله بعد": "No Favorites Places yet!!"
        case  .You_have_no_Orders_History :
            return  L102Language.currentAppleLanguage() == "ar" ? "ليس لديك طلبات سابقه": "You have no Orders History"

        case .Place_your_Order:
            return  L102Language.currentAppleLanguage() == "ar" ? "قم بإضافه طلبك": "Place your Order"
        case .Change_Password:
            return  L102Language.currentAppleLanguage() == "ar" ? "نغيير كلمه المرور": "Change Password"
        case .Enter_your_Old_Password:
            return  L102Language.currentAppleLanguage() == "ar" ? "ادخل كلمه السر القديمه": "Enter your Old Password"
        case .Enter_yourـNew_Password:
            return  L102Language.currentAppleLanguage() == "ar" ? "ادخل كلمه السر الجديده": "Enter your New Password"

        case .Old_Password:
            return  L102Language.currentAppleLanguage() == "ar" ? "كلمه المرور القديمه": "Old Password"
        case .New_Password:
            return  L102Language.currentAppleLanguage() == "ar" ? "كلمه المرور الجديده": "New Password"
        case .Confirm_New_Password:
            return  L102Language.currentAppleLanguage() == "ar" ? "التأكد من كلمه المرور الجديده": "Confirm New Password"
        
        case .LastName_:
            return  L102Language.currentAppleLanguage() == "ar" ? "اللقب": "Last Name:"
        case .Dropoff_Location:
            return  L102Language.currentAppleLanguage() == "ar" ? "مكان التسليم": "dropoff Location"
        case .Pick_Up_Location:
            return  L102Language.currentAppleLanguage() == "ar" ? "مكان الإستلام": "Pick Up Location"
            
        case .CheckOut:
            return  L102Language.currentAppleLanguage() == "ar" ? "إتمام الطلب": "CheckOut"
        case .Add_Item:
            return  L102Language.currentAppleLanguage() == "ar" ? "إضافه صنف": "Add Item"
        
        case .Delivery_Charges:
            return  L102Language.currentAppleLanguage() == "ar" ? "مصاريف التوصيل": "Delivery Charges"
         
        
        case .SignOut:
            return  L102Language.currentAppleLanguage() == "ar" ? "تسجيل الخروج": "SignOut"
        case .Total:
            return  L102Language.currentAppleLanguage() == "ar" ? "الإجمالي": "Total"
        case .Orders:
            return  L102Language.currentAppleLanguage() == "ar" ? "الطلبات": "Orders"
        case .Subtotal:
            return  L102Language.currentAppleLanguage() == "ar" ? "المجموع": "Subtotal"
        case .Contact_Number:
            return  L102Language.currentAppleLanguage() == "ar" ? "   * رقم الإتصال": "   * Contact Number"
        
        case .No_Pending_Requests:
            return  L102Language.currentAppleLanguage() == "ar" ? "لا توجد طلبات معلقه": "No Pending Requests"
        case .Fresh:
            return  L102Language.currentAppleLanguage() == "ar" ? "جديده": "Fresh"
            
            
        case .Runner:
            return  L102Language.currentAppleLanguage() == "ar" ? "سائق": "Runner"
        case .Area:
            return  L102Language.currentAppleLanguage() == "ar" ? "*منطقه": "   * Area"
       
        case .Cash_Only:
            return  L102Language.currentAppleLanguage() == "ar" ? "نقداً فقط": "Cash Only"
        case .List_Of_Items:
            return  L102Language.currentAppleLanguage() == "ar" ? "قائمه الطلبات ": "List Of Items"
        
        case .Continue:
            return  L102Language.currentAppleLanguage() == "ar" ? "أكمل": "Continue"
        case .Postal_Code:
            return  L102Language.currentAppleLanguage() == "ar" ? "*الرقم البريدي": "   * Postal Code"
        case .Street_Name:
            return  L102Language.currentAppleLanguage() == "ar" ? "*إسم الشارع": "   * Street Name"
        case .Cancel :
            return  L102Language.currentAppleLanguage() == "ar" ? "إلغاء": "Cancel"
            
        case .Edit:
            return  L102Language.currentAppleLanguage() == "ar" ? "تعديل": "Edit"
        case .Country_:
            return  L102Language.currentAppleLanguage() == "ar" ? "*الدوله": "   * Country"
        case .Submit:
            return  L102Language.currentAppleLanguage() == "ar" ? "إرسال": "Submit"
        case .Please_fill_details:
            return  L102Language.currentAppleLanguage() == "ar" ? "من فضلك قم باكمال البيانات": "Please fill details"
        case .Support:
            return  L102Language.currentAppleLanguage() == "ar" ? "الدعم الفني": "Support"
            
        case .Picked_Up:
            return  L102Language.currentAppleLanguage() == "ar" ? "تم الإستلام": "Picked Up"
        case .Pay:
            return  L102Language.currentAppleLanguage() == "ar" ? "دفع": "Pay"
        case .On_TheWay:
            return  L102Language.currentAppleLanguage() == "ar" ? "في الطريق": "On TheWay"
        case .District_:
            return  L102Language.currentAppleLanguage() == "ar" ? "*المنطقه": "   * District"
            
        case .Home:
            return  L102Language.currentAppleLanguage() == "ar" ? "الرئيسيه": "Home"
        case .Add_Address:
            return  L102Language.currentAppleLanguage() == "ar" ? "إضافه عنوان": "  Add Address"
        case .Accepted:
            return  L102Language.currentAppleLanguage() == "ar" ? "قبول": "Accepted"
        case .Floor_Num:
            return  L102Language.currentAppleLanguage() == "ar" ? "رقم الطابق (إختيارى)": "Floor Number (Optional)"
        case .Building_Num:
            return  L102Language.currentAppleLanguage() == "ar" ? " (إختيارى)رقم البناية": "Building Number (Optional)"
         case .Cancel_Order:
            return  L102Language.currentAppleLanguage() == "ar" ? "إلغاء الطلب": "Cancel Order"
        case .Home_:
            return  L102Language.currentAppleLanguage() == "ar" ? "    الرئيسيه": "    Home"
        case .City_:
            return  L102Language.currentAppleLanguage() == "ar" ? "*المدينه": "   * City"
        case .Apartment:
            return  L102Language.currentAppleLanguage() == "ar" ? "رقم الشقة (إختيارى)": "Apartment Number (Optional)"

        case ._Add_Subtitution_:
            return  L102Language.currentAppleLanguage() == "ar" ? "طلب إستبدال *إختياري": "Add Subtitution \"Optional\""
        case .OK:
            return  L102Language.currentAppleLanguage() == "ar" ? "نعم": "Ok"
        case .Favorites:
            return  L102Language.currentAppleLanguage() == "ar" ? "المفضلات": "Favorites"
        case .Addresses:
            return  L102Language.currentAppleLanguage() == "ar" ? "العناوين": "Addresses"
        case .Use_Current_Location:
            return  L102Language.currentAppleLanguage() == "ar" ? "إستخدام الموقع الحالي": "Use Current Location"
        case .Next_Step:
            return  L102Language.currentAppleLanguage() == "ar" ? "التالي": "Next Step"
        case .Show_Password:
            return  L102Language.currentAppleLanguage() == "ar" ? "إظهار كلمه المرور": "Show Password"
        case .Phone_number:
            return  L102Language.currentAppleLanguage() == "ar" ? "رقم الهاتف": "Phone number"
        case .E_mail:
            return  L102Language.currentAppleLanguage() == "ar" ? "الإيميل": "E-mail"
        case .E_mail_:
            return  L102Language.currentAppleLanguage() == "ar" ? "البريد الإلكتروني:": "E-mail :"

        case .Name:
            return  L102Language.currentAppleLanguage() == "ar" ? "الإسم كامل": "Full Name"
        case .User_name:
            return  L102Language.currentAppleLanguage() == "ar" ? "اللقب": "User name"
        case .User_name_:
            return  L102Language.currentAppleLanguage() == "ar" ? "إسم المستخدم:": "User name:"
        case .Please_Enter_your_location:
            return  L102Language.currentAppleLanguage() == "ar" ? "من فضلك قم بإدخال موقعك": "Please Enter your location"
        case .Password:
            return  L102Language.currentAppleLanguage() == "ar" ? "كلمه المرور": "Password"
        case .Add_Info:
            return  L102Language.currentAppleLanguage() == "ar" ? "إضافه معلومات أخري": "Add Info"
            
        case .Profile:
            return  L102Language.currentAppleLanguage() == "ar" ? "الصفحه الشخصيه": "Profile"
        case .UserName_:
            return  L102Language.currentAppleLanguage() == "ar" ? "اللقب: ": "UserName:"
        case .FirstName_:
            return  L102Language.currentAppleLanguage() == "ar" ? "الإسم : ": "FirstName:"
        case .PhoneNumber_:
            return  L102Language.currentAppleLanguage() == "ar" ? "رقم الهاتف : ": "PhoneNumber:"
        case .Your_last_Name:
            return  L102Language.currentAppleLanguage() == "ar" ? "اللقب:": "Your last Name"
        case .Your_First_Name:
            return  L102Language.currentAppleLanguage() == "ar" ? "الإسم الأول": "Your First Name"
        case .Forgot_Password:
            return  L102Language.currentAppleLanguage() == "ar" ? "نسيت كلمه المرور؟": "Forgot_Password?"
        case .Login:
            return  L102Language.currentAppleLanguage() == "ar" ? "تسجيل الدخول": "Login"
            
        case .Sign_Up_With_Google:
            return  L102Language.currentAppleLanguage() == "ar" ? "تسجيل الدخول بجوجل": "Sign Up With Google"
        case .Sign_Up_With_Facebook:
            return  L102Language.currentAppleLanguage() == "ar" ? "تسجيل دخول بالفيس بوك": "Sign Up With Facebook"
        case .Sign_Up_With_Phone_or_Email:
            return  L102Language.currentAppleLanguage() == "ar" ? "تسجيل الدخول بالإيميل أو الهاتف": "Signup with phone or Email"
        case .Already_have_an_account:
            return  L102Language.currentAppleLanguage() == "ar" ? "لديك حساب؟ دخول": "Already have an account? Login"
        case .Shop_now:
            return  L102Language.currentAppleLanguage() == "ar" ? "إشترك الإن": "Shop now"
        case .Searching_for_Runner:
            return  L102Language.currentAppleLanguage() == "ar" ? "الإسم": "Name"
        case .Search:
            return  L102Language.currentAppleLanguage() == "ar" ? "بحث": "Search"
        case .items_list_ :
            return  L102Language.currentAppleLanguage() == "ar" ? "قائمه الطلبات:": "items list :"
        case .All_copyrights_are_reserved_for_Breeze_app :
            return  L102Language.currentAppleLanguage() == "ar" ? "جميع الحقوق محفوظه لـ Breeze App": "All copyrights are reserved for Breeze app"
            
        case .Call_us:
            return  L102Language.currentAppleLanguage() == "ar" ? "قم بالإتصال بنا": "Call us"

        case .SMS:
            return  L102Language.currentAppleLanguage() == "ar" ? "إرسال رساله نصيه": "SMS"

        case .Store_Name:
            return  L102Language.currentAppleLanguage() == "ar" ? "إسم المتجر": "Store Name"
        case .Required_fields_cannot_be_left_Empty:
            return  L102Language.currentAppleLanguage() == "ar" ? "*جميع الحقول مطلوبه": "* Required fields cannot be left empty"
        case .Car:
            return  L102Language.currentAppleLanguage() == "ar" ? "سياره": "Car"
         }
    }
}
