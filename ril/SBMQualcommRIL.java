package com.android.internal.telephony;

import android.content.Context;
import android.os.Message;
import android.text.TextUtils;
import android.telephony.Rlog;

import com.android.internal.telephony.RILConstants;
import com.android.internal.telephony.Sbmcgm;

/**
 * {@hide}
 */
public class SBMQualcommRIL extends QualcommSharedRIL implements CommandsInterface {
    boolean RILJ_LOGV = true;
    boolean RILJ_LOGD = true;

    public SBMQualcommRIL(Context context, int networkMode, int cdmaSubscription) {
        super(context, networkMode, cdmaSubscription);
    }

    @Override
    public void
    setupDataCall(String radioTechnology, String profile, String apn,
                  String user, String password, String authType, String protocol,
                  Message result) {
        if (apn.equals("fourgsmartphone")) {
          if (user == null || TextUtils.isEmpty(user)) {
            user = Sbmcgm.getEncryptionId(mContext);
          }
          if (password == null || TextUtils.isEmpty(password)) {
            password = Sbmcgm.getEncryptionPasswd(mContext);
          }
          Rlog.d("SBMQualcommRIL:", "user: " + user + " password: " + password);
        }
        super.setupDataCall(radioTechnology,
                            profile,
                            apn,
                            user,
                            password,
                            authType,
                            protocol,
                            result);
    }
}
