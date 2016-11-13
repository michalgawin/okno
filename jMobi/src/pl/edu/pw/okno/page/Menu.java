package pl.edu.pw.okno.page;

import com.codename1.ui.NavigationCommand;
import com.codename1.ui.events.ActionEvent;

import java.util.*;

/**
 * Created by michal on 15.10.2016.
 */
public class Menu {

    private static final String DASHBOARD = "Dashboard";
    private static final String GENERAL_PUBLICATION = "Ogłoszenia";
    private static final String SPECIFIC_PUBLICATION = "Ogłoszenia wydziałowe";
    private static final String CALENDAR = "Kalendarz";
    private static final String SUBJECTS = "Przedmioty";
    private static final String LOGOUT = "Wyloguj";

    private static Map<String, AbsPage> items = new LinkedHashMap<String, AbsPage>()
    {{
        put(DASHBOARD, WelcomePage.getInstance());
        put(GENERAL_PUBLICATION, GeneralPublicationPage.getInstance());
        put(SPECIFIC_PUBLICATION, DepartmentsPage.getInstance());
        put(CALENDAR, CalendarPage.getInstance());
        put(SUBJECTS, SubjectsPage.getInstance());
        put(LOGOUT, LoginPage.getInstance());
    }};

    public static void setSideMenu() {
        for (Map.Entry<String, AbsPage> entry : items.entrySet()) {
            setSideMenu(entry.getValue());
        }
    }

    private static void setSideMenu(AbsPage page) {
        for (Map.Entry<String, AbsPage> entry : items.entrySet()) {
            NavigationCommand navigationCommand = new NavigationCommand(entry.getKey()) {
                @Override
                public void actionPerformed(ActionEvent evt) {
                    entry.getValue().show();
                }
            };
            navigationCommand.setNextForm(entry.getValue().getPage());
            page.getPage().getToolbar().addCommandToSideMenu(navigationCommand);
        }
    }

}
