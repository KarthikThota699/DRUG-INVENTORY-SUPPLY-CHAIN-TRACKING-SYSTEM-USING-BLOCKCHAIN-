from django.contrib import admin
from django.urls import path
from . import views

urlpatterns = [
    path('updateStatusOFView/',view=views.updateStatusOFView,name="updateStatusOFView"),
    path('shipLogin/',view=views.shipLoginHtml,name="shipLogin"),
    path('deliveryLogin/',view=views.deliveryLogin,name="deliveryLogin"),
    path('loginBtnAdmin/',view=views.loginBtnAdmin,name="loginBtnAdmin"),
    path('adminLogin/',view=views.adminLogin,name="adminLogin"),
    path('searchOptionsView/',view=views.searchOptionsView,name="searchOptionsView"),
    path('', view=views.index,name='Index'),
    path('signup/',view=views.signup,name='signup'),
    path('signupSubmit/',view=views.signupSubmit,name='signupSubmit'),
    path('test/',view=views.testPage,name="test"),
    path('loginBtn',view=views.loginSubmit,name="loginBtn"),
    path('addProduct/',view=views.addProduct,name="addProduct"),
    path('viewItems/',view=views.viewItems,name="viewItems"),
    path('adminCart/',view=views.adminCart,name="adminCart"),
    path('logout/',view=views.logout,name='logout'),
    path('Checkout/',view=views.checkout,name="Checkout"),
    path('submit/',view=views.checkOutSubmit,name="submit"),
    path('UserHistory/',view=views.UserHistory,name="UserHistory"),
    path('profile/',view=views.profile,name="profile"),
    path('updateProfile/' ,view=views.updateProfile,name="updateProfile"),
    path('submitUpdate/',view=views.submitUpdate,name="submitUpdate"),
    path('updateqty/',view=views.updateQty,name="updateQty"),
    path('search/',view=views.searchOptions,name="search"),
    path('searchOrder/',view=views.searchOrder,name="searchOrder")
    ]
