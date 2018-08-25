//
//  Localization_Alerts.swift
//  Breeze-User
//
//  Created by Mohamed Eshra on 04/12/2017.
//  Copyright © 2017 CreativeMinds. All rights reserved.
//

import Foundation

typealias L0A  = GetAlertsLocalize
enum GetAlertsLocalize {
    
    
    //Hyper
    case off
    case netWorkError
    case No_Colors_Available
    case Add_To_Cart
    case Visit_Category
    case Visit_Brand
    case Share
    case Cancel
    case All_Brands
    case All_Categories
    case Brands
    case Categories
    case Colors
    case price
    case Item
    case related_Item
    case No_reviews_Yet
    case My_Order
    case Edit
    case Address_Book
    case Rate_US
    case My_Review
     case Installment
    case Sign_out
        case remove_From_Cart
    case in_Processing
    case shipped
    case delivered
    case canceled
    case confirmed
    case shipmment_Num
    case Order_Details
    case deliveryDate
    case Write_Here
     case Thanks_for_your_review
    case lang
    case no_fit
    case piece_Mea
    ///
    case Searching_for_Runner
    case Your_Order_has_been_Pickedup
    case YourـOrderـisـonـtheـway
    case OrderـhasـbeenـDelivered
    case Check_you_Orders_History_for
    case Your_Order_has_been_Canceled
    case Couldnt_find_a_Nearby_Runner
    case Please_try_again
    case Couldnt_find_Data
    case NO_Data_to_Preview
    case Couldnt_found_data
    case Cannot_get_runner_position
    case Error
    case Sorry
    case Couldnt_find_the_runner_PhoneNumber
    case Couldnt_find_phone
    case Address_is_required
    case Phone_number_is_required
    case No_Changes_has_Been_Made
    case Youـwillـbeـnotified
    case Done
    case Delete
    case RequiredـField
    case Cancel_Order
    case Cancelled_By_Resturant
    case Cancelled_By_Me
    case Order_Cancelled_By_Runner
    case Order_has_Been_Submitted
    case Order_Summary
    case Attension
    case Are_you_sure
    case Empty_Field
    case Name_Field_Can_not_be_Empty
    case UserName_Can_not_be_Empty
    case Invalid_Email
    case PhoneNumber_Can_not_be_Empty
    case Invalid_Password_
    case Could_Not_Send_Email
    case Your_device_could_not_send_E_mail
    case Field_Can_not_be_Empty
    case Pickup_Location_is_Required
    case Shop_Name_is_Required
    case  Order_Cannot_be_Empty
    case No_Orders_
    case You_have_to_have_at_least_one_order_Request
    case No_Dropoff_
    case You_have_to_have_to_set_a_Dropoff_Point
    case Warning
    case Invalid_Email_Format
    case Password_has_to_contain_more_than_characters
    case Please_Check_your_E_mail
    case Are_you_sure_you_want_to_call
    case Yes
    case No
    case Allow_Camera_Access_will_relaunch_the_app
    case This_app_isnot_authorized_to_use_Camera
    case Setting
    case Success
    case Your_Order
    case Please_input_your_Order
    case Confirm
    case Are_you_sure_you_wanna_delete_this_order
    case Photos_Gallery
    case Camera
    case Select_your_image_from_
    case Sorry_This_Device_Has_No_Camera
    case No_Camera
    case Couldnot_Login
    case Mail_services_are_not_available_On_your_Device
    case Messaging_services_are_not_available_On_your_Device
    case Calling_services_are_not_available_On_your_Device
    case Coming_Soon
    case  Password_Doesnot_Match
    case You_must_pick_an_address
    case Order_has_Been_Submitted_Successfully
    case Guide
    case Guide_
    case Couldnnot_find_profile_Please_check_your_network
    case Name_has_toContain_AtLeast_3_
    case User_Has_Canceled_Your_Ride
    case You_Didnnot_Pickup_order_yet
    case You_didnnot_mark_the_order_as_Delivered_yet
    case Done_With_Order
    case PhoneNumber_has_toContain_AtLeast_3_
    case Country_Code_is_Required
    case Have_You_Read_Our_Terms
    case Please_Check_Your_Email_for_New_password
    case All_Details_Are_Required
    case Please_Upload_The_Reqired_Photos
    case New_Password_hasBeen_Confirmed
    case Cancel_Order_
    case Order_canceled_By_Resturant
    case Order_Canceled_By_Me
    case Order_Cancelled_By_User
    case Home
    case Business
    case Nom_of_Deliveries_done
    case You_Are_Offline
    case Couldnot_logout_user_Please_try_again
    case Morning
    case Afternoon
    case Evening
    case Night
    case LicenseID_Is_Required
    case LicenseID_AlreadyExist
    case Coupon_is_applied
    case please_check_value_twice_before_payment
    case VehicleID_Is_Required
    case Hot_Products
    case New_Arrivals
    case invalid_Mobile_Number
    case City_Fields_is_Required
    case Area_Fields_is_Required
    case Street_Fields_is_Required
    case Location_Fields_is_Required
    case about_us
    case body
    case piece
    case tell_Us
    case awesome
    case awesomeText
    case perfect
    case perfectTxt
    case onSize
    case onSizeTxt
    case measureOnce
    case measureOnceTxt
    case Chest
    case Measure_your_chest
case return_Policy
     case Waist
    case hips
    case Measure_your_waist
    case Measure_your_length
    case Measure_your_hips
case Shirt_Length
    func stringValue() -> String {
        switch self {
        //Hyper
        case .Chest:
            return  L102Language.currentAppleLanguage() == "ar" ? "صدر": "Chest"
        case .Measure_your_chest:
            return  L102Language.currentAppleLanguage() == "ar" ? "قياس صدر في أوسع نقطة الوقوف في وضع مريح مع الإستنشاق": "Measure your chest at the widest point.Stand in a relaxed posture and breath out."

        case .Waist:
            return  L102Language.currentAppleLanguage() == "ar" ? "وسط": "Waist"
        case .Measure_your_waist:
            return  L102Language.currentAppleLanguage() == "ar" ? "(قياس الخصر الخاص بك فقط فوق زر البطن أو عند نقطة ضيقة (الوقوف في وضع مستقيم مع الإسترخاء والزفير": "Measure your waist just above your belly button. or at the narrow point. (Stand staight and relaced posture and breathe out"

        case .hips:
            return  L102Language.currentAppleLanguage() == "ar" ? "الفخذين": "Hips"
        case .Measure_your_hips:
            return  L102Language.currentAppleLanguage() == "ar" ? "خذ قياس محيط حول الفخذين أوسع نطاق": "Take the circumference measurement around your hips at the widest part."

        case .Shirt_Length:
            return  L102Language.currentAppleLanguage() == "ar" ? "طول القميص": "Shirt Length"
        case .Measure_your_length:
            return  L102Language.currentAppleLanguage() == "ar" ? "قياس طول الجسم العلوي من الكتف إلي الفخذين": "Measure your Top Body Length from shoulder to Hips."

 
            
        case .awesome:
            return  L102Language.currentAppleLanguage() == "ar" ? "عروض مذهلة في إنتظاركم": "AWESOME DEALS Waiting for You."

        case .awesomeText:
            return  L102Language.currentAppleLanguage() == "ar" ? "خطوة واحدة فقط ولن تفوتكم العروض , دعنا نلائمك": "Only one step and you will never miss a deal let's fit you"

        case .perfect:
            return  L102Language.currentAppleLanguage() == "ar" ? "ملاءمة مضمونة": "Perfect Fit Guaranteed"

        case .perfectTxt:
            return  L102Language.currentAppleLanguage() == "ar" ? "إرتداء الملابس المثالية هي تعزيز للثقة, يجب علي الجميع تجربتها": "To Wear Clothes With a Perfect Fit is a Confidence Boost Everyone Should Experience."

        case .onSize:
            return  L102Language.currentAppleLanguage() == "ar" ? "مقاس واحد فقط ": "One Size Only _ Yours"

        case .onSizeTxt:
            return  L102Language.currentAppleLanguage() == "ar" ? "الحصول علي إمكانية الوصول الفوري إلي مقاسك في العلامات التجارية المفضلة لك": "Get instand Adccess to Your Size on your Favorite Brands."

        case .measureOnce:
            return  L102Language.currentAppleLanguage() == "ar" ? "قم بالقياس لمرة واحدة واطلب للأبد": "Measure Once Order Forever."

        case .measureOnceTxt :
            return  L102Language.currentAppleLanguage() == "ar" ? "شارك ٥ دقائق من وقتك لإعداد نموذج قياس": "Engage 5min of your Time and setup a Measurement profile."

            
        case .piece_Mea :
             return  L102Language.currentAppleLanguage() == "ar" ? "قياس أجزاء جسمك \n والحصول علي المثالية": "Tell us about a Piece\n that fit you Perfectly"
            
        case .body:
            return  L102Language.currentAppleLanguage() == "ar" ? "قياس الجسم": "Piece Measurement"

        case .piece:
            return  L102Language.currentAppleLanguage() == "ar" ? "قياس قطعة": "Body Measurement"

        case .tell_Us:
            return  L102Language.currentAppleLanguage() == "ar" ? "إخبرنا عن قطعه تناسبك": "Measure your Body parts\n and get the perfect fit size."

            
        case .return_Policy:
            return  L102Language.currentAppleLanguage() == "ar" ? "سياسة المرتجعات": "Return Policy"

        case .netWorkError:
            return  L102Language.currentAppleLanguage() == "ar" ? "مشكله بالإتصال برجاء التحقق من الشبكة": "Network Failer,Please check your Network"
        case .no_fit:
            return  L102Language.currentAppleLanguage() == "ar" ? "لم نستطع ايجاد قطع ملائمة لك حتي الآن": "We couldn't find your fit for now."

        case .lang:
            return  L102Language.currentAppleLanguage() == "ar" ? "اللغة": "Language"
        case .about_us:
            return  L102Language.currentAppleLanguage() == "ar" ? "من نحن": "About Us"
        case .shipmment_Num:
            return  L102Language.currentAppleLanguage() == "ar" ? "رقم الشحنة : ": "Shippment No : "
        case .Order_Summary:
            return  L102Language.currentAppleLanguage() == "ar" ? "ملخص الطلب": "Order Summary"
            case .Order_Details:
            return  L102Language.currentAppleLanguage() == "ar" ? "تفاصيل الطلب": "Order Details"

        case .deliveryDate:
            return  L102Language.currentAppleLanguage() == "ar" ? "تاريخ الوصول": "delivery Date"
        case .Business:
            return  L102Language.currentAppleLanguage() == "ar" ? "عمل": "Business"
        case .off:
            return  L102Language.currentAppleLanguage() == "ar" ? "خصم": "Off"
            
        case .Thanks_for_your_review:
            return  L102Language.currentAppleLanguage() == "ar" ? "شكراً ,تقييمك يهمنا": "Thank you for rating us."
            

        case .Write_Here:
            return  L102Language.currentAppleLanguage() == "ar" ? "قم بالكتابة تعليقك هنا": "Write Here..."

        case .confirmed:
            return  L102Language.currentAppleLanguage() == "ar" ? "مأكد": "Confirmed"

        case .in_Processing:
            return  L102Language.currentAppleLanguage() == "ar" ? "قيد التنفيذ": "in Processing"
        case .shipped:
            return  L102Language.currentAppleLanguage() == "ar" ? "قيد التوصبل": "Shipped"
        case .delivered:
            return  L102Language.currentAppleLanguage() == "ar" ? "مُسلم": "Delivered"
        case .canceled:
            return  L102Language.currentAppleLanguage() == "ar" ? "ملغى": "Canceled"

        case .Location_Fields_is_Required:
            return  L102Language.currentAppleLanguage() == "ar" ? "حقل نوع المكان مطلوب": "Location Type Field is Requried"
        case .Street_Fields_is_Required:
            return  L102Language.currentAppleLanguage() == "ar" ? "حقل الشارع مطلوب": "Street Field is Requried"
        case .invalid_Mobile_Number:
            return  L102Language.currentAppleLanguage() == "ar" ? "رقم الجوال غير صحيح": "invalid Mobile Number"
        case .City_Fields_is_Required:
            return  L102Language.currentAppleLanguage() == "ar" ? "حقل المدينة مطلوب": "City Field is Requried"
        case .Area_Fields_is_Required:
            return  L102Language.currentAppleLanguage() == "ar" ? "حقل المنطقة مطلوب": "Area Field is Requried"
        case .Hot_Products:
            return  L102Language.currentAppleLanguage() == "ar" ? "المنتجات الأكثر شعبية": "Hot Products"
        case .New_Arrivals:
            return  L102Language.currentAppleLanguage() == "ar" ? "المنتجات الأكثر حداثة": "New Arrivals"

        case .No_reviews_Yet:
            return  L102Language.currentAppleLanguage() == "ar" ? "لا توجد تعليقات بعد": "No Reviews Yet."

        case .related_Item:
            return  L102Language.currentAppleLanguage() == "ar" ? "منتجات ذات صله": "Related Items"
        case .remove_From_Cart:
            return  L102Language.currentAppleLanguage() == "ar" ? "إزاله من العربة": "Remove from Cart"
        case .Item:
            return  L102Language.currentAppleLanguage() == "ar" ? "المنتج": "Item"

        case .Brands:
            return  L102Language.currentAppleLanguage() == "ar" ? "الماركات": "Brands"
            
        case .Categories:
            return  L102Language.currentAppleLanguage() == "ar" ? "الأصناف": "Categories"
            
        case .Colors:
            return  L102Language.currentAppleLanguage() == "ar" ? "الألوان": "Colors"
        case .price:
            return  L102Language.currentAppleLanguage() == "ar" ? "السعر": "Price"
            
        case .No_Colors_Available :
            return  L102Language.currentAppleLanguage() == "ar" ? "لا توجد ألوان متوفرة": "No Colors Available"
        case .Add_To_Cart :
            return  L102Language.currentAppleLanguage() == "ar" ? "إضافه إلي العربة": "Add to Cart"
        case .Visit_Brand :
            return  L102Language.currentAppleLanguage() == "ar" ? "الذهاب إلي الماركات": "Visit Brand"
        case .Visit_Category :
            return  L102Language.currentAppleLanguage() == "ar" ? "الذهاب إلي الأقسام": "Vist Category"
 
        case .Cancel:
            return  L102Language.currentAppleLanguage() == "ar" ? "إلغاء": "Cancel"
        case .Share:
            return  L102Language.currentAppleLanguage() == "ar" ? "مشاركة": "Share"
        case .All_Brands:
            return  L102Language.currentAppleLanguage() == "ar" ? "الماركات": "Brands"
        case .All_Categories:
            return  L102Language.currentAppleLanguage() == "ar" ? "الأقسام": "Categories"
         
            
        case .My_Order:
            return  L102Language.currentAppleLanguage() == "ar" ? "طلباتي": "My Orders"
            
        case .Edit:
            return  L102Language.currentAppleLanguage() == "ar" ? "تعديل": "Edit"
            
        case .Address_Book:
            return  L102Language.currentAppleLanguage() == "ar" ? "عناويني": "Address Book"
            
        case .Rate_US:
            return  L102Language.currentAppleLanguage() == "ar" ? "قيمنا": "Rate us"
            
        case .My_Review:
            return  L102Language.currentAppleLanguage() == "ar" ? "تقييماتي": "My Reviews"
            
        case .Installment:
            return  L102Language.currentAppleLanguage() == "ar" ? "طرق الدفع": "Installment"
            
        case .Sign_out:
            return  L102Language.currentAppleLanguage() == "ar" ? "خروج": "Sign out"
            //
        case .please_check_value_twice_before_payment:
            return  L102Language.currentAppleLanguage() == "ar" ? "برجاء مراجعة الحساب جيدا قبل الدفع": "please check value twice before payment"
        case .Coupon_is_applied:
            return  L102Language.currentAppleLanguage() == "ar" ? "تم تطبيق كوبون خصم": "Coupon is applied"
        case .VehicleID_Is_Required:
            return  L102Language.currentAppleLanguage() == "ar" ? "برجاء ادخال رخصه المركبه صحيح": "Please Enter the Vehicle License}"
        case .LicenseID_AlreadyExist:
            return  L102Language.currentAppleLanguage() == "ar" ? "رقم الهويه موجود بالفعل": "ID Already Exist"
        case .LicenseID_Is_Required:
            return  L102Language.currentAppleLanguage() == "ar" ? "برجاء ادخال رقم هوية صحيح": "Please Enter a valid ID"
        case .Morning:
            return  L102Language.currentAppleLanguage() == "ar" ? "صباحاً": "Morning"
        case .Afternoon:
            return  L102Language.currentAppleLanguage() == "ar" ? "ظهرا": "Afternoon"
        case .Evening:
            return  L102Language.currentAppleLanguage() == "ar" ? "مساءا": "Evening"
        case .Night:
            return  L102Language.currentAppleLanguage() == "ar" ? "منتصف الليل": "Night"
        case .Couldnot_logout_user_Please_try_again:
            return  L102Language.currentAppleLanguage() == "ar" ? "لا يمكنك تسجيل الخروج وهناك طلب قيد التنفيذ": "Couldn't logout user,Please try again"
        case .You_Are_Offline:
            return  L102Language.currentAppleLanguage() == "ar" ? "خدمة استقبال الطلبات غير مفعلة": "You'r Offline"
        case .Nom_of_Deliveries_done:
            return  L102Language.currentAppleLanguage() == "ar" ? "عدد الطلبات المنفذه": "No: of Deliveries done "
        case .New_Password_hasBeen_Confirmed:
            return  L102Language.currentAppleLanguage() == "ar" ? "كلمه المرور الجديده تم تفعيلها": "New Password has been Confirmed."
        case .Order_canceled_By_Resturant:
            return  L102Language.currentAppleLanguage() == "ar" ? "تم إلغاء الطلب من جهة المطعم": "Order Cancelled by Restaurent"
        case .Order_Canceled_By_Me:
            return  L102Language.currentAppleLanguage() == "ar" ? "إلغاء الطلب": "Order Cancelled by Me"
        case .Home:
            return  L102Language.currentAppleLanguage() == "ar" ? "الصفحه الرئيسيه": "Home"
//        case .Couldnot_Login:
//            return  L102Language.currentAppleLanguage() == "ar" ? "خطأ في الدخول": "Couldn't Login"
//
            
            
            
        case .Country_Code_is_Required :
            return  L102Language.currentAppleLanguage() == "ar" ? "كود الدوله مطلوب": "Country Code is Required"
            
        case .Have_You_Read_Our_Terms :
            return  L102Language.currentAppleLanguage() == "ar" ? "هل قمت بقراء الشروط والأحكام؟": "Have you read our Terms."
            
        case .Please_Check_Your_Email_for_New_password :
            return  L102Language.currentAppleLanguage() == "ar" ? "تم إرسال كلمه المرور الجديده إلي بريدكم الإلكتروني": "Please check your Email for the new Password"
            
        case .All_Details_Are_Required :
            return  L102Language.currentAppleLanguage() == "ar" ? "جميع البيانات مطلوبه": "All Details are required"
            
        case .Please_Upload_The_Reqired_Photos :
            return  L102Language.currentAppleLanguage() == "ar" ? "من فضلك قم بإختيار الصور المطلوبه": "Please upload the reqired Photos"
            
        case .PhoneNumber_has_toContain_AtLeast_3_ :
            return  L102Language.currentAppleLanguage() == "ar" ? "يجب ان يحتوي رقم الجوال علي الاقل علي ٩ احرف": "Phone number has to contain more than 9 characters"

        case .Guide :
            return  L102Language.currentAppleLanguage() == "ar" ? "Tap on the label to update it with your new info": "Guide"
        case .Guide_ :
            return  L102Language.currentAppleLanguage() == "ar" ? "قم بالضغط علي الحقل لتعديله": "Tap on the label to update it with your new info"
        case .Couldnnot_find_profile_Please_check_your_network :
            return  L102Language.currentAppleLanguage() == "ar" ? "لم نستطع تحميل ملفك ٫برجاء التاكد من الإتصال بشبكه الإنترنت": "Couldn't find profile,Please check your network"
        case .Name_has_toContain_AtLeast_3_ :
            return  L102Language.currentAppleLanguage() == "ar" ? "يجب ان يحتوي الإسم علي الاقل علي ٣ احرف": "Name has to be more than 3 characters"
        case .User_Has_Canceled_Your_Ride :
            return  L102Language.currentAppleLanguage() == "ar" ? "العميل قام بالغاء الطلب": "The User Has Cancel your Ride"
        case .You_Didnnot_Pickup_order_yet :
            return  L102Language.currentAppleLanguage() == "ar" ? "لم تقم بإستلام الطلب بعد": "You didn't pickup the Order yet"
        case .You_didnnot_mark_the_order_as_Delivered_yet :
            return  L102Language.currentAppleLanguage() == "ar" ? "برجاء توصيل الطلب أولا": "You didn't mark the order as Delivered yet"
        case .Done_With_Order :
            return  L102Language.currentAppleLanguage() == "ar" ? "إنهاء الطلب؟": "Done With Order?"

        case .Order_has_Been_Submitted_Successfully :
            return  L102Language.currentAppleLanguage() == "ar" ? "تم إرسال الطلب بنجاح": "Order has Been Submitted Successfully"
            
        case .You_must_pick_an_address :
            return  L102Language.currentAppleLanguage() == "ar" ? "يجب ان تختار عنوان": "you must pick an address"
        case .Coming_Soon :
            return  L102Language.currentAppleLanguage() == "ar" ? "ترقبونا قريباً": "Coming Soon"
        case .Mail_services_are_not_available_On_your_Device :
            return  L102Language.currentAppleLanguage() == "ar" ? "البريد الالكتروني غير مسجل بالجهاز,برجاء تفقد إعدادات الجهاز": "Mail services are not available On your Device"
        case .Messaging_services_are_not_available_On_your_Device :
            return  L102Language.currentAppleLanguage() == "ar" ? "خدمه إرسال الرسائل غير مفعله بجهازك برجاء تفقد الإعدادات": "Messaging services are not available On your Device"
        case .Calling_services_are_not_available_On_your_Device :
            return  L102Language.currentAppleLanguage() == "ar" ? "خدمه الإتصال غير مفعله بجهازك برجاء تفقد الإعدادات": "Calling services are not available On your Device"
        case .Couldnot_Login:
            return  L102Language.currentAppleLanguage() == "ar" ? "خطأ في الدخول": "Couldn't Login"
        case .Your_Order_has_been_Pickedup:
            return  L102Language.currentAppleLanguage() == "ar" ? "طلبك تم تسليمه للسائق": "Your Order has been Pickedup"
        case .YourـOrderـisـonـtheـway:
            return  L102Language.currentAppleLanguage() == "ar" ? "طلبك في الطريق": "Your Order is on the way"
        case .OrderـhasـbeenـDelivered:
            return  L102Language.currentAppleLanguage() == "ar" ? "تم تسليم الطلب": "Order has been Delivered"
        case .Check_you_Orders_History_for:
            return  L102Language.currentAppleLanguage() == "ar" ? "تفقذ تاريخ الطلبات لقراءة تفاصيل الطلب": "Check you Orders History for the Order Details"
        case .Your_Order_has_been_Canceled:
            return  L102Language.currentAppleLanguage() == "ar" ? "تم الغاء طلبك": "Your Order has been Canceled"
        case .Couldnt_find_a_Nearby_Runner:
            return  L102Language.currentAppleLanguage() == "ar" ? "لم نستطع ايجاد سائق بالقرب منك": "Couldn't find a Nearby Runner"
        case .Please_try_again:
            return  L102Language.currentAppleLanguage() == "ar" ? "من فضلك جرب البحث مجددا": "Please try again."
        case .Couldnt_find_Data:
            return  L102Language.currentAppleLanguage() == "ar" ? "لا توجد بيانات": "Couldn't find Data"
        case .NO_Data_to_Preview:
            return  L102Language.currentAppleLanguage() == "ar" ? "عفوا لايوجد بيانات للعرض":  "NO Data to Preview"
        case .Couldnt_found_data:
            return  L102Language.currentAppleLanguage() == "ar" ? "لا يوجد بيانات بهذا التصنيف": "Couldn't found data for the Selected Category"
        case .Cannot_get_runner_position:
            return  L102Language.currentAppleLanguage() == "ar" ? "لانستطيع ايجاد موقع السائق": "Cannot get runner position"
        case .Error:
            return  L102Language.currentAppleLanguage() == "ar" ? "خطأ": "Error"
        case .Couldnt_find_the_runner_PhoneNumber:
            return  L102Language.currentAppleLanguage() == "ar" ? "لم يتم ايجاد رقم السائق": "Couldn't find the runner PhoneNumber"
        case .Sorry:
            return  L102Language.currentAppleLanguage() == "ar" ? "عفوا": "Sorry"
        case .Cancel_Order:
            return  L102Language.currentAppleLanguage() == "ar" ? "الغاء الطلب": "Cancel Order"
        case .Cancel_Order_:
            return  L102Language.currentAppleLanguage() == "ar" ? "؟الغاء الطلب": "Cancel Order ?"
        case .Cancelled_By_Resturant:
            return  L102Language.currentAppleLanguage() == "ar" ? "تم الإلغاء بواسطةالمطعم": "Order Cancelled by Restaurent"
        case .Cancelled_By_Me:
            return  L102Language.currentAppleLanguage() == "ar" ? "تم الإلغاء بواسطتك": "Order Cancelled by me"
        case .Order_Cancelled_By_Runner:
            return  L102Language.currentAppleLanguage() == "ar" ? "تم الإلغاء بواستطك": "Order Cancelled by runner"
        case .Order_Cancelled_By_User:
            return  L102Language.currentAppleLanguage() == "ar" ? "تم الإلغاء المستخدم": "Order Cancelled by User"
        case .Couldnt_find_phone:
            return  L102Language.currentAppleLanguage() == "ar" ? "لم نستطيع ايجاد رقم الهاتف": "Couldn't find the Client Phone Number"
        case .Address_is_required:
            return  L102Language.currentAppleLanguage() == "ar" ? "العنوان مطلوب ": "Address is required"
        case .Phone_number_is_required:
            return  L102Language.currentAppleLanguage() == "ar" ? "رقم الهاتف مطلوب": "Phone number is required"
        case .No_Changes_has_Been_Made:
            return  L102Language.currentAppleLanguage() == "ar" ? "لا يوجد اي تغييرات": "No Changes has Been Made"
        case .Youـwillـbeـnotified:
            return  L102Language.currentAppleLanguage() == "ar" ? "سيتم اشعارك حالما تعتمد التحديثات": "You will be notified as soon as Your updates been approved"
        case .Done:
            return  L102Language.currentAppleLanguage() == "ar" ? "تم": "Done"
        case .Attension:
            return  L102Language.currentAppleLanguage() == "ar" ? "تنبيه": "Attension"
        case .Are_you_sure:
            return  L102Language.currentAppleLanguage() == "ar" ? "هل انت متأكد": "Are you Sure"
        case .Empty_Field:
            return  L102Language.currentAppleLanguage() == "ar" ? "حقل فارغ": "Empty Field"
        case .Name_Field_Can_not_be_Empty:
            return  L102Language.currentAppleLanguage() == "ar" ? "حقل الإسم لايجب ان يكون فارغ": "Name_Field_Can't_be_Empty"
        case .UserName_Can_not_be_Empty:
            return  L102Language.currentAppleLanguage() == "ar" ? "حقل اللقب لايجب ان يكون فارغ": "UserName Field Can't be Empty"
        case .Invalid_Email:
            return  L102Language.currentAppleLanguage() == "ar" ? "صيغه غير صحيحه بالبريد الإلكتروني": "invalid Email"
        case .PhoneNumber_Can_not_be_Empty:
            return  L102Language.currentAppleLanguage() == "ar" ? "حقل رقم الهاتف لايجب ان يكون فارغ": "UserName Field Can't be Empty"
        case .Invalid_Password_:
            return  L102Language.currentAppleLanguage() == "ar" ? "كلمه المرور غير صحيحه ,يجب ان تحتوي كلمه المرور علي ٨ احرف علي الاقل/ ١٢ علي الاكثر ": "invalid Password,Password has to be more than 8 & less than 12 characters "
        case .Could_Not_Send_Email :
            return  L102Language.currentAppleLanguage() == "ar" ? "لم نستطع إرسال البريد الإلكتروني": "Could Not Send Email"
        case .Your_device_could_not_send_E_mail :
            return  L102Language.currentAppleLanguage() == "ar" ? "لم نستطع إرسال البريد الإلكتروني, من فضلك تفقد إعدادات الجهاز": "Your device could not send e-mail.  Please check e-mail configuration and try again."
        case .Field_Can_not_be_Empty :
            return  L102Language.currentAppleLanguage() == "ar" ? "ذلك الحقل مطلوب": "Field Can't be Empty"
            
        case .Pickup_Location_is_Required :
            return  L102Language.currentAppleLanguage() == "ar" ? "مكان الإستلام مطلوب": "Pickup Location is Required"
        case .Shop_Name_is_Required :
            return  L102Language.currentAppleLanguage() == "ar" ? "اسم المحل مطلوب": "Shop Name is Required"
        case .Order_Cannot_be_Empty :
            return  L102Language.currentAppleLanguage() == "ar" ? "الطلب لا يمكن ان يكون فارغ": "Order Can't be Empty"
            
        case .No_Orders_ :
            return  L102Language.currentAppleLanguage() == "ar" ? "لا توجد طلبات!؟": "No Orders?!"
        case .You_have_to_have_at_least_one_order_Request  :
            return  L102Language.currentAppleLanguage() == "ar" ? "يجب ان يوجد لديك طلب واحد علي الأقل": "You have to have at least one order Request"
        case .No_Dropoff_ :
            return  L102Language.currentAppleLanguage() == "ar" ? "لا يوجد مكان استلام!؟": "No Dropoff?!"
        case .You_have_to_have_to_set_a_Dropoff_Point :
            return  L102Language.currentAppleLanguage() == "ar" ? "يجب ان تختار مكان التسليم": "You have to have to set a Dropoff Point"
        case .Warning :
            return  L102Language.currentAppleLanguage() == "ar" ? "تحذير": "Warning"
        case .Invalid_Email_Format :
            return  L102Language.currentAppleLanguage() == "ar" ? "صيغه الايميل غير صحيح": "invalid Email Format"
        case .Password_has_to_contain_more_than_characters :
            return  L102Language.currentAppleLanguage() == "ar" ? "كلمه المرور يجب ان تكون اكبر من ٨ احرف": "Password has to contain more than 8 characters"
        case .Please_Check_your_E_mail :
            return  L102Language.currentAppleLanguage() == "ar" ? "من فضلك تحقق من البريد الإلكتروني الخاص بك": "Please Check your E-mail"
        case .Are_you_sure_you_want_to_call :
            return  L102Language.currentAppleLanguage() == "ar" ? "الاستمرار والاتصال بذلك الرقم ": "Are you sure you want to call"
        case .Yes :
            return  L102Language.currentAppleLanguage() == "ar" ? "نعم": "Yes"
        case .No :
            return  L102Language.currentAppleLanguage() == "ar" ? "لا": "No"
        case .Allow_Camera_Access_will_relaunch_the_app :
            return  L102Language.currentAppleLanguage() == "ar" ? "تفعيل الكاميرا سوف يقوم بإعاده تشغيل الجهاز": "Allow Camera Access will relaunch the app"
            
            
        case .This_app_isnot_authorized_to_use_Camera :
            return  L102Language.currentAppleLanguage() == "ar" ? "ذلك البرنامج غير مصرح له باستخدام الكاميرا,تفقد الاعدادات": "This app is not authorized to use Camera."
        case .Setting :
            return  L102Language.currentAppleLanguage() == "ar" ? "الإعدادات": "Setting"
        case .Success :
            return  L102Language.currentAppleLanguage() == "ar" ? "نجحت العمليه": "Success"
        case .Your_Order :
            return  L102Language.currentAppleLanguage() == "ar" ? "طلبك؟": "Your_Order?"
        case .Please_input_your_Order :
            return  L102Language.currentAppleLanguage() == "ar" ? "من فضلك قم بإدخال طلبك": "Please input your Order."
        case .Confirm :
            return  L102Language.currentAppleLanguage() == "ar" ? "تأكيد": "Confirm"
        case .Are_you_sure_you_wanna_delete_this_order :
            return  L102Language.currentAppleLanguage() == "ar" ? "هل انت متاكد من رغبتك بالغاء الطلب؟": "Are you sure you wanna delete this order?"
        case .Photos_Gallery :
            return  L102Language.currentAppleLanguage() == "ar" ? "الإستوديو": "Photos Gallery"
            
        case .Camera :
            return  L102Language.currentAppleLanguage() == "ar" ? "كاميرا": "Camera"
            
        case .Select_your_image_from_ :
            return  L102Language.currentAppleLanguage() == "ar" ? "إختيار الصوره من : ": "Select your image from : "
        case .No_Camera :
            return  L102Language.currentAppleLanguage() == "ar" ? "لا توجد كاميرا": "No Camera"
        case .Sorry_This_Device_Has_No_Camera :
            return  L102Language.currentAppleLanguage() == "ar" ? "الجهاز لا يحتوي علي كاميرا": "Sorry, this device has no camera"
            
        case .Password_Doesnot_Match:
            return  L102Language.currentAppleLanguage() == "ar" ? "كلمته المرور غير متطابقه": "Password Doesn't Match"
            
            
            
            
        //  🤡 🐳
        case .Searching_for_Runner:
            return  L102Language.currentAppleLanguage() == "ar" ? "جاري البحث عن سائق...": "Searching for Runner..."

            
        case .Delete:
            return  L102Language.currentAppleLanguage() == "ar" ? "مسح": "Delete"
            
        case .RequiredـField:
            return  L102Language.currentAppleLanguage() == "ar" ? "ذلك الحقل مطلوب": "Required Field!!"
            
        case .Order_has_Been_Submitted:
            return  L102Language.currentAppleLanguage() == "ar" ? "تم إرسال الطلب": "Order has Been Submitted"
            
 
            
        }
    }
}
