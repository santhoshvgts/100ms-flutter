package com.qa.pages.MeetingRoomPage.MenuDropDown;

import com.qa.BaseTest;
import io.appium.java_client.pagefactory.AndroidFindBy;
import io.appium.java_client.MobileElement;
import org.testng.Assert;

public class MuteAudioCustomRole extends BaseTest {

    //@iOSXCUITFindBy(accessibility = "Mute All")
    @AndroidFindBy(accessibility = "Mute All")
    public MobileElement muteAllBtn;

    //@iOSXCUITFindBy(accessibility = "Mute All")
    @AndroidFindBy(accessibility = "Successfully Muted All")
    public MobileElement muteAllNotification;

    public void click_muteAllBtn() throws InterruptedException {
        Assert.assertTrue(muteAllBtn.isDisplayed());
        muteAllBtn.click();
        Thread.sleep(3000);
    }
}
