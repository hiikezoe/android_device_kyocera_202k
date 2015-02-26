package com.android.internal.telephony;

import android.content.Context;
import android.telephony.TelephonyManager;
import android.telephony.Rlog;

public class Sbmcgm {
  static {
    try {
      System.loadLibrary("sbmcgm-jni");
    } catch (UnsatisfiedLinkError ule) {
      Rlog.d("Sbmcgm", "WARNING: Could not load sbmcgm-jni");
    }
  }

  public static String getEncryptionId(Context context) {
    String phoneNumber;
    String IMEI;
    String IMSI;
    TelephonyManager telephonyManager;

    telephonyManager = (TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE);

    phoneNumber = telephonyManager.getLine1Number();
    phoneNumber.substring(0, 11);
    if (phoneNumber.length() > 11) {
      phoneNumber = phoneNumber.substring(0, 11);
    }

    IMEI = telephonyManager.getDeviceId();
    if (IMEI.length() > 14) {
      IMEI = IMEI.substring(0, 14);
    }

    IMSI = telephonyManager.getSubscriberId();
    if (IMSI.length() > 15) {
      IMSI = IMSI.substring(0, 15);
    }

    return sbmcgmGenId(phoneNumber, IMEI, IMSI);
  }

  public static String getEncryptionPasswd(Context context) {
    String ICCID;
    TelephonyManager telephonyManager;

    telephonyManager = (TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE);

    ICCID = telephonyManager.getSimSerialNumber();
    if (ICCID.length() > 19) {
      ICCID = ICCID.substring(0, 19);
    }

    return sbmcgmGenPasswd(ICCID);
  }

  private native static String sbmcgmGenId(String phoneNumber , String IMEI, String IMSI);
  private native static String sbmcgmGenPasswd(String ICCID);
}
