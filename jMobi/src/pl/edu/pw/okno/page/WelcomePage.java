package pl.edu.pw.okno.page;

import com.codename1.ui.ComponentGroup;
import com.codename1.ui.Form;
import com.codename1.ui.Label;
import com.codename1.ui.TextField;
import com.codename1.ui.layouts.BorderLayout;
import pl.edu.pw.okno.resource.User;
import pl.edu.pw.okno.resource.UserDto;

@MenuItem(itemName = "Dashboard", order = 0)
public class WelcomePage extends AbsPage {

	private static class LazyPage {
		private static final WelcomePage INSTANCE = new WelcomePage();
	}
	static final String USERNAME = "imię";
	static final String LASTNAME = "nazwisko";
	static final String EMAIL = "e-mail";
	static final String PHONE = "telefon";
	static final String BIRTHDAY = "data urodzin";
	
	public static WelcomePage getInstance() {
		return LazyPage.INSTANCE;
	}
	
	private WelcomePage() {
		super(new Form("Witaj"));
	}
	
	@Override
	protected void setContent() {
		setLayout();
		setForm(fetchUserData());
	}
	
	private UserDto fetchUserData() {
		UserDto userDto = null;
		try {
			User user = new User(Properties.getInstance().getUrl());
        	user.requestFor();
        	userDto = user.getResults();
        } catch(Exception ex) {
        	ex.printStackTrace();
        }
        return userDto;
	}

	private void setLayout() {
		BorderLayout layout = new BorderLayout();
		getPage().setLayout(layout);
		layout.setCenterBehavior(BorderLayout.CENTER_BEHAVIOR_CENTER);
	}
	
	private void setForm(UserDto userDto) {
		if (userDto == null) {
			return;
		}
		
        ComponentGroup userGroup = new ComponentGroup();
        
        userGroup.addComponent(new Label(USERNAME));
        TextField name = new TextField(userDto.getUsername());
        name.setEditable(false);
        userGroup.addComponent(name);
        
        userGroup.addComponent(new Label(LASTNAME));
        TextField lastname = new TextField(userDto.getLastname());
        lastname.setEditable(false);
        userGroup.addComponent(lastname);
        
        userGroup.addComponent(new Label(EMAIL));
        TextField email = new TextField(userDto.getEmail());
        email.setEditable(false);
        userGroup.addComponent(email);
        
        userGroup.addComponent(new Label(PHONE));
        TextField phone = new TextField(userDto.getPhone());
        phone.setEditable(false);
        userGroup.addComponent(phone);
        
        userGroup.addComponent(new Label(BIRTHDAY));
        TextField birth = new TextField(userDto.getBirthday());
        birth.setEditable(false);
        userGroup.addComponent(birth);
        
        userGroup.setScrollableY(true);
        getPage().addComponent(BorderLayout.CENTER, userGroup);
	}
	
}
