package com.qa.pages.MeetingRoomPage.MenuDropDown;

import com.qa.pages.MeetingRoomPage.MeetingRoom;
import io.appium.java_client.pagefactory.AndroidFindBy;
import io.appium.java_client.pagefactory.iOSXCUITFindBy;
import io.appium.java_client.MobileElement;
import org.testng.Assert;

public class HeroMode extends MeetingRoom {

    @iOSXCUITFindBy(accessibility = "Hero Mod")
    @AndroidFindBy(accessibility = "Hero Mode")
    public MobileElement heroModeBtn;

    public void click_heroModeBtn() throws InterruptedException {
        Assert.assertTrue(heroModeBtn.isDisplayed());
        heroModeBtn.click();
        Thread.sleep(3000);
    }
}
