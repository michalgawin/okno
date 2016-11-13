package pl.edu.pw.okno.page;

import com.codename1.io.Log;
import com.codename1.ui.*;
import com.codename1.ui.layouts.BorderLayout;
import com.codename1.ui.validation.RegexConstraint;
import com.codename1.ui.validation.Validator;
import pl.edu.pw.okno.exc.AuthError;
import pl.edu.pw.okno.exc.PageError;
import pl.edu.pw.okno.resource.Authentication;

public class LoginPage extends AbsPage {
	
	private static final LoginPage INSTANCE = new LoginPage();
	
	static private final String LIMIT_NOT_REACHED = "Niespełniony warunek minimalnej długości";
	
	static private final String USERNAME = "użytkownik";
	static private final String USERNAME_HINT = "Nazwa użytkownika";
	static private final String USERNAME_LIMIT = ".+";
	
	static private final String PASSWORD = "hasło";
	static private final String PASSWORD_HINT = "Hasło użytkownika";
	static private final String PASSWORD_LIMIT = ".+";
	
	static private final int FIELD_LIMIT = 64;
	
	private final TextField username;
	private final TextField password;
	private final Button accept;
	private final Page dashboardPage;
	private final Validator validator;
	
	public static LoginPage getInstance() {
		return INSTANCE;
	}
	
	private LoginPage() {
		super(new Form("OKNO"));

		try {
			Authentication auth = new Authentication(Properties.getInstance().getUrl());
			auth.setAuthorization("");
		} catch (AuthError e) {
		}
		
		username = new TextField("michal.gawin", USERNAME_HINT, FIELD_LIMIT, TextField.ANY);
		password = new TextField("haslo", PASSWORD_HINT, FIELD_LIMIT, TextField.PASSWORD);
		accept = new Button("Zaloguj");
		accept.addActionListener((e) -> login());
		dashboardPage = WelcomePage.getInstance();
		validator = new Validator();

		setPage();
	}
	
	protected void setContent() {
	}
	
	protected void setPage() {
		setLayout();
        getPage().addComponent(BorderLayout.CENTER, credentialFields());
        
        setFormValidation();
	}
	
	private void setLayout() {
		BorderLayout layout = new BorderLayout();
		getPage().setLayout(layout);
        layout.setCenterBehavior(BorderLayout.CENTER_BEHAVIOR_CENTER);
	}
	
	private ComponentGroup credentialFields() {
		ComponentGroup userGroup = new ComponentGroup();
        userGroup.addComponent(new Label(USERNAME));
        userGroup.addComponent(username);
        userGroup.addComponent(new Label(PASSWORD));
        userGroup.addComponent(password);
        userGroup.addComponent(accept);
        userGroup.setScrollableY(true);
        
        return userGroup;
	}
	
	private void setFormValidation() {
		addUsernameValidation();
		addPasswordValidation();
		applyValidation();
	}
	
	private void addUsernameValidation() {
		validator.addConstraint(username, new RegexConstraint(USERNAME_LIMIT, LIMIT_NOT_REACHED));
	}
	
	private void addPasswordValidation() {
		validator.addConstraint(password, new RegexConstraint(PASSWORD_LIMIT, LIMIT_NOT_REACHED));
	}
	
	private void applyValidation() {
		Validator.setValidateOnEveryKey(true);
		validator.addSubmitButtons(accept);
	}
	
	private void login() {
		try {
			Authentication auth = createAuthKey();
			String token = requestForToken(auth);
			auth.setAuthorization(token);
			openDashboard();
		} catch (Exception ex) {
			Log.p(ex.getMessage(), Log.WARNING);
			DisplayLoginError();
		}
	}
	
	private Authentication createAuthKey() throws AuthError {
		Authentication token = new Authentication(Properties.getInstance().getUrl());
		token.setAuthentication(username.getText(), password.getText());
		return token;
	}
	
	private String requestForToken(Authentication token) throws AuthError {
		token.requestFor();
		if (!token.isOK()) {
			throw new AuthError("Invalid response: no token");
		}
		return token.getResults();
	}
	
	private void openDashboard() throws PageError {
		if (dashboardPage != null) {
			dashboardPage.show();
			return;
		}
		throw new PageError("Next page not defined");
	}
	
	private void DisplayLoginError() {
		Dialog.show("Błąd logowania", "Nie można zalogować użytkownika.\nSpróbuj ponownie.", "OK", null);
	}
	
}
