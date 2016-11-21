package pl.edu.pw.okno.page;

import com.codename1.ui.Command;
import com.codename1.ui.FontImage;
import com.codename1.ui.Form;
import com.codename1.ui.Image;
import com.codename1.ui.events.ActionEvent;
import com.codename1.ui.plaf.UIManager;

public abstract class AbsPage implements NavigationPage {

	protected Form page;
	private boolean pageInitialized = false; /* set content of page only once */
	private boolean displayable = true;

	public AbsPage(Form form) {
		page = form;
	}

	public final void show() {
		if (!getPage().isVisible()) {
			if (!isReady()) {
				setContent();
				ready();
			}
			if (isReady() && isDisplayable()) {
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

	protected final void notDisplayable() {
		displayable = false;
	}

	private boolean isDisplayable() {
		return displayable;
	}

	private void ready() {
		this.pageInitialized = true;
	}

	private boolean isReady() {
		return this.pageInitialized;
	}

}