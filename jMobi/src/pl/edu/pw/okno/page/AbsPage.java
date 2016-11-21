package pl.edu.pw.okno.page;

import com.codename1.ui.Command;
import com.codename1.ui.FontImage;
import com.codename1.ui.Form;
import com.codename1.ui.Image;
import com.codename1.ui.events.ActionEvent;
import com.codename1.ui.plaf.UIManager;

public abstract class AbsPage implements NavigationPage {

	protected Form page;
	private boolean initialized = false; /* set content of page only once */
	private boolean doNotShow = false;

	public AbsPage(Form form) {
		page = form;
	}

	public final void doNotShow() {
		doNotShow = true;
	}

	public final void show() {
		if (!getPage().isVisible()) {
			if (!initialized) {
				setContent();
				initialized(true);
			}
			if (!doNotShow) {
				getPage().showBack();
			}
		}
	}

	protected abstract void setContent();

	protected Form getPage() {
		return page;
	}

	public void setBackCommand(Form previousPage) {
		Command back = new Command("") {

			@Override
			public void actionPerformed(ActionEvent evt) {
				previousPage.showBack();
			}

		};
		Image img = FontImage.createMaterial(FontImage.MATERIAL_ARROW_BACK, UIManager.getInstance().getComponentStyle("TitleCommand"));
		back.setIcon(img);
		page.getToolbar().addCommandToLeftBar(back);
		page.getToolbar().setTitleCentered(true);
		page.setBackCommand(back);
	}

	private void initialized(boolean initialized) {
		this.initialized = initialized;
	}

}