package com.android.internal.telephony;

import android.content.Context;
import android.os.Message;
import android.os.Parcel;
import android.text.TextUtils;
import android.telephony.Rlog;
import android.telephony.SignalStrength;

import com.android.internal.telephony.RILConstants;
import com.android.internal.telephony.Sbmcgm;
import com.android.internal.telephony.uicc.IccCardApplicationStatus;
import com.android.internal.telephony.uicc.IccCardStatus;

/**
 * {@hide}
 */
public class SBMQualcommRIL extends RIL implements CommandsInterface {

    static final int RIL_REQUEST_IMS_REGISTRATION_STATE = 109;
    static final int RIL_REQUEST_IMS_SEND_SMS = 110;
    static final int RIL_REQUEST_GET_DATA_CALL_PROFILE = 111;
    static final int RIL_REQUEST_SET_UICC_SUBSCRIPTION = 118;
    static final int RIL_REQUEST_SET_DATA_SUBSCRIPTION = 119;
    static final int RIL_REQUEST_GET_UICC_SUBSCRIPTION = 120;
    static final int RIL_REQUEST_GET_DATA_SUBSCRIPTION = 121;
    static final int RIL_UNSOL_RESPONSE_IMS_NETWORK_STATE_CHANGED = 1036;
    static final int RIL_UNSOL_TETHERED_MODE_STATE_CHANGED = 1037;

    boolean RILJ_LOGV = true;
    boolean RILJ_LOGD = true;

    public SBMQualcommRIL(Context context, int networkMode, int cdmaSubscription) {
        super(context, networkMode, cdmaSubscription);
    }

    @Override
    protected Object
    responseSignalStrength(Parcel p) {
        int gsmSignalStrength = p.readInt();
        int gsmBitErrorRate = p.readInt();
        int gsmRscp = p.readInt();
        int gsmEcno = p.readInt();
        int cdmaDbm = p.readInt();
        int cdmaEcio = p.readInt();
        int evdoDbm = p.readInt();
        int evdoEcio = p.readInt();
        int evdoSnr = p.readInt();
        int lteSignalStrength = p.readInt();
        int lteRsrp = p.readInt();
        int lteRsrq = p.readInt();
        int lteRssnr = p.readInt();
        int lteCqi = p.readInt();
        int tdScdmaRscp = p.readInt();
        boolean isGsm = (p.readInt() != 0);

        return new SignalStrength(gsmSignalStrength,
                                  gsmBitErrorRate,
                                  cdmaDbm,
                                  cdmaEcio,
                                  evdoDbm,
                                  evdoEcio,
                                  evdoSnr,
                                  lteSignalStrength,
                                  lteRsrp,
                                  lteRsrq,
                                  lteRssnr,
                                  lteCqi,
                                  tdScdmaRscp,
                                  isGsm);
    }

    @Override
    protected Object
    responseIccCardStatus(Parcel p) {
        IccCardApplicationStatus appStatus;

        IccCardStatus cardStatus = new IccCardStatus();
        cardStatus.setCardState(p.readInt());

        //cardStatus.setErrorCode(p.readInt());
        p.readInt();

        cardStatus.setUniversalPinState(p.readInt());
        cardStatus.mGsmUmtsSubscriptionAppIndex = p.readInt();
        cardStatus.mCdmaSubscriptionAppIndex = p.readInt();

        cardStatus.mImsSubscriptionAppIndex = p.readInt();

        int numApplications = p.readInt();

        // limit to maximum allowed applications
        if (numApplications > IccCardStatus.CARD_MAX_APPS) {
            numApplications = IccCardStatus.CARD_MAX_APPS;
        }
        cardStatus.mApplications = new IccCardApplicationStatus[numApplications];

        for (int i = 0 ; i < numApplications ; i++) {
            appStatus = new IccCardApplicationStatus();
            appStatus.app_type       = appStatus.AppTypeFromRILInt(p.readInt());
            appStatus.app_state      = appStatus.AppStateFromRILInt(p.readInt());
            appStatus.perso_substate = appStatus.PersoSubstateFromRILInt(p.readInt());
            appStatus.aid            = p.readString();
            appStatus.app_label      = p.readString();
            appStatus.pin1_replaced  = p.readInt();
            appStatus.pin1           = appStatus.PinStateFromRILInt(p.readInt());
            appStatus.pin2           = appStatus.PinStateFromRILInt(p.readInt());
            cardStatus.mApplications[i] = appStatus;
        }
        return cardStatus;
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

    /**
     * {@inheritDoc}
     */
    @Override
    public void getCellInfoList(Message result) {
        if (RILJ_LOGD) riljLog("[STUB] > getCellInfoList");
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void setCellInfoListRate(int rateInMillis, Message response) {
        if (RILJ_LOGD) riljLog("[STUB] > setCellInfoListRate");
    }

    public void getImsRegistrationState(Message result) {
        RILRequest rr = RILRequest.obtain(RIL_REQUEST_IMS_REGISTRATION_STATE, result);

        if (RILJ_LOGD) {
            riljLog(rr.serialString() + "> " + requestToString(rr.mRequest));
        }
        send(rr);
    }

    public void setUiccSubscription(int slotId, int appIndex, int subId,
            int subStatus, Message result) {
        //Note: This RIL request is also valid for SIM and RUIM (ICC card)
        RILRequest rr = RILRequest.obtain(RIL_REQUEST_SET_UICC_SUBSCRIPTION, result);

        if (RILJ_LOGD) riljLog(rr.serialString() + "> " + requestToString(rr.mRequest)
                + " slot: " + slotId + " appIndex: " + appIndex
                + " subId: " + subId + " subStatus: " + subStatus);

        rr.mParcel.writeInt(slotId);
        rr.mParcel.writeInt(appIndex);
        rr.mParcel.writeInt(subId);
        rr.mParcel.writeInt(subStatus);

        send(rr);
    }

    public void setDataSubscription(Message result) {
        RILRequest rr = RILRequest.obtain(RIL_REQUEST_SET_DATA_SUBSCRIPTION, result);
        if (RILJ_LOGD) riljLog(rr.serialString() + "> " + requestToString(rr.mRequest));
        send(rr);
    }

    public void
    getDataCallProfile(int appType, Message result) {
        RILRequest rr = RILRequest.obtain(
                RIL_REQUEST_GET_DATA_CALL_PROFILE, result);

        // count of ints
        rr.mParcel.writeInt(1);
        rr.mParcel.writeInt(appType);

        if (RILJ_LOGD) riljLog(rr.serialString() + "> " + requestToString(rr.mRequest)
                + " : " + appType);

        send(rr);
    }
}
